from pathlib import Path
import wget

URL = 'https://github.com/azurealrh/WHHT_LogMeIn_Scripts/archive/refs/heads/main.zip'
PATH = 'C:\\temp\\WHHT_LogMeIn_Scripts.zip'


def wget_download(url, path):
    return wget.download(url, path)


wget_download(URL, PATH)
