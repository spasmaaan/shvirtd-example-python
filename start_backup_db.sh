#!/bin/bash

export $(xargs < .env)

docker pull schnitzler/mysqldump

now=$(date +"%s_%Y-%m-%d")
docker run \
    --rm --entrypoint "" \
    -v `pwd`/backup:/backup \
    --link="container:alias" \
    schnitzler/mysqldump \
    mysqldump --opt -h ${MYSQL_HOST} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" "--result-file=/opt/backup/${now}_${MYSQL_DATABASE}.sql" database