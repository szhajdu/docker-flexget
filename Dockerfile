FROM python:3.11-alpine

ARG FLEXGET_VERSION=3.9.19

# Install basic packages
RUN apk update && \
    apk add --no-cache \
        bash \
        libxml2-dev \
        libxslt-dev \
        tzdata && \
    apk add --no-cache --virtual .build-deps \
        autoconf \
        automake \
        freetype-dev \
        g++ \
        gcc \
        jpeg-dev \
        lcms2-dev \
        libffi-dev \
        libpng-dev \
        libwebp-dev \
        linux-headers \
        make \
        openjpeg-dev \
        openssl-dev \
        tiff-dev \
        zlib-dev

# Install flexget
RUN pip3 install --no-cache-dir -U pip && \
    pip3 install flexget==${FLEXGET_VERSION}

# Clean up
RUN apk del .build-deps && \
    rm -rf \
        /var/cache/* \
        /root/.cache \
        /tmp/* \
        /build \
        /root/packages

# Expose Web UI port and config folder
EXPOSE 5050/tcp
VOLUME /config

# Flexget looks for config.yml automatically inside:
# /root/.flexget, /root/.config/flexget
# Since the uid/gid for user can be changed on the fly, set 777.
RUN ln -s /config /root/.flexget && \
    chmod 777 /root/

# Add start script
COPY start.sh /root/start.sh
RUN  chmod +x /root/start.sh

CMD ["bash", "/root/start.sh"]
