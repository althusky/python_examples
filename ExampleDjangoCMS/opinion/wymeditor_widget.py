# -*- coding: utf-8 -*-

__author__="husky"
__date__ ="$20.12.2010 1:49:54$"

from os.path import join

from django.utils.safestring import mark_safe
#from django.template.loader import render_to_string
from django.forms import Textarea

from django.conf import settings
from cms.plugins.text import settings as text_settings
from django.utils.translation.trans_real import get_language
from django.template import Context, Template

HTML = """
{% load i18n %}
<script type="text/javascript">

// Global var, for storing callbacks, see below.
var editPluginPopupCallbacks = {};

{% include "cms/plugins/widgets/widget_lib.js" %}



$(document).ready(function(){
    $('#id_{{ name }}').wymeditor({
        lang: '{{ language }}',
        skin: 'django',
        skinPath: "{{ CMS_MEDIA_URL }}js/wymeditor/skins/django/",
        updateSelector: 'input[type=submit],',
        updateEvent: 'click',
		logoHtml: '',
		toolsItems: [
			    {{ WYM_TOOLS }}
			],
		containersItems: [
		        {{ WYM_CONTAINERS }}
		    ],
		classesItems: [
			    {{ WYM_CLASSES }}
			],
		editorStyles: [
			{{ WYM_STYLES }}
			],
		{% if WYM_STYLESHEET %}
		stylesheet:
			{{ WYM_STYLESHEET }}
		,
		{% endif %}
        //handle click event on dialog's submit button
        postInitDialog: function( wym, wdw ) {

        }
    });
});
    </script>
"""

class WYMEditor(Textarea):
    class Media:
        js = [join(settings.CMS_MEDIA_URL, path) for path in (
            'js/lib/jquery.js',
            'wymeditor/jquery.wymeditor.js',
            'wymeditor/plugins/resizable/jquery.wymeditor.resizable.js',
        )]

    def __init__(self, attrs=None, installed_plugins=None):
        """
        Create a widget for editing text + plugins.

        installed_plugins is a list of plugins to display that are text_enabled
        """
        self.attrs = {'class': 'wymeditor'}
        if attrs:
            self.attrs.update(attrs)
        super(WYMEditor, self).__init__(attrs)
        self.installed_plugins = installed_plugins

    def render_textarea(self, name, value, attrs=None):
        return super(WYMEditor, self).render(name, value, attrs)

    def render_additions(self, name, value, attrs=None):
        language = get_language()
        context = {
            'name': name,
            'language': language,
            'CMS_MEDIA_URL': settings.CMS_MEDIA_URL,
            'WYM_TOOLS': mark_safe(text_settings.WYM_TOOLS),
            'WYM_CONTAINERS': mark_safe(text_settings.WYM_CONTAINERS),
            'WYM_CLASSES': mark_safe(text_settings.WYM_CLASSES),
            'WYM_STYLES': mark_safe(text_settings.WYM_STYLES),
            'WYM_STYLESHEET': mark_safe(text_settings.WYM_STYLESHEET),
            'installed_plugins': self.installed_plugins,
        }
#        return mark_safe(render_to_string(
#            'news/widgets/wymeditor.html', context))
        c = Context(context)
        t = Template(HTML)
        return t.render(c)
    def render(self, name, value, attrs=None):
        return self.render_textarea(name, value, attrs) + \
            self.render_additions(name, value, attrs)
