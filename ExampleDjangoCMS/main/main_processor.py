# -*- encoding: utf-8 -*-
# To change this template, choose Tools | Templates
# and open the template in the editor.

__author__="husky"
__date__ ="$05.12.2010 3:06:30$"

from django.conf import settings
from news.models import News
from opinion.models import Opinion
from re import match

def template(request):
    vars = {'URL_ROOT': settings.URL_ROOT}
    if match('^/works/', request.path):
        vars['MENU_WORKS'] = True
    if request.path == '/about/':
        vars['MENU_ABOUT'] = True
    if match('^/service/', request.path):
        vars['MENU_SERVICE'] = True
    if match('^/last-news/', request.path):
        vars['MENU_NEWS'] = True
    if match('^/news/', request.path):
        vars['MENU_NEWS'] = True
    if match('^/contacts/', request.path):
        vars['MENU_CONTACTS'] = True 
    vars['right_news'] = News.objects.order_by('-pub_date')[:3]
    vars['right_opinion'] = Opinion.objects.order_by('-pub_date')[:1]

    return vars
