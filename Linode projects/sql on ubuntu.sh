sudo apt install mysql-server -y
sudo systemctl start mysql.service
sudo mysql

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Password123'

sudo service mysql restart

sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf

sudo apt-get remove --purge mysql* -y
sudo apt-get purge mysql* -y
sudo apt-get autoremove -y
sudo apt-get autoclean -y
sudo apt-get remove dbconfig-mysql -y
sudo apt-get dist-upgrade
sudo rm -r /etc/mysql /var/lib/mysql
