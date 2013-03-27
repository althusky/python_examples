# -*- coding: utf-8 -*-

__author__="husky"
__date__ ="$20.12.2010 1:35:38$"

from django import forms

from cms.plugin_pool import plugin_pool
from opinion.models import Opinion
from wymeditor_widget import WYMEditor

class OpinionForm(forms.ModelForm):
    class Meta:
        model = Opinion

    def _get_widget(self):
        plugins = plugin_pool.get_text_enabled_plugins(placeholder=None, page=None)
        return WYMEditor(installed_plugins=plugins)

    def __init__(self, *args, **kwargs):
        super(OpinionForm, self).__init__(*args, **kwargs)
        widget = self._get_widget()
        self.fields['excerpt'].widget = widget