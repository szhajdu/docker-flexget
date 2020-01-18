FROM python:3.8-alpine

ARG FLEXGET_VERSION=3.1.9

# Install basic packages
RUN apk update && \
    apk add --no-cache \
        bash \
        libxml2-dev \
        libxslt-dev \
        tzdata && \
    apk add --no-cache --virtual .build-deps \
        gcc \
        libc-dev

# Install runtime packages
RUN apk add --no-cache \
        ffmpeg

# Install flexget
RUN pip3 install --no-cache-dir -U pip && \
    pip3 install flexget==${FLEXGET_VERSION}

# Install YouTube Downloader
RUN wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl && \
    chmod a+rx /usr/local/bin/youtube-dl

# Clean up
RUN apk del .build-deps && \
    rm -rf /var/cache/*

# Expose Web UI port and config folder
EXPOSE 5050/tcp
VOLUME /config

# Flexget looks for config.yml automatically inside:
# /root/.flexget, /root/.config/flexget
# Since the uid/gid for user can be changed on the fly, set 777.
RUN ln -s /config /root/.flexget &&\
    chmod 777 /root/ && \
    chmod 777 /root/.flexget/

# Add start script
COPY start.sh /root/start.sh
RUN  chmod +x /root/start.sh

CMD ["bash", "/root/start.sh"]
