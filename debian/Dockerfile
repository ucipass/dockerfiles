FROM debian:testing
WORKDIR /root
ENV TZ=America/Chicago
ENV TERM=linux

RUN set -xe \
    && apt-get update -y \
    && DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata \
    && apt-get install -y openssh-server openconnect bash nano curl wget xmlstarlet python3-pip net-tools \
    && useradd -m -d /admin -s /bin/bash admin \
    && echo "admin:admin" | chpasswd \
    && passwd -d root \
    && mkdir -p /run/sshd \
    && ssh-keygen -A -v 

COPY sshd_config /etc/ssh/sshd_config

RUN pip3 install ansible
RUN pip3 install viptela


# ENTRYPOINT /usr/sbin/sshd -D && /bin/bash
# CMD ["/bin/sh","-c"," WHATEVER_PROGRAM ; trap : TERM INT; (while true; do sleep 1000; done) & wait"]
# CMD ["/bin/sh", "-c", "/root/interactive.sh"]
