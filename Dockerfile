FROM mh416ghx.mirror.aliyuncs.com/library/nginx:alpine

ENV ARIA_NG_VERSION "1.1.5"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add --no-cache --virtual .build-deps wget zip \
    && wget -O /ariang.zip https://github.com/mayswind/AriaNg/releases/download/${ARIA_NG_VERSION}/AriaNg-${ARIA_NG_VERSION}.zip \
    && rm -rf /usr/share/nginx/html/* \
    && unzip /ariang.zip -d /usr/share/nginx/html \
    && rm /ariang.zip \
    && apk del .build-deps
