FROM	alpine:3.12

EXPOSE	80 443

RUN		mkdir -p /run/nginx

RUN		apk update && apk upgrade
RUN		apk add nginx openssl
COPY	nginx etc/nginx/conf.d/default.conf
RUN		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes\
    		-keyout /etc/ssl/private/servic.key -out /etc/ssl/certs/servic.crt \
    		-subj "/C=RU/ST=Tatarstan/L=Kazan/O=21school/OU=egums/CN=ft_server"

RUN		mkdir -p /www/mine
COPY	devops.png /var/www/mine/
COPY	index.html /var/www/mine/index.html

COPY	basic.sh /tmp_for_image/
RUN		chmod +x /tmp_for_image/basic.sh
CMD		["/tmp_for_image/basic.sh"]