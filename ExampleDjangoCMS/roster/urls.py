# To change this template, choose Tools | Templates
# and open the template in the editor.

__author__="husky"
__date__ ="$21.12.2010 0:27:48$"

from django.conf.urls.defaults import *

urlpatterns = patterns('roster.views',
    (r'^$','show_list', {'page': 1}),
    (r'^(?P<page>\d{1,})/$','show_list'),
    (r'^item/(?P<item>\d{1,})/$','show_item'),
)
