# -*- coding:utf-8 -*-
__author__ = 'husky'

from django.shortcuts import render_to_response, redirect, get_object_or_404
from django.template import RequestContext
from django.http import HttpResponse
from django.utils.encoding import smart_str
from django.core.exceptions import ObjectDoesNotExist
from django.conf import settings

import re
import urllib
from datetime import datetime, timedelta

from wsutils.web_service import WebService

from yandex.forms import *
from yandex.models import *
from schedule.models import TeacherAdm
from ftp_service import ftp_upload, ftp_delete, ftp_exists, ftp_full_path
from ftplib import error_perm

from auth.decorators import can_access_service


CONTEN_DIR = 'content'

class FileManager(object):
    list_prep = []
    rec_id = None
    message = 'None'
    path = ''
    def get_list_teacher(self ,teacher_id):
        # список файлов для преподователя или контента
        if not teacher_id:
            self.message = 'Не заполнен код преподавателя'
            return False
        query_set = FileFilter.objects.filter(teacher=teacher_id)
        ret = []
        map(lambda x: ret.append({
                'id': x.id,    
                'name': x.name,
                'descr': x.descr,
                'teacher': x.teacher,
                'path': x.path,
                'filter': x.filter,
                'live_time': str(x.live_time)
            }) , query_set)
        self.list_prep = ret
        return True

    def get_list_student(self, group_id):
        ret =  {}
        query_file = FileSearch.objects.filter(id_group=group_id)
        for item in query_file:
            arr = ret.get(item.filter.teacher, [])
            arr.append([item.filter.name, item.filter.descr, item.filter.path])
            ret[item.filter.teacher] = arr
        ret_= []
        for item in ret.keys():
            if item == CONTEN_DIR:
                ret_.append(['АлтГТУ',ret[item]])
            else:    
                try:
                    rec = TeacherAdm.objects.get(pk=item)
                    ret_.append([str(rec),ret[item]])
                except:
                    ret_.append([item, ret[item]])
        return ret_

    def find_file(self, id=-1, path=False, name=False, teacher_id=False):
        try:
            rec = FileFilter.objects.get(id=id)
            return rec
        except:
            pass
        if name and teacher_id:    
            try:
                rec = FileFilter.objects.get(name=name, teacher=teacher_id)
                return rec
            except:
                pass
        if path:
            try:
                rec = FileFilter.objects.get(path=path)
                return rec
            except:
                pass
        raise Exception('Не могу найти запись')        

    def get_file(self, rec_file):
        return {'file_id': rec_file.id, 
                'name': rec_file.name,
                'descr': rec_file.descr,
                'teacher_id': rec_file.teacher,
                'path': rec_file.path,
                'filter': rec_file.filter,
                'live_time': str(rec_file.live_time)
                }


    def add_file(self, name, descr, teacher_id, filter, live_time, file):
        # file это то что приезжает в реквесте 
        if not name:
            self.message = 'Не заполнено имя на сайте'
            return False
        if not teacher_id:
            self.message = 'Не заполнен код преподавателя'
            return False
        if not filter:
            self.message = 'Не указан фильтр'
            return False
        if not file:
            self.message = 'Нет файла нечего сохранять'
            return False
        # если время жизни не указано сохраняем на время учёбы 4 года            
        if not live_time:
            live_time = str((datetime.today()+timedelta(days=365*4+1)).date())
        if datetime.strptime(live_time,'%Y-%m-%d') < datetime.now():
            self.message = 'Дата принудительного удаление уже прошла'
            return False 
        # контроль на существования преподавателя
        if teacher_id != CONTEN_DIR:
            try:
                TeacherAdm.objects.get(pk=teacher_id)
            except:
                self.message = 'Преподавателя не существует в базе'
                return False
        # контроль на совпадение  name 'имя на сайте' в базе
        try:
            FileFilter.objects.filter(teacher=teacher_id).get(name = name)
            self.message = u'Файл с таким именем на странице уже есть'
            return False
        except:    
            pass
        # создаём запись
        try:
            rec = FileFilter(name=name, 
                             descr=descr, 
                             teacher=teacher_id,
                             path='',
                             filter=filter,
                             live_time=live_time)
            rec.save()
        except Exception as e:
            self.message = ";".join(e.messages) 
            return False 
        # пробуем сформировать фильтр 
        self.list_prep, message = prepare_filter(rec)
        if not self.list_prep:           
            self.message = message
            # если нет удаляем запись
            rec.delete()
            return False
        # пробуем записать файл на фтп ++ контроль на совпадения имени на фтп 
        path, message =  ftp_upload(teacher_id, file)
        if not path:  
            # если нет удаляем и запись и фильтры
            self.delete_file(rec)
            self.message = message
            return False
        else:
            rec.path = path
            rec.save()
        self.message = "Ok"
        self.rec_id = rec.pk
        return True

    def edit_file(self, rec_file, name=None, descr=None, filter=None, live_time=None, file=None):
        self.rec_id = rec_file.id
        # проверяем на совпадение имени для сайта
        if name:
            try:
                FileFilter.objects.filter(teacher=teacher_id).get(name = name)
                if rec_file.name != name:
                    self.message = u'Файл с таким именем на странице уже есть'
                    return False
            except:    
                pass
            rec_file.name = name
        # проверяем есть ли файл с таким именем если совпадает с тем что был удаляем
        if file \
            and rec_file.path != ftp_full_path(rec_file.teacher, file.name) \
            and (ftp_exists(rec_file.teacher, file.name)): 
            self.message = "Имя файла уже есть"
            return False
        if descr:
            rec_file.descr = descr
        if live_time:
            if datetime.strptime(live_time,'%Y-%m-%d') < datetime.now():
                self.message = 'Дата принудительного удаление уже прошла'
                return False
            rec_file.live_time = live_time
        if filter:
            rec_file.filter = filter
        # вносим данные в запись 
        try:
            rec_file.save()
        except Exception as e:
            self.message = ";".join(e.messages) 
            return False
        if filter:
            self.list_prep, message = prepare_filter(rec_file)
            if not self.list_prep:           
                self.message = message 
                return False 
        if file:
            try: 
                ftp_delete(rec_file.path)
            except error_perm:
                pass # если нечего удалять не страшно
            path, message =  ftp_upload(rec_file.teacher, file)
            if not path:  
                # если нет удаляем и запись и фильтры
                self.delete_file(rec_file)
                self.message = message
                return False
            else:
                rec_file.path = path
                rec_file.save()
        self.message = "Ok"
        return True

    def delete_file(self, rec_file):
        # удаляем файл
        try: 
            ftp_delete(rec_file.path)
        except error_perm:
            pass # если нечего удалять не страшно  
        # удаляем фильтр
        FileSearch.objects.filter(filter=rec_file).delete()
        # удаляем запись
        rec_file.delete()

