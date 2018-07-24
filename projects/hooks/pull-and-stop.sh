#!/bin/sh

# $1 is the image name (on Docker Hub)
docker pull "$1"

# $2 is the local container name
docker stop "$2"
