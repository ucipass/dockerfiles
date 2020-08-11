FROM alpine:latest
WORKDIR /root
# COPY csd-wrapper.sh .cisco/csd-wrapper.sh
# COPY init.sh ./init.sh
# COPY interactive.sh ./interactive.sh
# COPY proxy.js ./proxy.js
# COPY package.json ./package.json
# RUN chmod +x ./*
RUN set -xe \
    && apk add --no-cache openrc \
    && apk add --no-cache openssh \
    && rc-update add sshd  \
    && apk add --no-cache curl \
    && apk add --no-cache bash \
    && ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa  \
    && ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa \
    && echo PermitEmptyPasswords yes >> /etc/ssh/sshd_config \
    && echo PermitRootLogin  yes >> /etc/ssh/sshd_config \
    && echo PermitEmptyPasswords  yes >> /etc/ssh/sshd_config \
    && echo AllowTCPForwarding yes  >> /etc/ssh/sshd_config \
    && echo PermitOpen any >> /etc/ssh/sshd_config \
    && echo PermitTunnel yes >> /etc/ssh/sshd_config \
    && sed -i '/AllowTcpForwarding/d' /etc/ssh/sshd_config \
    && echo AllowTcpForwarding local >> /etc/ssh/sshd_config \
    && echo Match User myuser >> /etc/ssh/sshd_config \
    && echo "  ChrootDirectory /myuser" >> /etc/ssh/sshd_config \
    && echo "  ForceCommand internal-sftp" >> /etc/ssh/sshd_config \
    && echo "  AllowTcpForwarding no" >> /etc/ssh/sshd_config \
    && echo "  X11Forwarding no" >> /etc/ssh/sshd_config \
    && adduser myuser -h /myuser -D \
    && echo "myuser:mypass" | chpasswd \
    && passwd -d root


ENTRYPOINT ["/usr/sbin/sshd","-D"]
# CMD ["tail", "-f", "/dev/null"]
# CMD ["/bin/sh", "-c", "/root/interactive.sh"]
# CMD ["/bin/sh", "-c", "/root/interactive.sh ; trap : TERM INT; (while true; do sleep 1000; done) & wait"]
