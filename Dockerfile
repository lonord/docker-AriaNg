FROM mh416ghx.mirror.aliyuncs.com/library/nginx:alpine

COPY AriaNg-1.1.5.zip /ariang.zip
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add --no-cache --virtual .build-deps zip \
    && rm -rf /usr/share/nginx/html/* \
    && unzip /ariang.zip -d /usr/share/nginx/html \
    && rm /ariang.zip \
    && apk del .build-deps
