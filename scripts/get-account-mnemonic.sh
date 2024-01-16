#!/bin/bash

container_id=$(docker ps -q -f name=voinetwork_algod)
if [ -z "${container_id}" ]; then
    echo "AVM container is not running. Please start it first."
    exit 1
fi

if [ -z "$1" ]; then
    echo "Please provide an account address as a parameter."
    echo "Example: get-account-mnemonic.sh <account_address>"
    exit 1
fi
docker exec -e account_addr="$1" -it "${container_id}" bash -c 'goal account export -a $account_addr'

