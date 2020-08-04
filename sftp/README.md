# SFTP/SCP Server
This is generally an insecure setup that is only meant for temporary file transfers using SFTP or SCP
root user has no password set

## Settings for SFTP Transfer

- ports: 22
- SFTP dir: /myuser
- username: myuser
- password: mypass

## Startup for Windows with C:/tmp as the mounted SFTP root
docker run -d --rm --name sftp -v C:\tmp:/myuser -p 22:22 ucipass/sftp

## Startup for Linux with /tmp as the mounted SFTP root
docker run -d --rm --name sftp -v /tmp:/myuser -p 22:22 ucipass/sftp
