# -*- coding: utf8 -*-
import urllib
from json import JSONDecoder, JSONEncoder

from django.conf import settings
from django.http import HttpResponse
from django.http import HttpResponseForbidden
from django.utils.encoding import smart_str

__author__="scey"
__date__ ="$02.07.2010 15:44:42$"


class WebService(object):
    """
    Абстрактный класс веб-сервиса
    """
    request = None

    def __init__(self, request, *args, **kwargs):
        self.request = request

    def get_data(self):
        """Метод получения данных для возврата веб-сервисом"""
        raise NotImplementedError

    def can_access(self):
        """Метод проверки права обратиться к веб-сервису"""
        return True

    def response(self):
        """Формирование ответа веб-сервиса"""
        result = {'success': False, 'data': [], 'message': 'Fail'}
        if self.can_access():
            try:
                result['data'] = self.get_data()
                result['success'] = True
                result['message'] = 'Ok'
            except Exception, e:
                result['message'] = unicode(e)

            json_encoder = JSONEncoder()
            res = json_encoder.encode(result)
            if self.request and hasattr('GET', 'self.request') and \
                'callback' in self.request.GET:
                return HttpResponse("%s(%s)" % (self.request.GET['callback'], res),
                    mimetype="application/json")
            else:
                return HttpResponse(res, mimetype="application/json")
        else:
            return HttpResponseForbidden()


def __access_webservice(path, params=None):
    """Доступ к веб-сервису"""
    param_str = ''
    if params:
        # Есть get-параметры к запросу
        param_str = '?' + urllib.urlencode(params)
    try:
        s = urllib.urlopen("http://%s%s%s" % (settings.WS_HOST,
            urllib.quote(smart_str(path)), param_str))
        res = JSONDecoder().decode(s.read())
        s.close()
        if res['success']:
            return res['data']
    except BaseException:
        pass
    return False
