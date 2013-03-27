# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding index on 'FileSearch', fields ['id_group']
        db.create_index('yandex_filesearch', ['id_group'])

        # Adding index on 'MessageSearch', fields ['id_group']
        db.create_index('yandex_messagesearch', ['id_group'])


    def backwards(self, orm):
        
        # Removing index on 'MessageSearch', fields ['id_group']
        db.delete_index('yandex_messagesearch', ['id_group'])

        # Removing index on 'FileSearch', fields ['id_group']
        db.delete_index('yandex_filesearch', ['id_group'])


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
            'id_group': ('django.db.models.fields.CharField', [], {'max_length': '12', 'db_index': 'True'})
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
            'id_group': ('django.db.models.fields.CharField', [], {'max_length': '12', 'db_index': 'True'})
        }
    }

    complete_apps = ['yandex']
