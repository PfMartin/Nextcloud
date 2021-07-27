#!/bin/bash

podman network create nextcloud-net

podman volume create nextcloud-app
podman volume create nextcloud-data
podman volume create nextcloud-db
