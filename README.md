# szhajdu/docker-flexget

Alpine based container that running [Flexget](https://www.flexget.com/) and [FFmpeg](https://www.ffmpeg.org/).

## Build image

Make a note of the current version of [FlexGet on PyPI](https://pypi.org/project/FlexGet/).

```bash
docker build --build-arg FLEXGET_VERSION=<version> -t szhajdu/flexget:latest .
```

## Run container

```bash
docker run -d \
    --name=flexget \
    -e PUID=<uid> \
    -e PGID=<gid> \
    -e TZ=Europe/Berlin \
    -p 5050:5050 \
    -v <path to data>:/config \
    -v <path to downloads>:/downloads \
    szhajdu/flexget
```

## Links

- [GitHub](https://github.com/Flexget/Flexget)
- [FlexGet Plugins](https://flexget.com/Plugins)
- [FlexGet Daemon](https://flexget.com/Daemon)
