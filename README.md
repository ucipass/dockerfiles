## Docker Folders

All of these Docker containers are meant to be in a test/dev environment and must be considered as insecure for long-term use!

- radius: Simple Radius server with basic parameters based on Freeradius
- sftp:   Simple SFTP/SCP server based on OpenSSH

## Docker Cheat Sheet
| Command | Description |
| --- | --- |
| docker run IMAGE | run a new container of IMAGE |
| docker run -it IMAGE | run container in interactive mode |
| docker run --rm IMAGE | run container and remove container after it stops |
| docker run --name MYNAME IMAGE | run container and assign name MYNAME |
| docker stop $(docker ps -a -q) | STOP all containers |
| docker rm $(docker ps -a -q) | REMOVE all stopped containers |
