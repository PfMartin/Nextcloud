#!/bin/bash

mkdir /srv/Nextcloud/nextcloud-app
mkdir /srv/Nextcloud/nextcloud-data
mkdir /srv/Nextcloud/nextcloud-db


podman pod ps | grep nextcloud-pod
if [[ $? == 0 ]]; then
  podman pod stop nextcloud-pod && podman pod rm -f nextcloud-pod
fi

podman pod create --name nextcloud-pod --publish 8080:80
