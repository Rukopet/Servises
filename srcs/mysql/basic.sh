#!/bin/sh

# /usr/bin/mysql_install_db --datadir=/var/lib/mysql --user=root --basedir=/usr
/usr/bin/mysql_install_db --user=root
mysqld --user=root & sleep 11
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
mysql wordpress -u root --skip-password < /tmp_for_image/wordpress.sql
echo "CREATE USER 'wp_admin' IDENTIFIED BY 'wp_admin';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_admin'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "DROP DATABASE test" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
/usr/share/mariadb/mysql.server stop && sleep 4
usr/bin/mysqld