FROM	alpine:3.12

EXPOSE	5050

RUN		apk update && apk upgrade
RUN		apk add nginx openssl wget supervisor php7 php7-fpm php7-cgi fcgi php7-mysqli php7-mbstring php7-json php7-session
RUN		wget https://wordpress.org/latest.tar.gz
RUN		tar -zxvf latest.tar.gz
RUN		rm -f latest.tar.gz

RUN		mkdir -p /run/nginx
COPY	nginx.conf etc/nginx/default.conf

COPY	supervisord.conf /etc/supervisord.conf

CMD		["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]