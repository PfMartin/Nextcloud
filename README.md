# Nextcloud

This repository is for setting up a nextcloud in a container for my home network.

## Methods
For exercising purposes I tried 2 different variations of deploying the Nextcloud in my home network.

#### Deployment with a podman network
The deployment with a podman network is accessible in the branch `network_version`. It uses 2 containers - the database container and the nextcloud container - and a podman network.

#### Deployment with a podman pod
The deployment with a podman pod is my favorite method. You can find that approach either in the `main` branch or the branch `pod_version`. The pod approach uses custom volumes, which share the path `/srv/Nextcloud` on my server with the corresponding container. On big difference to the network approach is, that here 3 containers are used instead of only 2.

## Deployment
The deployment is achieved by running 1 setup script and 2 (network_version) or 3 (pod_version) containers.

#### setup.sh
This script sets up everything for deploying the containers. First of all it creates the required podman volumes (network_version) or the directories for the volumes. For the pod_version it also creates the nginx directory and copies the `nginx.conf` file to this directory. In addition to that it creates the network or the pod the containers will run in later.

#### deploy_database.sh
Next, the script `deploy_database.sh` sets up the database container with a MariaDB image. It sets the environment variables database, password, and root password for the database. Additionally, the volume is specified. It shares the directory `/var/lib/mysql` inside the container with the directory that was setup earlier in `setup.sh`.
Further, it's deployed in the pod nextcloud-pod.

#### deploy_nextcloud.sh
`deploy_nextcloud` deploys the nextcloud container. The container gets the environment variables from the database. Further, it shares the directories `/var/www/html` and `/var/www/html/data` with the directories created previously.

#### deploy_nginx.sh
For the pod_version a webserver is needed in order to bring the port nextcloud container's port to the outside. For this the `nginx.conf` file is required. It creates a reverse proxy to the address `127.0.0.1:8080`, where 8080 is the nextcloud container's port. It proxies that port to the port 80, which is accessible from outside the pod. The pods port is 8080. So if you try to connect to your server at port 8080, you access the port 80 of the pod. Since the port 80 of the pod is mapped to 127.0.0.1:8080, you are able to access the nextcloud container.
