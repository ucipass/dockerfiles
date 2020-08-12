# SFTP/SCP Server
This is generally an insecure setup that is only meant for temporary file transfers using SFTP or SCP
- root user has no password set
- insecure key exchange and ciphers are enabled for backward compatibililty

## Settings for SFTP Transfer

- ports: 22
- SFTP root dir: /sftp
- username: myuser
- password: mypass

## Startup for Windows with C:/sftp as the mounted SFTP root
docker run -d --rm --name sftp -v C:\sftp:/sftp -p 22:22 ucipass/sftp

## Startup for Linux with /tmp as the mounted SFTP root
docker run -d --rm --name sftp -v /tmp:/sftp -p 22:22 ucipass/sftp

## Testing Examples

| Platform | Example | Description |
| --- | --- | --- |
| Cisco IOS | copy running-config scp://myuser:mypass@10.1.1.1/running-config | SCP config transfer |
| Windows | psftp.exe  myuser@localhost -pw mypass | SFTP login from Windows using putty client |
| Linux | ssh -oCiphers=3des-cbc -oKexAlgorithms=+diffie-hellman-group1-sha1 admin@172.18.100.2 | SSH using legacy cipher and key exchange |

