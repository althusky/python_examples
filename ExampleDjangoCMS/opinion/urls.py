# -*- coding: utf-8 -*-

__author__="husky"
__date__ ="$16.12.2010 1:03:36$"

from django.conf.urls.defaults import *
from opinion.models import Opinion

opinion_info_dict = {
    'queryset': Opinion.published.all(),
    'date_field': 'pub_date',
    'num_latest': 3,
}
opinion_info_dict_year = {
    'queryset': Opinion.published.all(),
    'date_field': 'pub_date',
    'make_object_list': True,
}
opinion_info_month_dict = {
    'queryset': Opinion.published.all(),
    'date_field': 'pub_date',
    'month_format': '%m',
}

urlpatterns = patterns('django.views.generic.date_based',
    (r'^$', 'archive_index', opinion_info_dict, 'opinion_archive_index'),
    (r'^(?P<year>\d{4})/$', 'archive_year', opinion_info_dict_year, 'opinion_archive_year'),
    (r'^(?P<year>\d{4})/(?P<month>\d{2})/(?P<day>\d{2})/(?P<slug>[-\w]+)/$',
        'object_detail', opinion_info_month_dict, 'opinion_detail'),
)