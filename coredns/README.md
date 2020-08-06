## USage

docker run --name coredns --rm --volume=/home/aarato/containers/coredns:/root/ -p 53:53/udp coredns/coredns -conf /root/corefile
