# -*- coding: utf-8 -*-

__author__="husky"
__date__ ="$20.12.2010 23:23:25$"

from django import forms

from cms.plugin_pool import plugin_pool
from roster.models import Roster
from wymeditor_widget import WYMEditor

class RosterForm(forms.ModelForm):
    class Meta:
        model = Roster

    def _get_widget(self):
        plugins = plugin_pool.get_text_enabled_plugins(placeholder=None, page=None)
        return WYMEditor(installed_plugins=plugins)

    def __init__(self, *args, **kwargs):
        super(RosterForm, self).__init__(*args, **kwargs)
        widget = self._get_widget()
        self.fields['excerpt'].widget = widget