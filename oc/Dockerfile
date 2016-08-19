FROM owncloud:9.1.0-apache

EXPOSE 443

# Install sudo to be able to run occ-tool as www-data
RUN apt-get update && \
    apt-get install -y sudo && \
    rm -rf /var/lib/apt/lists/*

COPY scripts/start_httpd.sh /start_httpd.sh
COPY config/autoconfig.php /root/autoconfig.php
COPY config/owncloud_virtualhost.conf /root/owncloud_virtualhost.conf
COPY scripts/occ /usr/local/sbin

RUN a2enmod ssl

CMD ["/start_httpd.sh"]



