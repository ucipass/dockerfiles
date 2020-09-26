FROM alpine

RUN set -xe \
    && apk add --no-cache iptables openssl strongswan util-linux nano bash nmap

COPY init.sh /init.sh
COPY docker-entrypoint.sh /docker-entrypoint.sh

# CUSTOMIZE THESE ENV VARIABLES! 
# ENV VPN_GATEWAY=12.2.84.187
# ENV VPN_SECRET="evHcFzgB6.ZLK21tUka7roCaFsc4ZWgp"
# ENV PRIV_LOCAL_NET=192.168.1.0/26
# ENV PRIV_LOCAL_IP=192.168.1.0/26
# ENV PRIV_REMOTE_NET=10.1.0.0/16
# OPTIONAL SECOND REMOTE NET
# ENV PRIV_REMOTE_NET2=10.1.2.0/24  
# ENV IKE=aes128-sha-modp1024,aes256-sha-modp1024,aes256-sha256-modp1024,3des-sha1-modp1024,aes256-sha1-modp1024!
# ENV IKE_LIFETIME=8h
# ENV ESP=sha-modp1024,aes256-sha-modp1024,aes256-sha256,3des-sha1,aes256-sha1!
# ENV ESP_LIFETIME=1h

EXPOSE 500/udp 4500/udp
CMD ["/init.sh"]
# ENTRYPOINT ["/docker-entrypoint.sh"]
