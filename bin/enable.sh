#!/usr/bin/env bash
# Enables a service.

listAvailableServices() {
    echo "Available services:"
    cd units
    find . -name "*.service" | sort | sed -E 's/\.\/([^.]*)\.service/* \1/g'
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

# Enable all unit related files; not just .service files, but e.g. .timer files too.
serviceFileWithoutExtension=$(echo "$serviceFile" | sed -E 's/\.service$//')
unitFiles=$(find $serviceFileWithoutExtension.*)

for unitFile in $unitFiles
do
    sudo systemctl enable $(realpath "$unitFile")
done
