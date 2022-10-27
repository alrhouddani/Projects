#SCL access control list chmod
#FACL is responsible for organizing and supervising the Facilities Unit
getfacl #get permissions settings
setfacl # set the permissions
setfacl --modify o::r file3 && getfacl file3

#add permissions using Facl user
setfacl --modify u:abbyrh:rw file3 && getfacl file3
# add permissions to file with a group
setfacl --modify g:marketing:rw file3 && getfacl file3
#changing permissions for a folder
setfacl --modify d:g:sales:rw folder1 && getfacl folder1
#change permissions for others

setfacl --modify d:o:--- folder1 && getfacl folder1 #folder
setfacl --modify o:--- file3 && getfacl file3       # file

# the sticky bit the folder can only be deleted by owner or sudor set it on folders
mkdir corpdata
chmod o+t corpdata
