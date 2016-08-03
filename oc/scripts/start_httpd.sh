#!/bin/sh

if [ ! -f /var/www/html/config/autoconfig.php ]; then
	# TODO: Check for sane DB_* variables
	cp /root/autoconfig.php /var/www/html/config/autoconfig.php
	chown www-data:nogroup /var/www/html/config/autoconfig.php
	sed --in-place "s#-x-database-name-x-#${DB_NAME}#" /var/www/html/config/autoconfig.php
	sed --in-place "s#-x-database-user-x-#${DB_USER}#" /var/www/html/config/autoconfig.php
	sed --in-place "s#-x-database-pass-x-#${DB_PASS}#" /var/www/html/config/autoconfig.php
	sed --in-place "s#-x-database-host-x-#${DB_HOST}#" /var/www/html/config/autoconfig.php
	sed --in-place "s#-x-oc-adminpass-x-#${OC_ADMINPASS}#" /var/www/html/config/autoconfig.php
fi

if [ ! -f /etc/apache2/sites-available/owncloud.conf ]; then
    cp /root/owncloud_virtualhost.conf /etc/apache2/sites-available/owncloud.conf
    sed --in-place "s#-x-server-name-x-#${OC_DOMAIN}#" /etc/apache2/sites-available/owncloud.conf
    sed --in-place "s#-x-server-webmaster-x-#${OC_WEBMASTER}#" /etc/apache2/sites-available/owncloud.conf
    ln -s /etc/apache2/sites-available/owncloud.conf /etc/apache2/sites-enabled/owncloud.conf
    chown -R www-data:nogroup /var/www/html/data
fi

apache2-foreground
