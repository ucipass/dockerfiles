# Radius Server
This is generally an insecure setup that is only meant for temporary radius authentication testing
## Settings

- ports: 1812-1813
- username: myuser
- password: mypass
- Cisco-AVPair : "shell:priv-lvl=15"
- secret: mysecret
- network: 0.0.0.0/0

## Startup
docker run -d --rm --name myradius -p 1812-1813:1812-1813/udp ucipass/radius

## Debug Mode
docker run -d --rm --name myradius -p 1812-1813:1812-1813/udp ucipass/radius -X

## Testing with radius client:
docker exec -it myradius radtest myuser mypass localhost 1812 mysecret

## Sample Cisco IOS Radius config snippet
```
aaa new-model
!
aaa group server radius MYRADIUS
 server 10.255.254.201 auth-port 1812 acct-port 1813
!
aaa authentication login default group radius local
aaa authorization exec default group radius local
!
radius-server host 10.255.254.201 auth-port 1812 acct-port 1813 key mysecret
```
