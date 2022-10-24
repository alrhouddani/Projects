sudo apt update
sudo apt install mysql-server
sudo systemctl start mysql.service

sudo mysql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password'
exit

mysql -u root -p

ALTER USER 'root'@'localhost' IDENTIFIED WITH auth_socket
