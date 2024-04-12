#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

docker compose up -d
./scripts/wait-service.sh graphql-engine 8080
hasura metadata apply
./scripts/reset-local-database.sh