#-------------------------------------------------------------------------------
#                       Вёб сервисы
#------------------------------------------------------------------------------
# Для студентов
class MessageListService(WebService):
    def __init__(self, request, id, *args, **kwargs):
        super(MessageListService, self).__init__(request, *args, **kwargs)
        self.id_group = id

    def get_data(self):
        query_message = MessageSearch.objects.filter(id_group=self.id_group)
        ret = []
        for item in query_message:
            ret.append([item.filter.title, item.filter.message])
        return ret

class FileListService(WebService):
    def __init__(self, request, id, *args, **kwargs):
        super(FileListService, self).__init__(request, *args, **kwargs)
        self.group_id = id

    def get_data(self):
        fm = FileManager()
        return fm.get_list_student(self.group_id)

def get_message(request, id):
    return MessageListService(request, id).response()

def get_file(request, id):
    return FileListService(request, id).response()
# Для редактирования
# список файлов 
class FileEditListService(WebService):
    def get_data(self):
        fm = FileManager()
        if fm.get_list_teacher( urllib.unquote(self.request.REQUEST.get("teacher_id"))):
            return fm.list_prep
        else:
            raise Exception(smart_str(fm.message))
def file_edit_list(request):
    return FileEditListService(request).response()

class FileFindService(WebService):
    def get_data(self):
        fm = FileManager()
        rec = fm.find_file(urllib.unquote(self.request.REQUEST.get("file_id", '')),                        
                       urllib.unquote(self.request.REQUEST.get("path", '')),
                       urllib.unquote(self.request.REQUEST.get("name", '')),
                       urllib.unquote(self.request.REQUEST.get("teacher_id", ''))
                       )
        return fm.get_file(rec)

