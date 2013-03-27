from django.conf.urls.defaults import *

from gallery.models import Gallery

gallery_info_dict = {
    'queryset': Gallery.objects.all(),
}

urlpatterns = patterns('django.views.generic.list_detail',
    (r'^(?P<object_id>\d+)/$', 'object_detail', gallery_info_dict, 'gallery_detail'),
)
