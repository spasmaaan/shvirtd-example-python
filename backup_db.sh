#!/bin/sh

now=$(date +"%s_%Y-%m-%d")
/usr/bin/mysqldump --opt -h ${MYSQL_HOST} -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} > "/opt/backup/${now}_${MYSQL_DATABASE}.sql"