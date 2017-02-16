#!/bin/sh
docker exec -it owncloud_owncloud_db_1 bash -c 'mysql -u ${MYSQL_USER} --password=${MYSQL_PASSWORD} ${MYSQL_DATABASE}'

