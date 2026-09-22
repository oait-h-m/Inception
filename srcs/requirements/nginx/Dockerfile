FROM debian:bookworm

ARG DOMAIN_NAME

RUN apt-get update && apt-get install -y --no-install-recommends \
    nginx openssl \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl \
    && openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/inception.key \
    -out /etc/nginx/ssl/inception.crt \
    -subj "/CN=${DOMAIN_NAME}"

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN sed -i "s/DOMAIN_NAME_PLACEHOLDER/${DOMAIN_NAME}/g" /etc/nginx/nginx.conf

RUN mkdir -p /var/run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]