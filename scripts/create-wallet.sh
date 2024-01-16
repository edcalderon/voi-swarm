#!/bin/bash

container_id=$(docker ps -q -f name=voinetwork_algod)
if [ -z "${container_id}" ]; then
    echo "AVM container is not running. Please start it first."
    exit 1
fi

if [ -z "$1" ]; then
    echo "Please provide a wallet name as a parameter."
    echo "Example: create-wallet.sh <wallet_name>"
    exit 1
fi

docker exec -it "${container_id}" goal wallet new "$1"
