# -*- coding:utf-8 -*-
import unittest
import os
import sys

project_dir = os.path.abspath(os.path.dirname(os.path.dirname(__file__)))
project_dir = '/'.join(project_dir.split('/')[:-1])
sys.path.insert(0, project_dir)
os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'

from views import gcc, calc_filter, prepare_filter
from yandex.models import MessageFilter, MessageSearch, FileFilter, FileSearch

class TestGccFunction(unittest.TestCase):
    def setUp(self):
        pass
    def test_item_filter(self):
        prep, msg = gcc('ts="123"')
        self.assertEquals(prep, [['=', '0', 'ts', '123']], msg="Не понимает равенства")
    def test_oper_filter(self):    
        prep, msg = gcc('sp="123"+gr="123"')
        self.assertEquals(prep, [['=', '0', 'sp', '123'], 
                                ['=', '1', 'gr', '123'], 
                                ['+', '0', '0', '1']] , msg="Не понимает оператор")
    def test_braket_filter(self):
        prep, msg = gcc('sp="1"+((sp="1"-sp="2")&sp="1")')
        self.assertEquals(prep, [['=', '0', 'sp', '1'], 
                                ['=', '1', 'sp', '2'], 
                                ['-', '2', '0', '1'], 
                                ['&', '3', '2', '0'], 
                                ['+', '0', '0', '3']] , msg="Не понимает скобки")
    def test_error_filter(self):
        prep, msg = gcc ('sp="1"sd')
        self.assertEqual(prep, False, msg="Не воспринимаю ошибки при разборе")

class TestGetItemFunction(unittest.TestCase):
    def test_gr_add(self):
        prep, mes = calc_filter(gcc('gr="%s"+gr="%s"' %(GR1, GR2))[0])
        self.assertEqual(prep, set([GR1, GR2]), 
                    msg = 'Не могу выбрать группу или выполнить сложение')

    def test_sp_desc_gr(self):
        prep, mes = calc_filter(gcc('sp="%s"-gr="%s"'%(SP, GR1))[0])
        tmp = SP_A -set([GR1,])
        self.assertEqual(prep, tmp, 
                    msg="Не могу выбрать специальность или выполнить исключение")

    def test_sp_fc_union(self):
        prep, mes = calc_filter(gcc('fc="%s"&sp="%s"'%(FC, SP))[0])
        self.assertEqual(prep, SP_A,
                    msg="Не могу выбрать факультет или выполнить объединение")

    def test_sy_gr_union(self):
        prep, mes = calc_filter(gcc('sp="%s"&(sy="%s"&gr="%s")'%(SP, SY, GR_Y))[0])
        self.assertEqual(prep, set([GR_Y,]), 
            msg="Не могу выбрать год обучения или выполнить двойное объединение")
    def test_error(self):
        prep, mes = calc_filter(gcc('gr="%s"+gr="%s"' %(GR1, GR2))[0])
        self.assertEqual(mes, False, 
            msg="Не могу обработать не правильное имя переменной")

class TestWriteFilter(unittest.TestCase):
    def test_error_filter_write(self):
        rec = MessageFilter( title = "Test Message",
                            message = "Test Message",
                            filter = 'gr="%s"+gr="%s"a'%(GR1, GR2),
                            live_time = '2020-01-01')
        gr_list, msg = prepare_filter(rec)
        self.assertEqual(gr_list, False, 
                    msg=" Не могу получить ошибку из компилятора ")

    def test_message_write(self):
        rec = MessageFilter( title = "Test Message",
                            message = "Test Message",
                            filter = 'gr="%s"+gr="%s"' %(GR1, GR2),
                            live_time = '2020-01-01')
        rec.save()
        list_1, mes = prepare_filter(rec)
        list_2 = MessageSearch.objects.filter(filter=rec).values_list('id_group')
        list_2 = set(map(lambda x: x[0], list_2))
        MessageSearch.objects.filter(filter=rec).delete()
        rec.delete()
        self.assertEqual(list_1, set([GR1, GR2]), 
                 msg="Сообщения! Не могу сформировать фильтр!")
        self.assertEqual(list_1, list_2, 
                msg="Сообщения! Не могу записать в таблицу с фильтрамми результат!")
    def test_file_write(self):
        rec = FileFilter(   name = "Test Message",
                            descr = "Test Message",
                            path = "Test Message",
                            filter = 'gr="%s"+gr="%s"' %(GR1, GR2),
                            live_time = '2020-01-01')
        rec.save()
        list_1, mes = prepare_filter(rec)
        list_2 = FileSearch.objects.filter(filter=rec).values_list('id_group')
        list_2 = set(map(lambda x: x[0], list_2))
        FileSearch.objects.filter(filter=rec).delete()
        rec.delete()
        self.assertEqual(list_1, set([GR1, GR2]), 
                 msg="Файлы! Не могу сформировать фильтр!")
        self.assertEqual(list_1, list_2, 
                msg="Файлы! Не могу записать в таблицу с фильтрамми результат!")
    

# группы из специальности
GR1 = "7000000221"
GR2 = "7000000222"
#  набор для специальности 
SP = "0124"
SP_A = set([u'7000000221',u'7000000222',u'7000001522',u'7000001523',u'7000000623',u'7000000624',])
# факультет для специальности
FC = "70"
# год и группа начавшая обучения в этом году
SY  = "2010"
GR_Y = "7000000222"

if __name__ == '__main__':
    unittest.main()