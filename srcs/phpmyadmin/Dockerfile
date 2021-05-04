FROM	alpine:3.12

EXPOSE	5000

RUN		apk update && apk upgrade
RUN		apk add nginx openssl wget supervisor php7 php7-fpm php7-cgi fcgi php7-mysqli php7-mbstring php7-json php7-session
RUN		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes\
    		-keyout /etc/ssl/private/servic.key -out /etc/ssl/certs/servic.crt \
    		-subj "/C=RU/ST=Tatarstan/L=Kazan/O=21school/OU=egums/CN=ft_server"
RUN		wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0\
.4-all-languages.tar.gz
RUN		tar -zxvf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN		mv phpMyAdmin-5.0.4-all-languages phpMyAdmin
RUN		mkdir phpMyAdmin/tmp
RUN		rm -f phpMyAdmin-5.0.4-all-languages.tar.gz

COPY supervisord.conf /etc/supervisord.conf

COPY	basic.sh /tmp_for_image/
RUN		chmod +x /tmp_for_image/basic.sh
CMD		["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]