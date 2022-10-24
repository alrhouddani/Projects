azcopy login --tenant-id 1f5a9a3d-bcd3-4814-917d-d1ab5d63768b
#copy from local folder to a blub container 
azcopy copy "C:\azcopytest" "https://azcopy01.blob.core.windows.net/azcopytest" --recursive
azcopy copy "target container/?Sas Token" "destination container"
