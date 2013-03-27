# -*- coding: utf-8 -*-
__author__="husky"
__date__ ="$20.12.2010 22:57:51$"

from django.contrib import admin
from roster.models import Roster

from cms.admin.placeholderadmin import PlaceholderAdmin
from roster.form import RosterForm

class RosterAdmin(PlaceholderAdmin):
    
    list_display = ('title', 'rating', 'teg', 'is_published',)
    list_filter = ('teg', 'is_published',)
    ordering = ('is_published', 'rating', 'teg', 'title')
    search_fields = ['title', 'excerpt', 'content']
    form = RosterForm 
    actions = ['make_published', 'make_unpublished']
    save_as = True
    save_on_top = True


    def make_published(self, request, queryset):
        row_update = queryset.update(is_published=True)
        self.message_user(request, u'изменено %d' % (row_update,))

    make_published.short_description = u'Опубликовать выбранные отзывы'

    def make_unpublished(self, request, queryset):
        row_update = queryset.update(is_published=False)
        self.message_user(request,u'изменено %d' % (row_update,))

    make_unpublished.short_description = (u'Снять с публикации выбранные отзывы')
    
admin.site.register(Roster, RosterAdmin)
