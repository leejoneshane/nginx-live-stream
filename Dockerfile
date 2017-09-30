FROM nginx:alpine

RUN apk add --no-cache openssl ca-certificates nginx nginx-mod-rtmp ffmpeg nodejs \
    && npm install --save-dev video.js

ADD	nginx.conf /etc/nginx/conf/nginx.conf
ADD stat.xsl /etc/nginx/conf/static/stat.xsl

EXPOSE 80 1935

CMD nginx -g daemon off; && npm start
