#!/bin/bash

podman run \
  --name nextcloud-nginx \
  --detach \
  --volume /srv/Nextcloud/nginx:/etc/nginx/conf.d \
  --restart on-failure \
  --pod nextcloud-pod \
  docker.io/library/nginx
