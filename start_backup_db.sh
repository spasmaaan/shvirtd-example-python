#!/bin/bash

sudo mkdir -p ${OUTPATH}
sudo chmod 666 ${OUTPATH}

docker pull schnitzler/mysqldump:latest

now=$(date +"%s_%Y-%m-%d")

docker run \
    --rm --entrypoint "" \
    -v ${OUTPATH}:/backup \
    --network=${TARGET_NETWORK} \
    --link="${TARGET_CONTAINER}:alias" \
    schnitzler/mysqldump:latest \
    mysqldump --opt -h alias -u ${MYSQL_USER} -p "${MYSQL_PASSWORD}" \
        "--result-file=/backup/${now}_${MYSQL_DATABASE}.sql" \
        ${MYSQL_DATABASE}