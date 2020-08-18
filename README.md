## Docker Folders

All of these Docker containers are meant to be in a test/dev environment and must be considered as insecure for long-term use!

- radius: Simple Radius server with basic parameters based on Freeradius
- sftp:   Simple SFTP/SCP server based on OpenSSH

## Docker Cheat Sheet
### RUN/STOP/DELETE
| Command | Description |
| --- | --- |
| docker run IMAGE | run a new instance of container IMAGE |
| docker run -it IMAGE | run container in interactive mode |
| docker run --rm IMAGE | run container and remove container after it stops |
| docker run --name CONTAINERNAME IMAGE | run container and assign name CONTAINERNAME |
| docker exec -it CONTAINERNAME /bin/bash | run command line in new process   |
| docker attach CONTAINERNAME | standard input/output/error of the main process  |

### CLEANUP
| Command | Description |
| --- | --- |
| docker stop CONTAINERID | STOP container with CONTAINERID |
| docker stop $(docker ps -a -q) | STOP all containers |
| docker rmi IMAGE | DELETE container IMAGE |
| docker rmi $(docker ps -a -q) | DELETE all stopped containers |
### PUBLISH/BUILD
| Command | Description |
| --- | --- |
| docker images | list all local Docker images |
| docker build –f  Dockerfile -t USERNAME/IMAGEID . | Build Docker Image in from current directory using Dockerfile |
| docker login --username=USERNAME | Login to Docker Hub as USERNAME|
| docker push USERNAME/IMAGEID | Push Image to Docker Hub |
| docker pull USERNAME/IMAGEID | Pull Image from Docker Hub |
| docker save USERNAME/IMAGE -o IMAGE.tar | save Docker image as tar archive |
| docker load -i IMAGEID.tar | load Docker image as tar archive |

