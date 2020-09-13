## Docker Folders

All of these Docker containers are meant to be in a test/dev environment and must be considered as insecure for long-term use!

- coredns: Simple DNS server with basic parameters based on CoreDNS
- radius: Simple Radius server with basic parameters based on Freeradius
- sftp:   Simple SFTP/SCP server based on OpenSSH
- openconnect: Cisco compatible VPN client in a Docker container

## Docker Cheat Sheet
### RUN/MANAGE
| Command | Description |
| --- | --- |
| docker run IMAGE | Run a new instance of container IMAGE |
| docker run -it IMAGE | Run container in interactive mode |
| docker run --rm IMAGE | Run container and remove container after it stops |
| docker run --name CONTAINERNAME IMAGE | Run container and assign name CONTAINERNAME |
| docker exec -it CONTAINERNAME /bin/bash | Run command line in new process   |
| docker start -a CONTAINERNAME | restart stopped container and attach to terminal |
| docker attach CONTAINERNAME | Display standard input/output/error of the main process  |
| docker container inspect CONTAINERNAME | Display detailed info about container |

### STOP/DELETE
| Command | Description |
| --- | --- |
| docker stop CONTAINERID | Stop container with CONTAINERID |
| docker stop $(docker ps -a -q) | Stop all containers |
| docker rm CONTAINERID | Delete container with CONTAINERID |
| docker container prune | Delete all stopped containers |
| docker rmi IMAGE | Delete container IMAGE |
| docker rmi $(docker images -q) | Delete all container images |
| docker rmi $(docker images \| grep "^<none>" \| awk '{ print $3}') | Remove all <none> Docker images - Linux only |
| docker rm $(docker ps -a \| grep -v mongo \| cut -d " " -f1)  | Delete all containers except with names mongo |
### PUBLISH/BUILD
| Command | Description |
| --- | --- |
| docker images | List all local Docker images |
| docker build –f  Dockerfile -t USERNAME/IMAGEID . | Build Docker Image in from current directory using Dockerfile |
| docker login --username=USERNAME | Login to Docker Hub as USERNAME|
| docker commit CONTAINERID USERNAME/IMAGEID | Create a new image from a container’s changes |
| docker push USERNAME/IMAGEID | Push Image to Docker Hub |
| docker pull USERNAME/IMAGEID | Pull Image from Docker Hub |
| docker save USERNAME/IMAGE -o IMAGE.tar | Save Docker image as tar archive |
| docker load -i IMAGEID.tar | Load Docker image as tar archive |
