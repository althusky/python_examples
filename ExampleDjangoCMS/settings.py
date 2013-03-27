# -*- coding: utf-8 -*-
# Django settings for aikidodze project.
import os

DEBUG = False
TEMPLATE_DEBUG = False
THUMBNAIL_DEBUG = False

ADMINS = (
    # ('Your Name', 'your_email@domain.com'),
)

SITE_ROOT =  os.path.realpath(os.path.dirname(__file__))
MANAGERS = ADMINS

DATABASE_ENGINE = 'mysql'           # 'postgresql_psycopg2', 'postgresql', 'mysql', 'sqlite3' or 'oracle'.
DATABASE_NAME = "*********" # Or path to database file if using sqlite3.
DATABASE_USER = '*********'             # Not used with sqlite3.
DATABASE_PASSWORD = '*********'         # Not used with sqlite3.
DATABASE_HOST = 'localhost'             # Set to empty string for localhost. Not used with sqlite3.
DATABASE_PORT = ''             # Set to empty string for default. Not used with sqlite3.

DEFAULT_CHARSET = "utf-8"

# Local time zone for this installation. Choices can be found here:
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# although not all choices may be available on all operating systems.
# If running in a Windows environment this must be set to the same as your
# system time zone.
TIME_ZONE = 'Asia/Novosibirsk'

gettext = lambda s: s

# Language code for this installation. All choices can be found here:
# http://www.i18nguy.com/unicode/language-identifiers.html
LANGUAGE_CODE = 'ru-ru'

LANGUAGES = (
    ('ru', gettext('Russian')),
)
CMS_LANGUAGES = (
    ('ru', gettext('Russian')),
)
CMS_LANGUAGE_CONF = {
    'ru':['ru'],
}

CMS_DEFAULT_LANGUAGE = 'ru'

CMS_FRONTEND_LANGUAGES = ("ru",)

SITE_ID = 1

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.
USE_I18N = True

URL_ROOT= ''#/sibposad'

# Absolute path to the directory that holds media.
# Example: "/home/media/media.lawrence.com/"
MEDIA_ROOT = os.path.join(SITE_ROOT, 'media')

# URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash if there is a path component (optional in other cases).
# Examples: "http://media.lawrence.com", "http://example.com/media/"
MEDIA_URL = URL_ROOT+'/media/'

# URL prefix for admin media -- CSS, JavaScript and images. Make sure to use a
# trailing slash.
# Examples: "http://foo.com/media/", "/media/".
ADMIN_MEDIA_PREFIX = URL_ROOT+'/media/amedia/'

# Make this unique, and don't share it with anybody.
SECRET_KEY = 'fm5s3rn(#f2fkzpzawdk(8j_0j$on@a&lwyq(0ds(5w%1vl!=m'

# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.load_template_source',
    'django.template.loaders.app_directories.load_template_source',
     # 'django.template.loaders.eggs.load_template_source',
)

MIDDLEWARE_CLASSES = (
    'django.middleware.locale.LocaleMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'cms.middleware.media.PlaceholderMediaMiddleware',
    'cms.middleware.page.CurrentPageMiddleware',
    'cms.middleware.user.CurrentUserMiddleware',
    #'cms.middleware.multilingual.MultilingualURLMiddleware',
)

ROOT_URLCONF = 'sibposad.urls'

TEMPLATE_CONTEXT_PROCESSORS = (
        "django.core.context_processors.auth",
        "django.core.context_processors.i18n",
        "django.core.context_processors.request",
        "django.core.context_processors.media",
        "cms.context_processors.media",
        "main.main_processor.template",
)

TEMPLATE_DIRS = (
    os.path.join(SITE_ROOT, 'tmpl'),
    # Put strings here, like "/home/html/django_templates" or "C:/www/django/templates".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
)

CMS_TEMPLATES = (
    ('base.html', gettext('default')),
    ('index.html', gettext('index')),
    ('main.html',gettext('main')),
    ('news.html',gettext('news')),
    ('service.html',gettext('service')),
    ('contacts.html',gettext('contacts')),
)

CMS_APPLICATIONS_URLS = (
    ('news.urls', 'News'),
)

#CMS_NAVIGATION_EXTENDERS = (
#    ('cmsplugin_news.navigation.get_nodes', 'News navigation'),
#)

CMS_SEO_FIELDS = True

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.admin',
    'django.contrib.sites',
    'cms',
    'cms.plugins.text',
    'cms.plugins.picture',
    'cms.plugins.link',
    'cms.plugins.file',
    'cms.plugins.video',
    'menus',
    'mptt',
    'publisher',
    #'south',
    'sorl.thumbnail',
    'news',
    'gallery',
    'opinion',
    'roster',
)

ROSTER_PAGE = 9


WYM_TOOLS = ",\n".join([
    "{'name': 'Bold', 'title': 'Strong', 'css': 'wym_tools_strong'}",
    "{'name': 'Italic', 'title': 'Emphasis', 'css': 'wym_tools_emphasis'}",
    "{'name': 'Superscript', 'title': 'Superscript', 'css': 'wym_tools_superscript'}",
    "{'name': 'Subscript', 'title': 'Subscript', 'css': 'wym_tools_subscript'}",
    "{'name': 'InsertOrderedList', 'title': 'Ordered_List', 'css': 'wym_tools_ordered_list'}",
    "{'name': 'InsertUnorderedList', 'title': 'Unordered_List', 'css': 'wym_tools_unordered_list'}",
    "{'name': 'Indent', 'title': 'Indent', 'css': 'wym_tools_indent'}",
    "{'name': 'Outdent', 'title': 'Outdent', 'css': 'wym_tools_outdent'}",
    "{'name': 'Undo', 'title': 'Undo', 'css': 'wym_tools_undo'}",
    "{'name': 'Redo', 'title': 'Redo', 'css': 'wym_tools_redo'}",
    "{'name': 'Paste', 'title': 'Paste_From_Word', 'css': 'wym_tools_paste'}",
    "{'name': 'ToggleHtml', 'title': 'HTML', 'css': 'wym_tools_html'}",
    "{'name': 'InsertTable', 'title': 'Table', 'css': 'wym_tools_table'}",
])

WYM_CLASSES = ",\n".join([
    "{'name': 'transparent', 'title': 'Таблица без границ', 'expr': 'table'}",
])

WYM_STYLES = ",\n".join([
    "{'name': '.transparent', 'css': 'background-color: #E1E8F1'}",
])