def find_file(request):   
    return FileFindService(request).response()

class FileAddService(WebService):  
    def get_data(self):
        fm = FileManager()
        if fm.add_file(urllib.unquote(self.request.REQUEST.get("name", '')), 
                       urllib.unquote(self.request.REQUEST.get("descr", '')), 
                       urllib.unquote(self.request.REQUEST.get("teacher_id", '')),  
                       urllib.unquote(self.request.REQUEST.get("filter", '')),
                       urllib.unquote(self.request.REQUEST.get("live_time", '')), 
                       self.request.FILES.get("upfile", False)):
            return [fm.rec_id, list(fm.list_prep)]
        else:
            raise Exception(smart_str(fm.message))
        
def add_file(request):
    return FileAddService(request).response()

class FileUpdateService(WebService):
    def get_data(self):    
        fm = FileManager()
        rec = fm.find_file(urllib.unquote(self.request.REQUEST.get("file_id", '')),                        
                       urllib.unquote(self.request.REQUEST.get("path", '')),
                       urllib.unquote(self.request.REQUEST.get("name", '')),
                       urllib.unquote(self.request.REQUEST.get("teacher_id", ''))
                       )
        if fm.edit_file(rec, 
                       urllib.unquote(self.request.REQUEST.get("name", '')), 
                       urllib.unquote(self.request.REQUEST.get("descr", '')),   
                       urllib.unquote(self.request.REQUEST.get("filter", '')),
                       urllib.unquote(self.request.REQUEST.get("live_time", '')), 
                       self.request.FILES.get("upfile", False)):
            return [fm.rec_id, list(fm.list_prep)]
        else:
            raise Exception(smart_str(fm.message))

def update_file(request):
    return FileUpdateService(request).response()

class FileDeleteService(WebService):
    def get_data(self):
        fm = FileManager()
        rec = fm.find_file(urllib.unquote(self.request.REQUEST.get("file_id", '')),                        
                       urllib.unquote(self.request.REQUEST.get("path", '')),
                       urllib.unquote(self.request.REQUEST.get("name", '')),
                       urllib.unquote(self.request.REQUEST.get("teacher_id", ''))
                       )
        fm.delete_file(rec)        
        return 'Ok'

def delete_file(request):
    return FileDeleteService(request).response()


# команда manage.py clear_db
def clear_search(): 
    query_set = MessageFilter.objects.filter(live_time__lte=datetime.today())
    MessageSearch.objects.filter(filter__in=query_set).delete()
    query_set = FileFilter.objects.filter(live_time__lte=datetime.today())
    FileSearch.objects.filter(filter__in=query_set).delete()


#------------------------------------------------------------------------------
#               интерфейс для построения фильтров
#------------------------------------------------------------------------------
'''
    faculty=323+chair=23452-(group=124314+group=34523452)+teacher=456789
    если по коду не находим принимаем за []
    переводим в последовательность действий

'''
# интерфейс 
@can_access_service('yandex')
def message_list(request):
    query_message = MessageFilter.objects.all()
    return render_to_response('yandex/message_list.html',
        context_instance=RequestContext(request, {
            'list': query_message
        }))

