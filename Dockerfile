FROM nginx:alpine

RUN apk update \
    && apk add openssl ca-certificates nginx nginx-mod-rtmp ffmpeg nodejs \

ADD	nginx.conf /etc/nginx/conf/nginx.conf
ADD stat.xsl /etc/nginx/conf/static/stat.xsl

EXPOSE 80 1935

CMD ["nginx", "-g", "daemon off;"]
