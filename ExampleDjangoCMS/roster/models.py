# -*- coding: utf-8 -*-

__author__="husky"
__date__ ="$20.12.2010 2:57:17$"

from django.db import models
from cms.models.fields import PlaceholderField
from PIL import Image
from django.conf import settings

class PublishedRosterManager(models.Manager):
    """
     Убирает не опубликованные 
    """
    def ger_query_set(self):
        return super(PublishedOpinionManager, self).get_query_set() \
                    .filter(is_published=True)

class Roster(models.Model):
    title       = models.CharField(u'Название', max_length=255)
    excerpt     = models.TextField(u'Цитата')
    content     = PlaceholderField('content')
    image       = models.ImageField(u'Иконка в список', blank=True, null=True,
                    upload_to='images/roster/')
    rating      = models.IntegerField(u'Рейтинг', blank=True, default=0)
    teg         = models.CharField(u'Тэг', max_length=255, blank=True, default="")

    is_published= models.BooleanField(u'Опубликован', default=False)
    create      = models.DateTimeField(auto_now_add=True, editable=False)
    update      = models.DateTimeField(auto_now=True, editable=False)
    meta_description = models.TextField(u'Мета описание', blank=True)
    meta_keywords = models.CharField(u'Мета слова', max_length=255, blank=True)

    published = PublishedRosterManager()
    objects = models.Manager()

    def save(self, *args, **kwargs):
        super(Roster, self).save(*args, **kwargs)
        img = Image.open("%s/%s" % (settings.MEDIA_ROOT,self.image))
        img.thumbnail((200,150),Image.ANTIALIAS)
        img.save("%s/%s" % (settings.MEDIA_ROOT,self.image))


    class Meta:
        verbose_name = u'Элемент списка'
        verbose_name_plural = u'Списки'
        ordering = ('rating',)

    def __unicode__(self):
        return self.title