@can_access_service('yandex')
def message_add(request):
    error_mes = ''
    form = FormMessage(request.POST or None)
    if request.method == "POST":
        if form.is_valid():
            rec = form.save()
            list_prepare, mes = prepare_filter(rec)
            if list_prepare:
                return render_to_response('yandex/group_list.html',
                            context_instance=RequestContext(request, {
                                'list': list_prepare,
                                'message': rec.id
                                }))
            else:
                error_mes = mes

    return render_to_response('yandex/message_edit.html',
        context_instance=RequestContext(request,{
            'form': form,
            'error_mes': error_mes,
        }))

@can_access_service('yandex')
def message_edit(request, id):
    rec = get_object_or_404(MessageFilter, id=id)
    form = FormMessage(request.POST or None, instance=rec)
    error_mes = ''
    if request.method=="POST":
        if form.is_valid():
            rec = form.save()
            list_prepare, mes = prepare_filter(rec)
            if list_prepare:
                return render_to_response('yandex/group_list.html',
                            context_instance=RequestContext(request, {
                                'list': list_prepare,
                                'message': rec.id
                                }))
            else:
                error_mes = mes

    return render_to_response('yandex/message_edit.html',
        context_instance=RequestContext(request,{
            'form': form,
            'error_mes': error_mes,
        }))

@can_access_service('yandex')
def message_delete(request, id):
    rec = get_object_or_404(MessageFilter, id=id)
    form = FormMessage(instance=rec)
    error_mes = ''
    if request.POST.get('_delete_', False):
        #удалить из файла фильтрации
        MessageSearch.objects.filter(filter=rec).delete()
        rec.delete()
        return redirect('yandex.views.message_list')

    return render_to_response('yandex/message_edit.html',
        context_instance=RequestContext(request,{
            'form': form,
            'delete': True,
            }))

@can_access_service('yandex')
def file_list(request):
    fm = FileManager()
    fm.get_list_teacher(CONTEN_DIR)
    query = fm.list_prep
    return render_to_response('yandex/file_list.html',
        context_instance=RequestContext(request, {
            'list': query
        }))

@can_access_service('yandex')
def file_add(request):
    form = FormFile(request.POST or None)
    error_mes = ''
    if request.method == "POST":
        if form.is_valid():
            fm = FileManager()
            if fm.add_file(request.POST.get("name", False), 
                           request.POST.get("descr", False), 
                           CONTEN_DIR, 
                           request.POST.get("filter", False),
                           request.POST.get("live_time", False), 
                           request.FILES.get("upfile", False)):
                return render_to_response('yandex/group_list.html',
                         context_instance=RequestContext(request, {
                             'list': fm.list_prep,
                             'file': fm.rec_id
                             }))
            else:
                error_mes = fm.message
    return render_to_response('yandex/file_edit.html',
        context_instance=RequestContext(request,{
            'form': form,
            'error_mes': error_mes,
        }))

@can_access_service('yandex')
def file_edit(request, id):
    rec = get_object_or_404(FileFilter, id=id)
    # можно получить через класс Fm но пока особых условий для выбора нет проще так
    form = FormFile(request.POST or None, instance=rec)
    error_mes = ''
    if request.method=="POST":
        if form.is_valid():
            fm = FileManager()
            if fm.edit_file(rec, 
                           request.POST.get("name", False), 
                           request.POST.get("descr", False), 
                           request.POST.get("filter", False),
                           request.POST.get("live_time", False), 
                           request.FILES.get("upfile", False)):
                return render_to_response('yandex/group_list.html',
                        context_instance=RequestContext(request, {
                            'list': fm.list_prep,
                            'file': fm.rec_id
                            }))
            else:
                error_mes = fm.message

    return render_to_response('yandex/file_edit.html',
        context_instance=RequestContext(request,{
            'form': form,
            'path': rec.path,
            'error_mes': error_mes,
            }))

