FROM alpine:latest

EXPOSE 80 443

RUN apk update && apk upgrade
RUN apk add nginx openssl
COPY nginx.conf etc/nginx/cond.d/default.conf
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes\
    -keyout /etc/ssl/private/services.key -out /etc/ssl/certs/services.crt \
    -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21school/OU=egums/CN=ft_server"
CMD ["sh", "/home/srcs/basic.sh"]