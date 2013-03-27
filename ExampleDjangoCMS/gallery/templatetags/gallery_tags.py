# -*- coding: utf-8 -*-
from django import template
from gallery.models import Picture
register = template.Library()

@register.inclusion_tag('gallery/random_picture.html')
def random_picture():
    all_pictures = Picture.objects.order_by('?')
    return {'picture': all_pictures[0] if len(all_pictures) else None}
