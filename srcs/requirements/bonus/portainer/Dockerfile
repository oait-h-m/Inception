FROM debian:bookworm

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    tar \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q https://github.com/portainer/portainer/releases/download/2.19.5/portainer-2.19.5-linux-amd64.tar.gz \
    && tar -xvf portainer-2.19.5-linux-amd64.tar.gz \
    && rm portainer-2.19.5-linux-amd64.tar.gz \
    && mv portainer /opt/portainer

EXPOSE 9000

CMD ["/opt/portainer/portainer"]