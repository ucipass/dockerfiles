FROM debian:testing
WORKDIR /root
COPY csd-wrapper.sh .cisco/csd-wrapper.sh
COPY openconnect.sh ./openconnect.sh
COPY interactive.sh ./interactive.sh
COPY proxy-linux ./proxy-linux
COPY package.json ./package.json
RUN chmod -R a+x ./*
RUN chmod -R a+x ./.cisco
ENV TZ=America/Chicago

RUN set -xe \
    && apt-get update -y \
    && DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata \
    && apt-get install -y openssh-server openconnect socat iputils-ping bash nano curl wget xmlstarlet nmap traceroute

COPY sshd_config /etc/ssh/sshd_config

# CMD ["/bin/sh","-c","openconnect --csd-user=root --csd-wrapper=/root/.cisco/csd-wrapper.sh -b <IP> ; trap : TERM INT; (while true; do sleep 1000; done) & wait"]
CMD ["/bin/sh", "-c", "/root/interactive.sh"]