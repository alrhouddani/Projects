import wget
import subprocess
from time import sleep

URL = "https://github.com/azurealrh/logmein-/archive/refs/heads/main.zip"


def execute(cmd, shell=True):
    process = subprocess.Popen(cmd, shell=shell,
                               stdout=subprocess.PIPE,
                               stderr=subprocess.PIPE)
    out, err = process.communicate()
    out = out.decode()
    err = err.decode()
    return [out, err]


username, err = execute('echo %username%')

username = username.replace('\r\n', '')
print(username)
response = wget.download(
    URL, f'C:\\Users\\{username}\\Downloads\\logmein.zip')

execute(f'Expand-Archive -LiteralPath "C:\Users\{username}\Downloads\logmein.zip"')

#execute('mv C:\\Temp\\logmein--main\\source "C:\\Users\\%username%\\OneDrive - Atos\\Desktop"')
