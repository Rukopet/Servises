service mysql start
service php7.3-fpm start
echo "CREATE USER 'admin'@'localhost' IDENTIFIED BY '1234';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
echo "CREATE DATABASE wp_database;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wp_database.* TO 'admin'@'localhost';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password