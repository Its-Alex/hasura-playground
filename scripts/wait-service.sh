#!/usr/bin/env bash
#
# How to use:
#
# $ ./scripts/wait-service.sh postgres1 5432
#
set -e

cd "$(dirname "$0")/../"

ContainerID="$(docker-compose ps -q "$1")"
NetworkID="$(docker inspect "$ContainerID" | jq '.[0].NetworkSettings.Networks|map(select(true))[0].NetworkID' -r)"

docker run \
    -e TARGETS="$1":"$2" \
    --network "$NetworkID" \
    --rm \
    waisbrot/wait
