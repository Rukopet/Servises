FROM	alpine:3.12

EXPOSE	3306

RUN		apk update && apk upgrade

RUN		apk add mysql mysql-client
# RUN		apk add mariadb mariadb-client

RUN		mkdir -p /run/mysqld
COPY	my.cnf /etc/

COPY    wordpress.sql basic.sh /tmp_for_image/
RUN		chmod +x /tmp_for_image/basic.sh
CMD		["/tmp_for_image/basic.sh"]