FROM alpine:latest
WORKDIR /root

RUN set -xe \
    && apk add --no-cache curl 
COPY dyndns.sh /root
RUN chmod -R a+x /root/dyndns.sh

# ENTRYPOINT ["/usr/sbin/sshd","-D"]
# CMD ["tail", "-f", "/dev/null"]
CMD ["/bin/sh", "-c", "/root/dyndns.sh"]
# CMD ["/bin/sh", "-c", "/root/interactive.sh ; trap : TERM INT; (while true; do sleep 1000; done) & wait"]
