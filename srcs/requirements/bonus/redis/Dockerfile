FROM debian:bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
    redis-server \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/redis /var/lib/redis /data && \
    chown -R redis:redis /var/lib/redis /data /etc/redis

EXPOSE 6379

COPY tools/init.sh /init.sh
RUN chmod +x /init.sh

USER redis

ENTRYPOINT ["/init.sh"]