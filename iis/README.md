# Windows IIS Web Server
This is an example Dockerfile based on https://docs.microsoft.com/en-us/virtualization/windowscontainers/manage-docker/manage-windows-dockerfile

## Build local IIS image
docker build -t iis .

## Start on port 8080
docker run --rm --name iis -d -p 8080:80 iis
