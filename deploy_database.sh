#!/bin/bash

podman run \
  --detach \
  --env MYSQL_DATABASE=nextcloud \
  --env MYSQL_PASSWORD=liebeshoehle \
  --env MYSQL_ROOT_PASSWORD=liebeshoehle \
  --volume nextcloud-db:/var/lib/mysql \
  --network nextcloud-net \
  --restart on-failure \
  --name nextcloud-db \
  docker.io/library/mariadb:10
