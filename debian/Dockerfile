FROM debian:testing
WORKDIR /root
ENV TZ=America/Chicago
ENV TERM=linux

RUN set -xe \
    && apt-get update -y \
    && DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata \
    && apt-get install -y openssh-server openconnect bash nano vim curl wget xmlstarlet python3-pip net-tools iperf iperf3 certbot open traceroute dnsutils \
    && useradd -m -d /admin -s /bin/bash admin \
    && echo "admin:admin" | chpasswd \
    && passwd -d root \
    && mkdir -p /run/sshd \
    && ssh-keygen -A -v 

## SSH/SCP/SFTP
COPY sshd_config /etc/ssh/sshd_config

## TFTP
RUN set -xe \
    && apt-get -y install tftpd-hpa  \
    && sed -i 's/^TFTP_USERNAME.*/TFTP_USERNAME="admin"/' /etc/default/tftpd-hpa \
    && sed -i 's/^TFTP_DIRECTORY.*/TFTP_DIRECTORY="\/admin"/' /etc/default/tftpd-hpa \
    && sed -i 's/^TFTP_ADDRESS.*/TFTP_ADDRESS="0.0.0.0:69"/' /etc/default/tftpd-hpa \
    && sed -i 's/^TFTP_OPTIONS.*/TFTP_OPTIONS="--secure -c -v --port-range 65000:65010"/' /etc/default/tftpd-hpa 

RUN pip3 install ansible
RUN pip3 install viptela


# ENTRYPOINT /usr/sbin/sshd -D && /bin/bash
# CMD ["/bin/sh","-c"," WHATEVER_PROGRAM ; trap : TERM INT; (while true; do sleep 1000; done) & wait"]
# CMD ["/bin/sh", "-c", "/root/interactive.sh"]
