#!/bin/bash

# File for all environment variables
. "/srv/Nextcloud/Variables.env"

podman run \
  --name nextcloud-db \
  --detach \
  --env MYSQL_DATABASE=$DATABASE_NAME \
  --env MYSQL_PASSWORD=$DATABASE_PASSWORD \
  --env MYSQL_ROOT_PASSWORD=$DATABASE_ROOT_PASSWORD \
  --volume /srv/Nextcloud/nextcloud-db:/var/lib/mysql \
  --pod nextcloud-pod \
  --restart on-failure \
  docker.io/library/mariadb:10
