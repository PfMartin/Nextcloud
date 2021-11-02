#!/bin/bash

directoryroot=/home/server/Container-Volumes/Nextcloud

podman run \
  --name nextcloud-nginx \
  --detach \
  --volume ${directoryroot}/nginx:/etc/nginx/conf.d \
  --restart on-failure \
  --pod nextcloud-pod \
  docker.io/library/nginx
