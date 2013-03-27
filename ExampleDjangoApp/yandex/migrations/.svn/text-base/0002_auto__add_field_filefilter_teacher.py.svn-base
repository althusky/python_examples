# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding field 'FileFilter.teacher'
        db.add_column('yandex_filefilter', 'teacher', self.gf('django.db.models.fields.CharField')(max_length='50', null=True, blank=True), keep_default=False)


    def backwards(self, orm):
        
        # Deleting field 'FileFilter.teacher'
        db.delete_column('yandex_filefilter', 'teacher')


    models = {
        'yandex.filefilter': {
            'Meta': {'object_name': 'FileFilter'},
            'descr': ('django.db.models.fields.TextField', [], {}),
            'filter': ('django.db.models.fields.TextField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'live_time': ('django.db.models.fields.DateField', [], {}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'path': ('django.db.models.fields.CharField', [], {'max_length': '500'}),
            'teacher': ('django.db.models.fields.CharField', [], {'max_length': "'50'", 'null': 'True', 'blank': 'True'})
        },
        'yandex.filesearch': {
            'Meta': {'object_name': 'FileSearch'},
            'filter': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['yandex.FileFilter']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'id_group': ('django.db.models.fields.CharField', [], {'max_length': '12'})
        },
        'yandex.messagefilter': {
            'Meta': {'object_name': 'MessageFilter'},
            'filter': ('django.db.models.fields.TextField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'live_time': ('django.db.models.fields.DateField', [], {}),
            'message': ('django.db.models.fields.TextField', [], {}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '200'})
        },
        'yandex.messagesearch': {
            'Meta': {'object_name': 'MessageSearch'},
            'filter': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['yandex.MessageFilter']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'id_group': ('django.db.models.fields.CharField', [], {'max_length': '12'})
        }
    }

    complete_apps = ['yandex']
