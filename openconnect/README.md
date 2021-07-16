# Openconnect Docker Container
Cisco compatible VPN client in a Docker container with local SSH and Web proxy service acting as a jumphost

## Chrome startup using the local container as proxy server
chrome.exe --proxy-server="http://127.0.0.1:3128" -profile-directory="<DIR>" --user-data-dir="<DIR>"

## SSH parameters to use the localcontainer as a jumphost for SSH connections
- Web Proxy port: 3128
- SSH port: 22
- username: root
- password: <empty>


## Example for Cisco VPN Anyconenct connection
```
docker run --rm -e HOST=<HOSTNAME> -e USER=<USER> --name oc -it -p 3128:3128 -p 2222:22 --privileged ucipass/openconnect
```
## Example for Palo Alto GlobalProtect VPN connection
```
docker run --rm -e HOST=<HOSTNAME> -e CERT=<CERT> -e USER=<USER> -e GP=PALO --name oc -it -p 3128:3128 -p 2222:22 --privileged ucipass/openconnect
```