@can_access_service('yandex')
def file_delete(request, id):
    rec = get_object_or_404(FileFilter, id=id)
    # можно получить через класс Fm но пока особых условий для выбора нет проще так
    form = FormFile(instance=rec)
    if request.POST.get('_delete_', False):
        fm = FileManager()
        fm.delete_file(rec)
        return redirect('yandex.views.file_list')

    return render_to_response('yandex/file_edit.html',
        context_instance=RequestContext(request,{
            'form': form,
            'delete': True,
            'path' : rec.path,
            }))

def prepare_filter(rec_filter): #, request):
    """list_prepare = []
        list_prog = [
            ["=", "x1", "gr", "345"],
            ["=", "x2", "gr", "357"],
            ["+", "x", "x1", "x2"],
            ["=", "x1", "gr", "145"],
            ["-", "x", "x", "x1"],
        ] """
    list_prog, msg = gcc(rec_filter.filter)
    if not list_prog:
        return False, msg
    list_prepare, msg = calc_filter(list_prog)
    if msg:
        return False, msg
    if not list_prepare:
        return False, "Ни одна группа не попала в фильтр"
    if rec_filter.__class__.__name__ == "MessageFilter":
        MessageSearch.objects.filter(filter = rec_filter).delete()
        for item in list_prepare:
            rec_message = MessageSearch(id_group=item,
                                        filter=rec_filter)
            rec_message.save()
    
    if rec_filter.__class__.__name__ == "FileFilter":
        FileSearch.objects.filter(filter = rec_filter).delete()
        for item in list_prepare:
            rec_message = FileSearch(id_group=item,
                                    filter=rec_filter)
            rec_message.save()

    return list_prepare, ""

def calc_filter(comand):
    temp = {'0': []}
    for item in comand:
        # проходим по командам выполняем
        if item[0]== "=":
            list_prepare, msg  = _get_items_(item[2], item[3])
            if msg: # пробрасываем ошибку на уровень выше
                return False, msg
            else:    
                temp[item[1]] = list_prepare
        elif item[0]=='+':
            temp[item[1]] = set(temp[item[2]]) | set(temp[item[3]]) #_sum_items_(temp[item[2]], temp[item[3]])
        elif item[0]=='-':
            temp[item[1]] = set(temp[item[2]])-set(temp[item[3]])
        elif item[0]=='&':
            temp[item[1]] = set(temp[item[2]])& set(temp[item[3]])

    return temp['0'] , False

# маленький маленький компилятор много проходный т.к. на одно проходный ума не хватает :)
def gcc(filter):
    prog = []
    filter = filter.replace('\r','').replace('\n','').replace(' ','')
    # заменяем все присваивания на цифры
    # пишем конструкции вида
    # [ '=' , '1', 'gr', '70000032']
    pattern = re.compile(r'[a-z]+="\w+"',flags=re.U)
    # ищем строку определения
    find = pattern.search(filter)
    var_i = 0
    while find:
        # выносим из первоначальной строки
        filter = filter.replace(find.group(0), str(var_i))
        # разбираем на имя признака и значение
        com_pattern = re.compile(r'([a-z]+)="(\w+)"', flags=re.U)
        com = com_pattern.search(find.group(0))
        prog.append(["=", str(var_i), com.group(1), com.group(2)])
        var_i += 1
        # ищем строку определения
        find = pattern.search(filter.replace(' ',''))
    # ищем то что можно вычислить сразу
    pattern = re.compile(r'(\d+)([+\-&])(\d+)')
    find = pattern.search(filter)
    while find:
        prog.append([find.group(2), str(var_i), find.group(1), find.group(3)])
        filter = filter.replace(find.group(0), str(var_i))
        var_i += 1
        # чистим скобки вокруг одного значения
        pattern_br = re.compile(r'\((\d+)\)')
        find_br = pattern_br.search(filter)
        if find_br:
            filter = filter.replace(find_br.group(0), find_br.group(1))
        find = pattern.search(filter)
    if prog: #  если вообще ничего не понял 
        prog[len(prog)-1][1] = '0'
    else:
        return False , u"Ошибка при построении фильтра не могу разобрать "
    if filter.isdigit():
        return prog, ""
    else:
        return False , u"Ошибка при построении фильтра не могу разобрать %s" % filter


