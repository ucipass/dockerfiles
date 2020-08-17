#!/bin/bash

# OPENCONNECT USAGE 
# docker run --rm -e HOST=<HOST> -e USER=<USER> --name oc -it -p 3128:3128 -p 2222:22 --privileged ucipass/openconnect 
# SSH with Legacy support
# ssh -o 'StrictHostKeyChecking no' -o 'UserKnownHostsFile=/dev/null' -p 2222 root@localhost

echo works

passwd -d root
ssh-keygen -y -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
ssh-keygen -y -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
mkdir -p /run/sshd
/usr/sbin/sshd
PROXY_PORT=3128 /root/proxy-linux &
echo "All services started!"
/root/openconnect.sh start

tail -f /dev/null