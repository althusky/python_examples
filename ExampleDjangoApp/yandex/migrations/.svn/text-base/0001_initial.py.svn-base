# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding model 'MessageFilter'
        db.create_table('yandex_messagefilter', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('message', self.gf('django.db.models.fields.TextField')()),
            ('filter', self.gf('django.db.models.fields.TextField')()),
            ('live_time', self.gf('django.db.models.fields.DateField')()),
        ))
        db.send_create_signal('yandex', ['MessageFilter'])

        # Adding model 'MessageSearch'
        db.create_table('yandex_messagesearch', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('id_group', self.gf('django.db.models.fields.CharField')(max_length=12)),
            ('filter', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['yandex.MessageFilter'])),
        ))
        db.send_create_signal('yandex', ['MessageSearch'])

        # Adding model 'FileFilter'
        db.create_table('yandex_filefilter', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('descr', self.gf('django.db.models.fields.TextField')()),
            ('path', self.gf('django.db.models.fields.CharField')(max_length=500)),
            ('filter', self.gf('django.db.models.fields.TextField')()),
            ('live_time', self.gf('django.db.models.fields.DateField')()),
        ))
        db.send_create_signal('yandex', ['FileFilter'])

        # Adding model 'FileSearch'
        db.create_table('yandex_filesearch', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('id_group', self.gf('django.db.models.fields.CharField')(max_length=12)),
            ('filter', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['yandex.FileFilter'])),
        ))
        db.send_create_signal('yandex', ['FileSearch'])


    def backwards(self, orm):
        
        # Deleting model 'MessageFilter'
        db.delete_table('yandex_messagefilter')

        # Deleting model 'MessageSearch'
        db.delete_table('yandex_messagesearch')

        # Deleting model 'FileFilter'
        db.delete_table('yandex_filefilter')

        # Deleting model 'FileSearch'
        db.delete_table('yandex_filesearch')


    models = {
        'yandex.filefilter': {
            'Meta': {'object_name': 'FileFilter'},
            'descr': ('django.db.models.fields.TextField', [], {}),
            'filter': ('django.db.models.fields.TextField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'live_time': ('django.db.models.fields.DateField', [], {}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'path': ('django.db.models.fields.CharField', [], {'max_length': '500'})
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
