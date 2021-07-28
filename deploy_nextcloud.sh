#!/bin/bash

podman run \
  --name nextcloud \
  --detach \
  --env MYSQL_HOST=nextcloud-db.dns.podman \
  --env MYSQL_DATABASE=nextcloud \
  --env MYSQL_password=liebeshoehle \
  --env NEXTCLOUD_ADMIN_USER=Martin \
  --env NEXTCLOUD_ADMIN_PASSWORD=Jahnel01 \
  --volume /srv/Nextcloud/nextcloud-app:/var/www/html \
  --volume /srv/Nextcloud/nextcloud-data:/var/www/html/data \
  --restart on-failure \
  --pod nextcloud-pod
  docker.io/library/nextcloud:21
