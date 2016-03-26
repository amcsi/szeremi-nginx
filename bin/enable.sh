#!/usr/bin/env bash
# Enables a service.

listAvailableServices() {
    echo "Available services:"
    cd units
    find . -name "*.service" | sed -E 's/\.\/([^.]*)\.service/* \1/g'
    cd - > /dev/null
}

if [ -z "$1" ]; then
    echo "Usage: $0 <service file>"
    echo ""
    listAvailableServices

    exit 1;
fi


serviceFile=$(realpath "$1")
if [ ! -f "$serviceFile" ]; then
    serviceFile=$(realpath "units/$1.service")
fi

if [ ! -f "$serviceFile" ]; then
    echo "Service '$1' was not found."
    echo ""
    listAvailableServices

    exit 1;
fi

sudo systemctl enable $(realpath "$serviceFile")