# Далее процедуры вытаскивания из других сервисов
GROUP = "gr"        # группа
FACULTY = "fc"      # факультет
START_Y = "sy"      # год начала обучения
SPECIAL = "sp"      # специальность

from copy import copy
from schedule.models import GroupAdm
from schedule.models import FacultyAdm
from schedule.models import Speciality

def _get_items_(that, what):
    if that == GROUP:
        # группу отдельную получаем
        try:
            rec_group = GroupAdm.objects.get(id=what)
            if rec_group.end_ob == 0:
                return [rec_group.id,], False
            else:
                return [], False
        except:
            return [], False
    elif that == FACULTY:
        # группы факультета факультеты
        try:
            rec_faculty = FacultyAdm.objects.get(id=what)
        except:
            return [], False
        query_gr = GroupAdm.objects.\
                        filter(faculty=rec_faculty).\
                        filter(end_ob=0).values_list('id',flat=True)
        return query_gr, False
    elif that == START_Y:
        # группы год обучения
        query_gr = GroupAdm.objects.\
                        filter(start_year=what).\
                        filter(end_ob=0).values_list('id',flat=True)
        return query_gr, False
    elif that == SPECIAL:
        # группы специальность
        try:
            rec_special = Speciality.objects.get(pk=what)
        except:
            return [], False
        query_gr = GroupAdm.objects.\
                        filter(speciality=rec_special).\
                        filter(end_ob=0).values_list('id',flat=True)
        return query_gr, False
    else:
        return False, u"Ошибка построения фильтра недопустимое имя %s  возможные имена gr, fc, sp, sy" % that

def find(request):
    what = request.GET.get('what', False)
    if what:
        list = []
        query_list = FacultyAdm.objects.filter(name__contains=what)
        prom = ["%s - %s %s" % (item.id, item.short_name.strip().ljust(7), item.name.strip()) for item in query_list]
        query_list = FacultyAdm.objects.filter(short_name__contains=what)
        prom += ["%s - %s %s" % (item.id, item.short_name.strip().ljust(7), item.name.strip()) for item in query_list]
        if prom: list += ["Факультеты (fc) \n"]+prom +['\n']    
        
        query_list = Speciality.objects.filter(name__contains=what)
        prom = ["%s - %s %s %s" % (item.id, item.short_name.strip().ljust(7), item.shifr.strip().ljust(7), item.name.strip()) for item in query_list]
        query_list = Speciality.objects.filter(short_name__contains=what)
        prom += ["%s - %s %s %s" % (item.id, item.short_name.strip().ljust(7), item.shifr.strip().ljust(7), item.name.strip()) for item in query_list]
        query_list = Speciality.objects.filter(shifr__contains=what)
        prom += ["%s - %s %s %s" % (item.id, item.short_name.strip().ljust(7), item.shifr.strip().ljust(7), item.name.strip()) for item in query_list]
        if prom : list += ["Специальности (sp)\n"] + prom +['\n']

        query_list = GroupAdm.objects.filter(end_ob=0).filter(name__contains=what)
        prom = ["%s - %s" % (item.id,item.name) for item in query_list]
        if prom :list += ['Группы (gr)\n'] + prom +['\n']
    else:
        list = []
    list += ["Факультеты (fc) \n"]
    list += ["Специальности (sp) \n"]
    list += ["Группы (gr)\n"]
    list += ["Год начал обучения (sy)\n", "Операции + - &\n"]
    return render_to_response('yandex/find_list.html', {'list': map(lambda x: x+'\n', list)})
