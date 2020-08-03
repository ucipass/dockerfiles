# Radius Server
## Settings
ports: 1812-1813
username: myuser
password: mypass
secret: mysecret
network: 0.0.0.0/0

## Startup
docker run -d --rm --name myradius -p 1812-1813:1812-1813/udp ucipass/radius

## Debug Mode
docker run -d --rm --name myradius -p 1812-1813:1812-1813/udp ucipass/radius -X

## Testing with radius client:
docker exec -it myradius radtest myuser mypass localhost 1812 mysecret