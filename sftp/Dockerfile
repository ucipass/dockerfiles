FROM alpine:latest
WORKDIR /root

RUN set -xe \
    && apk add --no-cache openrc \
    && apk add --no-cache openssh \
    && rc-update add sshd  \
    && apk add --no-cache curl \
    && apk add --no-cache bash \
    && ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa  \
    && ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa \
    && adduser admin -h /sftp -D \
    && echo "admin:admin" | chpasswd \
    && passwd -d root

COPY sshd_config /etc/ssh/

ENTRYPOINT ["/usr/sbin/sshd","-D"]
# CMD ["tail", "-f", "/dev/null"]
# CMD ["/bin/sh", "-c", "/root/interactive.sh"]
# CMD ["/bin/sh", "-c", "/root/interactive.sh ; trap : TERM INT; (while true; do sleep 1000; done) & wait"]
