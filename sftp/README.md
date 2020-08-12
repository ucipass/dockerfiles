# SFTP/SCP Server
This is generally an insecure setup that is only meant for temporary file transfers using SFTP or SCP
root user has no password set

## Settings for SFTP Transfer

- ports: 22
- SFTP root dir: /sftp
- username: myuser
- password: mypass

## Startup for Windows with C:/sftp as the mounted SFTP root
docker run -d --rm --name sftp -v C:\sftp:/sftp -p 22:22 ucipass/sftp

## Startup for Linux with /tmp as the mounted SFTP root
docker run -d --rm --name sftp -v /tmp:/sftp -p 22:22 ucipass/sftp
