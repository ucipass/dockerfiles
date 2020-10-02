FROM debian:testing
WORKDIR /root
ENV TZ=America/Chicago

RUN set -xe \
    && apt-get update -y \
    && DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata \
    && apt-get install -y procps nano vim curl wget net-tools traceroute dnsutils nmap \
    && apt-get install -y nginx libnginx-mod-http-headers-more-filter libnginx-mod-http-dav-ext apache2-utils

RUN sed -i '1s/^/daemon off;\n/'    /etc/nginx/nginx.conf
RUN sed -i  's/^user .*/user root;/' /etc/nginx/nginx.conf
RUN sed -i  's/.*access_log.*/   access_log \/dev\/stdout;/' /etc/nginx/nginx.conf
RUN sed -i  's/.*error_log.*/    error_log  \/dev\/stdout;/' /etc/nginx/nginx.conf

RUN rm /var/www/html/*
COPY index.html /var/www/html/index.html
COPY default /etc/nginx/sites-available/default
COPY init.sh /root/init.sh
RUN chmod 755 /root/init.sh

CMD ["/root/init.sh"]
