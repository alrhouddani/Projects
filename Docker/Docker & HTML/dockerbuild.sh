# bulding the image
docker build . -t html
#docker run container

docker run -it --name html -p 8080:80 -v C:\Temp\mysqlbd:/html -d html
# website should be

http://localhost:8080/index.html
