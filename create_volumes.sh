#!/bin/bash

podman volume create /srv/nextcloud/nextcloud-app
podman volume create /srv/nextcloud/nextcloud-data
podman volume create /serv/nextcloud/nextcloud-db
