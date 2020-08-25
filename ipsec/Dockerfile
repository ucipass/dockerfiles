FROM alpine

RUN set -xe \
    && apk add --no-cache iptables openssl strongswan util-linux nano bash nmap

COPY init.sh /init.sh
COPY docker-entrypoint.sh /docker-entrypoint.sh

# CUSTOMIZE THESE ENV VARIABLES! 
ENV VPN_GATEWAY=50.50.50.50
ENV VPN_SECRET="SuperSecretSharedKey"
ENV PRIV_LOCAL_NET=172.18.100.0/24
ENV PRIV_REMOTE_NET=10.1.1.0/24
# OPTIONAL SECOND REMOTE NET
ENV PRIV_REMOTE_NET2=10.1.2.0/24  
ENV IKE=aes256-sha-modp1024,aes256-sha256-modp1024,3des-sha1-modp1024,aes256-sha1-modp1024!
ENV IKE_LIFETIME=1h
ENV ESP=aes256-sha-modp1024,aes256-sha256,3des-sha1,aes256-sha1!
ENV ESP_LIFETIME=8h

EXPOSE 500/udp 4500/udp

ENTRYPOINT ["/docker-entrypoint.sh"]