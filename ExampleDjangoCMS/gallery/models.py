# -*- coding: utf-8 -*-
from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.conf import settings
from PIL import Image

from cms.models import CMSPlugin


class Gallery(models.Model):
    """Галерея изображений"""
    name = models.CharField(_('Name'), max_length=100)

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = _('Gallery')
        verbose_name_plural = _('Galleries')
        ordering = ('name', )

class Picture(models.Model):
    """Изображение"""
    gallery = models.ForeignKey(Gallery, verbose_name=_('Gallery'))
    image = models.ImageField(_('Image'), upload_to="images/gallery/")
    description = models.CharField(_('Description'), max_length=200, blank=True)

    def save(self, *args, **kwargs):
        super(Picture, self).save(*args, **kwargs)
        img = Image.open("%s/%s" % (settings.MEDIA_ROOT,self.image))
        img.thumbnail((800,600),Image.ANTIALIAS)
        img.save("%s/%s" % (settings.MEDIA_ROOT,self.image))

    class Meta:
        verbose_name = _('Picture')
        verbose_name_plural = _('Pictures')

    def __unicode__(self):
        return self.description or self.gallery.name


class GalleryPlugin(CMSPlugin):
    """Плагин для галереи изображений"""
    gallery = models.ForeignKey(Gallery)

    def __unicode__(self):
        return self.gallery.__unicode__()
