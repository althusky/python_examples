# -*- coding:utf-8 -*-
__author__ = 'husky'

from django import forms
from yandex.models import *

class FormMessage(forms.ModelForm):
    class Meta:
        model = MessageFilter

class FormFile(forms.ModelForm):
    class Meta:
        model = FileFilter
        exclude = ('path','teacher')        