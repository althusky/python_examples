# -*- coding: utf-8 -*-

__author__="husky"
__date__ ="$16.12.2010 1:05:53$"

import datetime
from django.db import models
from cms.models.fields import PlaceholderField

class PublishedOpinionManager(models.Manager):
    """
     Убирает не опубликованные и ещё не наступившие по дате 
    """
    def ger_query_set(self):
        return super(PublishedOpinionManager, self).get_query_set() \
                    .filter(is_published=True) \
                    .filter(pub_date__lte=datetime.datetime.now())

class Opinion(models.Model):
    title       = models.CharField(u'Название', max_length=255)
    slug        = models.SlugField(u'URL страницы', unique_for_date='pub_date',
                        help_text='уникальный в рамках текущего дня url страницы ')
    excerpt     = models.TextField(u'Цитата')
    content     = PlaceholderField(u'content')

    is_published= models.BooleanField(u'Опубликован', default=False)
    pub_date    = models.DateTimeField(u'Дата публикации', default=datetime.datetime.now())
    create      = models.DateTimeField(auto_now_add=True, editable=False)
    update      = models.DateTimeField(auto_now=True, editable=False)
    meta_description = models.TextField(u'Мета описание', blank=True)
    meta_keywords = models.CharField(u'Мета слова', max_length=255, blank=True)

    published = PublishedOpinionManager()
    objects = models.Manager()

    class Meta:
        verbose_name = u'Отзыв'
        verbose_name_plural = u'Отзывы'
        ordering = ('-pub_date',)

    def __unicode__(self):
        return self.title

    @models.permalink
    def get_absolute_url(self):
        return ('opinion_detail', (), { 'year': self.pub_date.strftime("%Y"),
                                        'month': self.pub_date.strftime("%m"),
                                        'day': self.pub_date.strftime("%d"),
                                        'slug': self.slug })
