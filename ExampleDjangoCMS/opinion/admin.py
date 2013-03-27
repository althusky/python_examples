# -*- coding: utf-8 -*-
__author__="husky"
__date__ ="$17.12.2010 2:29:51$"

from django.contrib import admin
from opinion.models import Opinion

from cms.admin.placeholderadmin import PlaceholderAdmin
from opinion.form import OpinionForm

class OpinionAdmin(PlaceholderAdmin):
    date_hierarchy = 'pub_date'
    list_display = ('slug', 'title', 'is_published', 'pub_date')
    list_filter = ('is_published',)
    search_fields = ['title', 'excerpt', 'content']
    prepopulated_fields = {'slug': ('title',)}
    form = OpinionForm
    actions = ['make_published', 'make_unpublished']

    save_as = True
    save_on_top = True

    def queryset(self, request):
        return Opinion.objects.all()

    def make_published(self, request, queryset):
        row_update = queryset.update(is_published=True)
        self.message_user(request, u'изменено %d' % (row_update,))

    make_published.short_description = u'Опубликовать выбранные отзывы'

    def make_unpublished(self, request, queryset):
        row_update = queryset.update(is_published=False)
        self.message_user(request,u'изменено %d' % (row_update,))

    make_unpublished.short_description = (u'Снять с публикации выбранные отзывы')
admin.site.register(Opinion, OpinionAdmin)