# -*- coding:utf-8 -*-
__author__ = 'husky'
# -*- coding:utf-8 -*-
__author__ = 'husky'

from django.conf.urls.defaults import *

urlpatterns = patterns('yandex.views',
    ('message/(?P<id>\d{1,})/$', 'get_message'),
    ('file/(?P<id>\d{1,})/$', 'get_file'),
    ('file/list/$', 'file_edit_list'),
    ('file/find/$', 'find_file'),
    ('file/update/$', 'update_file'),
    ('file/add/$', 'add_file'),
    ('file/delete/$', 'delete_file'),
    )