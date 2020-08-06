FROM alpine:latest
WORKDIR /root
COPY csd-wrapper.sh .cisco/csd-wrapper.sh
COPY init.sh ./init.sh
COPY interactive.sh ./interactive.sh
COPY proxy.js ./proxy.js
COPY package.json ./package.json
RUN chmod +x ./*
RUN set -xe \
    && apk add --no-cache openrc \
    && apk add --no-cache openssh \
    && rc-update add sshd \
    && apk add nodejs-current \
    && apk add --update nodejs npm \
    && npm install \
    && apk add --no-cache curl \
    && apk add --no-cache bash \
    && apk add --no-cache \
               --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
               openconnect
# CMD ["openconnect", "--csd-user=root", "--csd-wrapper=/root/.cisco/csd-wrapper.sh", "-b", "50.201.16.130"]
# CMD ["/bin/sh","-c","openconnect --csd-user=root --csd-wrapper=/root/.cisco/csd-wrapper.sh -b 50.201.16.130 ; trap : TERM INT; (while true; do sleep 1000; done) & wait"]
# ENTRYPOINT ["tail"]
# CMD ["tail", "-f", "/dev/null"]
CMD ["/bin/sh", "-c", "/root/interactive.sh"]