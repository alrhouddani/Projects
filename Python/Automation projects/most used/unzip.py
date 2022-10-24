import os
import zipfile
import subprocess
from time import sleep
import wget

TEMP = os.path.exists('c://temp')
URL = 'https://github.com/azurealrh/WHHT_LogMeIn_Scripts/archive/refs/heads/main.zip'
PATH = 'C:\\temp\\WHHT_LogMeIn_Scripts.zip'
PATH = "C:\\Temp\\WHHT_LogMeIn_Scripts.zip"
EX_PATH = "C:\\Temp"


def temp(EX_PATH):  # temp creation
    if os.path.isdir(EX_PATH) is False:
        os.mkdir(EX_PATH)


def wget_download(url, path):  # wget def
    return wget.download(url, path)


def unzip(PATH2, EX_PATH):  # unzip def
    with zipfile.ZipFile(PATH, 'r') as zip_ref:
        zip_ref.extractall(EX_PATH)


def garbage_collector(PATH):  # garbage_collector def
    os.remove(PATH)


temp(EX_PATH)
sleep(2)
wget_download(URL, PATH)
sleep(2)
unzip(PATH, EX_PATH)
sleep(2)
garbage_collector(PATH)
