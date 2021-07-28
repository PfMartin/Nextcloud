#!/bin/bash

podman run \
  --name nextcloud-db \
  --detach \
  --env MYSQL_DATABASE=nextcloud \
  --env MYSQL_PASSWORD=liebeshoehle \
  --env MYSQL_ROOT_PASSWORD=liebeshoehle \
  --volume /srv/Nextcloud/nextcloud-db:/var/lib/mysql \
  --pod nextcloud-pod \
  --restart on-failure \
  docker.io/library/mariadb:10
