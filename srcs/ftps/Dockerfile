# FROM alpine:3.12

# EXPOSE 21 20 21000

# # USER root

# RUN apk update && apk upgrade
# RUN apk add wget openssl pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
# # COPY vsftpd.conf /etc/vsftpd/

# # add user
# # RUN mkdir -p /etc/ftps/admin

# RUN		yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
# -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem 

# COPY    pure-ftpd.conf /etc/

# # RUN     sed -i -e 's,^Daemonize .*,Daemonize no,' /etc/pure-ftpd.conf


# COPY    basic.sh /
# RUN		chmod +x basic.sh
# CMD     ["/basic.sh"]

FROM alpine:3.12
RUN apk update && apk upgrade

RUN apk add wget vsftpd openssl sudo

COPY vsftpd.conf /etc/vsftpd/

RUN mkdir -p /etc/ftps/admin
RUN adduser -D admin && echo "admin:password" | chpasswd

RUN sudo mkdir -p /etc/ssl/private
RUN openssl req -x509 -nodes -days 10 -subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=21School/CN=localhost" \
    -newkey rsa:1024 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem

EXPOSE 21 21000

# start
CMD vsftpd /etc/vsftpd/vsftpd.conf