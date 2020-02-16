#!/bin/bash

/usr/bin/docker run --name $1 \
  -p 10096:8080 \
  -e PROXY_TO_HOST_IP_PORT=$(/sbin/ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+'):8080 \
  -e VIRTUAL_HOST=jejenkins2.szeremi.org,jenkins.localtest.me \
  -e VIRTUAL_PORT=8080 \
  -e LETSENCRYPT_HOST=jejenkins2.szeremi.org \
  -e LETSENCRYPT_EMAIL=attila@szeremi.org \
  --network szeremi \
  $2
