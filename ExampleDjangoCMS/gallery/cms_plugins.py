from cms.plugin_base import CMSPluginBase
from cms.plugin_pool import plugin_pool
from models import GalleryPlugin

from django.utils.translation import ugettext as _
from django.conf import settings

class CMSGalleryPlugin(CMSPluginBase):
    model = GalleryPlugin
    name = _("Gallery")
    render_template = "gallery/gallery.html"

    def render(self, context, instance, placeholder):
        context.update({'gallery': instance.gallery,
                        'object': instance,
                        'placeholder': placeholder})
        return context

    class PluginMedia:
        css = {
            'screen': ('%scss/jquery.lightbox-0.5.css' % settings.MEDIA_URL, ),
        }
        js = ('%scms/js/lib/jquery.js' % settings.MEDIA_URL,
              '%sjs/jquery.lightbox-0.5.min.js' % settings.MEDIA_URL, )


plugin_pool.register_plugin(CMSGalleryPlugin)
