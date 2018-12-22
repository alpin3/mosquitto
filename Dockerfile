FROM alpine:3.8
MAINTAINER kost - https://github.com/kost

RUN apk --update add mosquitto mosquitto-clients && rm -f /var/cache/apk/* && \
 mkdir /work && chown nobody /work  && \
 echo "Success"

COPY root /

VOLUME ["/data"]
WORKDIR /data

USER nobody
EXPOSE 1883

ENTRYPOINT ["mosquitto","-c","/etc/mosquitto/mosquitto.conf"]

