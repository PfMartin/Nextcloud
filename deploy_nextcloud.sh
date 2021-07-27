#!/bin/bash

podman run \
  --detach \
  --env MYSQL_HOST=nextcloud-db.dns.podman \
  --env MYSQL_DATABASE=nextcloud \
  --env MYSQL_password=liebeshoehle \
  --env NEXTCLOUD_ADMIN_USER=Martin \
  --env NEXTCLOUD_ADMIN_PASSWORD=Jahnel01 \
  --volume nextcloud-app:/var/www/html \
  --volume nextcloud-data:/var/www/html/data \
  --network nextcloud-net \
  --restart on-failure \
  --publish 8080:80 \
  --name nextcloud \
  docker.io/library/nextcloud:21
