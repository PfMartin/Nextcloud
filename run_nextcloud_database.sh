#!/bin/bash

podman run \
  -it \
  --name nextcloud-db \
  --volume /srv/nextcloud/nextcloud-db/data:/var/lib/postgresql/data \
  --env POSTGRES_DB=nextcloud_db \
  --env POSTGRES_USER=nextcloud \
  --env POSTGRES_PASSWORD=nextcloud \
  --rm \
  --pod nextcloud-pod \
  docker.io/library/postgres:latest
