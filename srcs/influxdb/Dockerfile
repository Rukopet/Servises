FROM alpine:3.12

RUN apk update && apk upgrade

RUN apk add influxdb libc6-compat supervisor 
RUN mkdir -p /run/influxdb
COPY supervisord.conf /
RUN mkdir -p /var/lib/influxdb

# telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community;
RUN mkdir -p /etc/telegraf
RUN telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf

EXPOSE 8086

CMD /usr/bin/supervisord -c /supervisord.conf