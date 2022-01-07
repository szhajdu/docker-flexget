# szhajdu/docker-flexget

Alpine based container that running [Flexget](https://www.flexget.com/) with [youtube-dl](http://ytdl-org.github.io/youtube-dl/) and [FFmpeg](https://www.ffmpeg.org/).

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
    ghcr.io/szhajdu/flexget
```

## Links

- [GitHub](https://github.com/Flexget/Flexget)
- [FlexGet Plugins](https://flexget.com/Plugins)
- [FlexGet Daemon](https://flexget.com/Daemon)
