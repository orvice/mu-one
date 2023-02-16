FROM v2fly/v2fly-core:v4.42.2


COPY --from=quay.io/orvice/v2ray-mu /app/bin/v2ray-mu /usr/bin/v2ray-mu

COPY config.json /etc/v2ray/config.json

COPY entrypoint.sh /usr/bin/entrypoint.sh


RUN apk update && apk add --no-cache supervisor bash
COPY supervisord.conf /etc/supervisord.conf

ENV VMESS_PATH "websocket"

ENTRYPOINT ["bash", "/usr/bin/entrypoint.sh" ]