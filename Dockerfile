# Dockerfile for Haproxy

FROM alpine:3.9

LABEL maintainer="Ghostry <ghostry.green@gmail.com>"

RUN apk update \
    && apk add --update haproxy \
    && rm -rf /var/cache/apk/*

# default configuration
COPY haproxy.cfg /haproxy.cfg

# start script
RUN \
  # start.sh
  echo 'if [ ! -f "/haproxy/haproxy.cfg" ]; then cp /haproxy.cfg /haproxy/haproxy.cfg;fi;/usr/sbin/haproxy -d -V -f /haproxy/haproxy.cfg' > /start.sh \
  && chmod 775 /start.sh

ENTRYPOINT ["sh", "/start.sh"]
