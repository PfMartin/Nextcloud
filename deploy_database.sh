#!/bin/bash

. "/srv/Variables.env"

podman run \
  --name nextcloud-db \
  --detach \
  --env MYSQL_DATABASE=$DATABASE_NAME \
  --env MYSQL_PASSWORD=$DATABASE_PASSWORD \
  --env MYSQL_ROOT_PASSWORD=$DATABASE_PASSWORD_ROOT \
  --volume /srv/Nextcloud/nextcloud-db:/var/lib/mysql \
  --pod nextcloud-pod \
  --restart on-failure \
  docker.io/library/mariadb:10
