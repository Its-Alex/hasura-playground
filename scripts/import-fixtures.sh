#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

docker-compose exec postgres sh -c "cd /fixtures/ && psql --quiet -v ON_ERROR_STOP=1 -U hasura hasura -f index.sql"
