import os
import os

FOLDER = 'c://temp'


def temp(FOLDER):
    if os.path.isdir(FOLDER) is False:
        os.mkdir(FOLDER)


temp(FOLDER)
