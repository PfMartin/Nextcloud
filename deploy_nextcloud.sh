#!/bin/bash

directoryroot=/home/server/Container-Volumes/Nextcloud

. ${directoryroot}/Variables.env

podman run \
  --name nextcloud \
  --detach \
  --env MYSQL_HOST=nextcloud-db.dns.podman \
  --env MYSQL_DATABASE=$DATABASE_NAME \
  --env MYSQL_password=$DATABASE_PASSWORD \
  --env NEXTCLOUD_ADMIN_USER=$NEXTCLOUD_ADMIN \
  --env NEXTCLOUD_ADMIN_PASSWORD=$NEXTCLOUD_PASSWORD \
  --volume ${directoryroot}/nextcloud-app:/var/www/html \
  --volume ${directoryroot}/nextcloud-data:/var/www/html/data \
  --restart on-failure \
  --pod nextcloud-pod \
  docker.io/library/nextcloud:21
