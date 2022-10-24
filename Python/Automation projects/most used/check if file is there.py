import os.path
from os.path import exists


file_exists = os.path.exists('c://temp')

print(file_exists)

if file_exists == False:
    os.mkdir("c://temp")
