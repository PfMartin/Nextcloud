#!/bin/bash

mkdir -p /srv/Nextcloud/nextcloud-app
mkdir -p /srv/Nextcloud/nextcloud-data
mkdir -p /srv/Nextcloud/nextcloud-db


podman pod ps | grep nextcloud-pod
if [[ $? == 0 ]]; then
  podman pod stop nextcloud-pod && podman pod rm -f nextcloud-pod
fi

podman pod create --name nextcloud-pod --publish 8080:80
