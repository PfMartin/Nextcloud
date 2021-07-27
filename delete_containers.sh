#!/bin/bash

sudo rm -rfv ~/nextcloud

podman pod stop nextcloud-pod && podman pod rm nextcloud-pod
