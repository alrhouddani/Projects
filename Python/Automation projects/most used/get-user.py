
import os


PATH = "OneDrive - Atos\Desktop"


def get_home_path():
    home_path = os.path.expanduser('~')
    return home_path


home_path = get_home_path()

desktop_path = os.path.join(home_path, PATH)

print(desktop_path)
