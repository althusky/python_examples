# -*- coding:utf-8 -*-
__author__ = 'husky'

from django.conf.urls.defaults import *

urlpatterns = patterns('yandex.views',

    ('message/list/$', 'message_list'),
    ('message/add/', 'message_add'),
    ('message/edit/(?P<id>\d{1,})/$', 'message_edit'),
    ('message/delete/(?P<id>\d{1,})/$', 'message_delete'),

    ('file/list/$', 'file_list'),
    ('file/add/', 'file_add'),
    ('file/edit/(?P<id>\d{1,})/$', 'file_edit'),
    ('file/delete/(?P<id>\d{1,})/$', 'file_delete'),

    ('find/$', 'find'),
)