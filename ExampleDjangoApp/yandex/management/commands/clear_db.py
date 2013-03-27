# -*- coding:utf-8 -*-
from django.core.management.base import BaseCommand
from yandex.views import clear_search

class Command(BaseCommand):
	help = 'Clear Database about old messages and files'
	def handle(self, *args, **options):
		print "begin...."
		clear_search()
		print "end !!!"