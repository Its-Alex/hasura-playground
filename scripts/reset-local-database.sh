#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

docker-compose exec postgres sh -c "psql --quiet -v ON_ERROR_STOP=1 -U hasura hasura -c 'DROP SCHEMA IF EXISTS public CASCADE'"
docker-compose exec postgres sh -c "psql --quiet -v ON_ERROR_STOP=1 -U hasura hasura -c 'CREATE SCHEMA IF NOT EXISTS public'"
hasura seed apply --database-name default
hasura migrate apply --down all --database-name default
hasura migrate apply --database-name default
docker-compose exec postgres sh -c "cd /fixtures/ && psql --quiet -v ON_ERROR_STOP=1 -U hasura hasura -f index.sql"
