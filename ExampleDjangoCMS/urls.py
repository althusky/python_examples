from django.conf.urls.defaults import *

from django.contrib import admin
import os

admin.autodiscover()

SITE_ROOT =  os.path.realpath(os.path.dirname(__file__))

urlpatterns = patterns('',
    #(r'^admin/(.*)', admin.site.root),
    url(r'^wolf/', include(admin.site.urls)),
    #(r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': SITE_ROOT+'/media/'}),
    url(r'^news/', include('news.urls')),
    url(r'^opinion/',include('opinion.urls')),
    url(r'^gallery/', include('gallery.urls')),
    url(r'^works/', include('roster.urls')),
    url(r'^', include('cms.urls')),
)
