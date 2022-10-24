import subprocess
import wget
from time import sleep
import os

# check if temp exists if not create one

temp_path = os.path.exists('c://temp')

if temp_path == False:
    os.mkdir("c://temp")

sleep(2)
# getting the scripts from Github
URL = "https://github.com/azurealrh/WHHT_LogMeIn_Scripts/archive/refs/heads/main.zip"

response = wget.download(
    URL, f'C:\\temp\\WHHT_LogMeIn_Scripts.zip')


# run powershell cmds def

def run(cmd):
    completed = subprocess.run(
        ["powershell", "-Command", cmd], capture_output=True)
    return completed


sleep(2)

# unziping the scrpts zip files.
run('Expand-Archive -LiteralPath "C:\Temp\WHHT_LogMeIn_Scripts.zip" -DestinationPath "C:\Temp"')

sleep(3)

# deleting the zip file.
run('Remove-Item -Path "C:\Temp\WHHT_LogMeIn_Scripts.zip" -Force -Confirm:$false')
