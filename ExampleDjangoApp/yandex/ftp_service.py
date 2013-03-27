# -*- coding:utf-8 -*-
__author__ = 'husky'
from django.shortcuts import redirect
from django.conf import settings
from ftplib import FTP

def __ftp_connect__():
    ftp_ip = settings.FTP_IP if hasattr(settings, 'FTP_IP') else False
    ftp_login = settings.FTP_LOGIN if hasattr(settings, 'FTP_LOGIN') else False
    ftp_ps = settings.FTP_PS if hasattr(settings, 'FTP_PS') else False
    if not (ftp_ip and ftp_login and ftp_ps):
        raise Exception("Can't find ftp params in settings.py. App yandex, file ftp_service, function 'upload function'")
    return FTP(ftp_ip, ftp_login, ftp_ps, timeout=1)

def ftp_upload(teacher_id, fileUp):
    conn = __ftp_connect__()
    ftp_ip = settings.FTP_IP
    file_list = conn.nlst()
    # если нет каталога его нужно собрать
    if not file_list or (file_list and not str(teacher_id) in file_list):
        conn.mkd(str(teacher_id))
    conn.cwd(str(teacher_id))
    # проверяем а вдруг уже есть с таким именем
    file_list = conn.nlst()
    if fileUp.name in file_list:
        return 0, "File name exists"
    conn.storbinary("STOR %s"%fileUp.name,fileUp)
    conn.close()     
    return u"ftp://%s/%s/%s" % (ftp_ip, teacher_id, fileUp.name), 'Ok'

def ftp_delete(full_path):
    conn = __ftp_connect__()
    conn.delete('/'.join(full_path.split('/')[3:]))
    conn.close()

def ftp_exists(teacher_id, file_name):
    # проверка существования файла
    conn = __ftp_connect__()
    ftp_ip = settings.FTP_IP
    file_list = conn.nlst() 
    if not str(teacher_id) in file_list:
        return False
    conn.cwd(str(teacher_id))
    file_list = conn.nlst()
    if file_name in file_list:
        return True
    return False

def ftp_full_path(teacher_id, file_name):
    ftp_ip = settings.FTP_IP if hasattr(settings, 'FTP_IP') else False
    return u"ftp://%s/%s/%s" % (ftp_ip, teacher_id, file_name)
