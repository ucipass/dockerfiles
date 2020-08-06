#!/bin/bash
# docker run --rm -e HOST=<HOST> -e USER=<USER> --name oc -it -p 3128:3128 -p 2222:22 --privileged ucipass/openconnect 
# ssh -o 'StrictHostKeyChecking no' -o 'UserKnownHostsFile=/dev/null' -p 2222 root@localhost

passwd -d root
ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
echo PermitEmptyPasswords yes >> /etc/ssh/sshd_config
echo PermitRootLogin  yes >> /etc/ssh/sshd_config
echo PermitEmptyPasswords  yes >> /etc/ssh/sshd_config
echo AllowTCPForwarding yes  >> /etc/ssh/sshd_config
echo PermitOpen any >> /etc/ssh/sshd_config
echo PermitTunnel yes >> /etc/ssh/sshd_config
sed -i '/AllowTcpForwarding/d' /etc/ssh/sshd_config
echo AllowTcpForwarding local >> /etc/ssh/sshd_config
PROXY_PORT=3128 node /root/proxy.js &
/usr/sbin/sshd
echo "All services started!"
tail -f /dev/null