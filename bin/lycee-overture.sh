#!/bin/bash

# Base file for running the lycee-overture container.

source /etc/environment

docker run \
  -v ${LYCEE_OVERTURE_STORAGE_DIR}:/var/www/storage \
  -v ${LYCEE_OVERTURE_NGINX_CONFIG_FILE}:/etc/nginx/sites-available/default \
  --env-file=${LYCEE_OVERTURE_ENV_FILE} \
  -e LOG_CHANNEL=errorlog \
  --network szeremi \
  "$@"
