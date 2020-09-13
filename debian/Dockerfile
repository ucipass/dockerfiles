FROM debian:testing
WORKDIR /root
ENV TZ=America/Chicago

RUN set -xe \
    && apt-get update -y \
    && DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata \
    && apt-get install -y openssh-server openconnect bash nano curl wget xmlstarlet python3-pip

COPY sshd_config /etc/ssh/sshd_config

# CMD ["/bin/sh","-c","openconnect --csd-user=root --csd-wrapper=/root/.cisco/csd-wrapper.sh -b <IP> ; trap : TERM INT; (while true; do sleep 1000; done) & wait"]
# CMD ["/bin/sh", "-c", "/root/interactive.sh"]