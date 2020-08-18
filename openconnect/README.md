# Openconnect Docker Container
Cisco compatible VPN client in a Docker container with local SSH and Web proxy service.

## Settings

- Web Proxy port: 3128
- SSH port: 22
- username: root
- password: <empty>


## Example
```
docker run --rm -e HOST=<HOSTNAME> -e USER=<USER> --name oc -it -p 3128:3128 -p 2222:22 --privileged ucipass/openconnect
```
