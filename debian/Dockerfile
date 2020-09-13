FROM debian:testing
WORKDIR /root
ENV TZ=America/Chicago

RUN set -xe \
    && apt-get update -y \
    && DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata \
    && apt-get install -y openssh-server openconnect bash nano curl wget xmlstarlet python3-pip net-tools

COPY sshd_config /etc/ssh/sshd_config

RUN set -xe \
    && useradd -m -d /admin admin \
    && echo "admin:admin" | chpasswd \
    && passwd -d root \
    ssh-keygen -A -v \
    mkdir -p /run/sshd




# Configure SSHD.
# SSH login fix. Otherwise user is kicked off after login
# RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
# RUN mkdir /var/run/sshd
# RUN bash -c 'install -m755 <(printf "#!/bin/sh\nexit 0") /usr/sbin/policy-rc.d'
# RUN ex +'%s/^#\zeListenAddress/\1/g' -scwq /etc/ssh/sshd_config
# RUN ex +'%s/^#\zeHostKey .*ssh_host_.*_key/\1/g' -scwq /etc/ssh/sshd_config
# RUN RUNLEVEL=1 dpkg-reconfigure openssh-server
# RUN ssh-keygen -A -v
# RUN update-rc.d ssh defaults

# CMD ["/bin/sh","-c","openconnect --csd-user=root --csd-wrapper=/root/.cisco/csd-wrapper.sh -b <IP> ; trap : TERM INT; (while true; do sleep 1000; done) & wait"]
# CMD ["/bin/sh", "-c", "/root/interactive.sh"]