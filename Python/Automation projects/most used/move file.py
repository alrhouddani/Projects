import shutil
import os


ORIG = "C:\Temp\WHHT_LogMeIn_Scripts-main\WHHTLogMeInScripts1.0.xml"
PATH = "OneDrive - Atos\Desktop"


def Move_file(ORIG, DEST):
    shutil.copy(ORIG, DEST)


def get_home_path():
    home_path = os.path.expanduser('~')
    return home_path


home_path = get_home_path()

desktop_path = os.path.join(home_path, PATH)

Move_file(ORIG, desktop_path)
