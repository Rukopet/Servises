FROM alpine:3.12

EXPOSE 21 50020

RUN apk update && apk upgrade
RUN apk add wget openssl pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
# COPY vsftpd.conf /etc/vsftpd/

# add user
RUN mkdir -p /etc/ftps/admin
# утснавливает пароль по умолчанию
RUN adduser -DH admin && echo "admin:admin" | chpasswd

RUN		yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem 

RUN     apk add nginx
RUN	mkdir -p /run/nginx
# COPY	nginx etc/nginx/conf.d/default.conf


RUN     sed -i -e 's,^Daemonize .*,Daemonize no,' /etc/pure-ftpd.conf


COPY    basic.sh /
RUN		chmod +x basic.sh
CMD     ["/basic.sh"]