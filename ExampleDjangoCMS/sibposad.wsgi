import os
import sys

sys.path.insert(0,'/var/www/')
sys.path.insert(0,'/var/www/sibposad/')
sys.path.insert(0,'/var/www/sibposad/www/')
sys.path.insert(0,'/var/www/sibposad/www/sibposad/')
sys.path.insert(0,'/var/www/sibposad/env/lib/python2.6/site-packages/')

os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'

import django.core.handlers.wsgi

application = django.core.handlers.wsgi.WSGIHandler()
