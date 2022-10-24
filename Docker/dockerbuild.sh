start "C:\ProgramData\Microsoft\Windows\Start Menu\Docker Desktop.lnk"
#import the container image
docker pull alrh/mysqlbd:importDB
#create the container
docker run --name mysqlbd -p 3306:3306 -e MYSQL_ROOT_PASSWORD=Kilokoli123 -d alrh/mysqlbd:importDB
#connect to the container
docker exec -it mysqldb /bin/bash /home/mydb/dockerbuild.sh
## connect to the container first then run below
#cat /home/mydb/create-databases.sql | mysql --password=Kilokoli123 --user=root
## For mac

#sql container
docker run -it --name mysqldb -p 3306:3306 -e MYSQL_ROOT_PASSWORD=Kilokoli123 -v C:\Temp\mysqlbd:/shareddata -d alrh/mysqlbd:importDB
#azure container on an ubuntu.
docker run -it --name azure-dev -v C:\Temp\azure-dev:/shared azure-dev:alrh pwsh
# python container
docker run -it --name python -v C:\Temp\azure-dev:/shared python:latest python3
# powershell container
docker run -it --name powershell -v C:\Temp\azure-dev:/shared mcr.microsoft.com/powershell pwsh
# azure container
docker run -it --name azure -v C:\Temp\azure-dev:/shared mcr.microsoft.com/azure-powershell pwsh
# aapanal container
docker run -d -p 8886:7800 -v ~/website_data:/www/wwwroot -v ~/mysql_data:/www/server/data -v ~/vhost:/www/server/panel/vhost aapanel/aapanel:lib

docker run -it --name html -p 8080:80 -v C:\Temp\mysqlbd:/html -d webserver:latest
docker cp ./some_file CONTAINER:/work
