from django.utils.translation import ugettext as _
from django.core import urlresolvers
from django.contrib import admin

from sorl.thumbnail.main import DjangoThumbnail

from models import Gallery, Picture

class GalleryAdmin(admin.ModelAdmin):
    def link_to_images(self, obj):
        return '<a href="%s%s">%s</a>' % (
            urlresolvers.reverse('admin:gallery_picture_changelist'),
            '?gallery__id__exact=%d' % obj.id,
            _(u'View images')
        )
    link_to_images.allow_tags = True
    link_to_images.short_description = _(u'Link to images')

    list_display = ('name', 'link_to_images')

class PictureAdmin(admin.ModelAdmin):
    def picture(self, obj):
        thumb = DjangoThumbnail(obj.image, (200,200))
        return '<img src="%s" />' % thumb.__unicode__()
    picture.allow_tags = True
    picture.short_description = _(u'Picture')

    list_display = ('gallery', 'picture', 'description')
    list_filter = ('gallery', )

admin.site.register(Gallery, GalleryAdmin)
admin.site.register(Picture, PictureAdmin)
