#!/bin/bash

podport="8080"

echo -e "What's the root directory of the container"

read directoryroot

mkdir -p ${directoryroot}/nextcloud-app
mkdir -p ${directoryroot}/nextcloud-data
mkdir -p ${directoryroot}/nextcloud-db
mkdir -p ${directoryroot}/nginx

cp ./nginx/* ${directoryroot}/nginx

podman pod ps | grep nextcloud-pod
if [[ $? == 0 ]]; then
  podman pod stop nextcloud-pod && podman pod rm -f nextcloud-pod
fi

podman pod create --name nextcloud-pod --publish ${podport}:80
