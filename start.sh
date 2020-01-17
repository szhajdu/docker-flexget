#!/bin/sh
if [ -f /root/.flexget/.config-lock ]; then
    rm /root/.flexget/.config-lock
fi
flexget daemon start
