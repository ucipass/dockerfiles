## USage
- Copy corefile and dns database file e.g. example.com.db to a local directory that will be used as a Docker volume
- Make changes to the zone and/or dns records


## Startup for Windows with C:/coredns volume mounted as /root
docker run --name coredns --rm --volume=c:\coredns:/root/ -p 53:53/udp coredns/coredns -conf /root/corefile

## Startup for Linux with /tmp/coredns volume mounted as /root
docker run --name coredns --rm --volume=/tmp/coredns:/root/ -p 53:53/udp coredns/coredns -conf /root/corefile
