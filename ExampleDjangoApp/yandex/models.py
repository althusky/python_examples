# -*- coding:utf-8 -*-
__author__ = 'husky'

from django.db import models

class MessageFilter(models.Model):
    title = models.CharField(u'Кратко', max_length=200)
    message = models.TextField(u'Текст сообщения')
    filter = models.TextField(u'Фильтр')
    live_time = models.DateField(u'Дата окончания')

    def __unicode__(self):
        return self.title

class MessageSearch(models.Model):
    id_group = models.CharField(u'Групппа', max_length=12, db_index=True)
    filter = models.ForeignKey('MessageFilter')

    def __unicode__(self):
        return "%s" % self.id_group

class FileFilter(models.Model):
    name = models.CharField(u'Название', max_length=200)
    descr = models.TextField(u'Описание')
    teacher = models.CharField(u'Уид преподавателя', max_length='50', 
        blank=True, null =True)
    path = models.CharField(u'Путь до файла', max_length=500)
    filter = models.TextField(u'Текст фильтра')
    live_time = models.DateField(u'Дата окончания')

    def __unicode__(self):
        return self.name

class FileSearch(models.Model):
    id_group = models.CharField(u'Групппа', max_length=12, db_index=True)
    filter = models.ForeignKey('FileFilter')

    def __unicode__(self):
        return self.id_group