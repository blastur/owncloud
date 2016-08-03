FROM owncloud:9-apache

EXPOSE 443

COPY scripts/start_httpd.sh /start_httpd.sh
COPY config/autoconfig.php /root/autoconfig.php
COPY config/owncloud_virtualhost.conf /root/owncloud_virtualhost.conf

RUN a2enmod ssl

CMD ["/start_httpd.sh"]



