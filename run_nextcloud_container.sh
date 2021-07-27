#!/bin/bash

podman run \
  --name nextcloud \
  -it \
  --volume /srv/nextcloud:/var/www/html \
  --volume /srv/nextcloud/data:/var/www/html/data \
  --volume /srv/nextcloud/config:/var/www/html/config \
  --volume /srv/nextcloud/apps:/var/www/html/apps \
  --volume /etc/localtime:/etc/localtime:ro \
  --env POSTGRES_HOST=localhost \
  --env POSTGRES_DB=nextcloud_db \
  --env POSTGRES_USER=nextcloud \
  --env POSTGRES_PASSWORD=nextcloud \
  --rm \
  --pod nextcloud-pod \
  docker.io/library/nextcloud:19
