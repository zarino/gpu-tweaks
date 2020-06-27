# GPU tweaks

My settings for a Sapphire Vega 56 Pulse GPU running under Pop_OS 20.04.

An attempt to prevent "black screen" crashes, based on notes from [this issue thread](https://gitlab.freedesktop.org/drm/amd/-/issues/716).

## Running this locally

The code assumes:

1. It has been checked out at `/usr/local/src/gpu-tweaks`
2. The GPU is accessible at `/sys/class/drm/card0/device`

To install:

    sudo mkdir -p /usr/local/src
    cd /usr/local/src
    sudo git clone https://github.com/zarino/gpu-tweaks.git
    sudo ln -s /usr/local/src/gpu-tweaks/gpu-tweaks.service /etc/systemd/system/gpu-tweaks.service
    sudo systemctl enable gpu-tweaks.service
    sudo systemctl start gpu-tweaks.service
    /usr/local/src/gpu-tweaks/boot-parameters.bash add
