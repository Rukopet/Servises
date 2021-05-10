FROM alpine:3.12
EXPOSE 3000
RUN apk update && apk upgrade

RUN apk add wget nginx libc6-compat

# grafana-7.5.5 dirname
RUN wget https://dl.grafana.com/oss/release/grafana-7.5.5.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.5.5.linux-amd64.tar.gz
RUN rm -f grafana-7.5.5.linux-amd64.tar.gz

COPY grafana.db /grafana-7.5.5/data/grafana.db
COPY basic.sh /
RUN chmod +x /basic.sh
CMD /basic.sh