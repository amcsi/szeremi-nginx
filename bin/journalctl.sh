#!/usr/bin/env bash
# Checks the journal for the given service.

if [ -z "$1" ]; then
    echo "Checks the journal for the given service."
    echo "Usage: $0 <service>"
    echo ""
    listAvailableServices

    exit 1;
fi

journalctl -a -u $1 --since='1 hour ago'
