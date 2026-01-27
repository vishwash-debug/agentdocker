FROM nginx

RUN rm -rf /usr/share/nginx/html/*

copy index.html /usr/share/nginx/html/

EXPOSE 80
