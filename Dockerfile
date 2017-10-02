FROM nginx:alpine

ENV VIDEOJS_VERSION 6.2.8
ENV HLS_VERSION v5.11.0

RUN apk update  \
    && apk add --no-cache openssl ca-certificates wget unzip nginx-mod-rtmp ffmpeg \
    && rm -rf /var/cache/apk/* \
    && wget -O videojs.zip https://github.com/videojs/video.js/releases/download/v$VIDEOJS_VERSION/video-js-$VIDEOJS_VERSION.zip \
    && unzip -d /usr/share/nginx/html videojs.zip \
    && rm videojs.zip \
    && cd /usr/share/nginx/html/video.js \
    && wget https://github.com/videojs/videojs-contrib-hls/releases/download/$HLS_VERSION/videojs-contrib-hls.min.js \
    && mkdir -p /var/rec

ADD nginx.conf /etc/nginx/conf.d/default.conf
ADD stat.xsl /etc/nginx/conf.d/static/stat.xsl
ADD index.html /etc/share/nginx/html/index.html

VOLUME /var/rec

EXPOSE 80 1935

CMD nginx
