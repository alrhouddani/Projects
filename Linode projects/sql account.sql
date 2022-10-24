ALTER USER 'root'@'192.168.1.34' IDENTIFIED WITH mysql_native_password BY 'Password123'
CREATE USER 'justitdude'@'192.168.1.34' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'justitdude'@'192.168.1.34' WITH GRANT OPTION;
CREATE USER 'justitdude'@'justitdude' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'justitdude'@'justitdude' WITH GRANT OPTION;
FLUSH PRIVILEGES;