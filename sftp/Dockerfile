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
    && adduser myuser -h /sftp -D \
    && echo "myuser:mypass" | chpasswd \
    && passwd -d root

COPY sshd_config /etc/ssh/


# Configure SSHD.
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN mkdir /var/run/sshd
RUN bash -c 'install -m755 <(printf "#!/bin/sh\nexit 0") /usr/sbin/policy-rc.d'
RUN ex +'%s/^#\zeListenAddress/\1/g' -scwq /etc/ssh/sshd_config
RUN ex +'%s/^#\zeHostKey .*ssh_host_.*_key/\1/g' -scwq /etc/ssh/sshd_config
RUN RUNLEVEL=1 dpkg-reconfigure openssh-server
RUN ssh-keygen -A -v
RUN update-rc.d ssh defaults


ENTRYPOINT ["/usr/sbin/sshd","-D"]
# CMD ["tail", "-f", "/dev/null"]
# CMD ["/bin/sh", "-c", "/root/interactive.sh"]
# CMD ["/bin/sh", "-c", "/root/interactive.sh ; trap : TERM INT; (while true; do sleep 1000; done) & wait"]
