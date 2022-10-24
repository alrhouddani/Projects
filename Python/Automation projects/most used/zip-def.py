import zipfile


PATH = "C:\\Temp\\WHHT_LogMeIn_Scripts.zip"  # unzip a file
EX_PATH = "C:\\Temp"


def unzip(PATH, EX_PATH):
    with zipfile.ZipFile(PATH, 'r') as zip_ref:
        zip_ref.extractall(EX_PATH)


unzip(PATH, EX_PATH)
