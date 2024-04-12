# Hasura playground

This repository is a playground for local [hasura](https://hasura.io/) instance.

## Requirements

- [`mise`](https://mise.jdx.dev/)
- [`docker`](https://www.docker.com/)

Execute these commands to install dependencies:

```sh
$ mise install
$ pip install -U pgcli
```

## Getting started

First you must launch hasura and setup it. A script done this automatically:

```sh
$ ./scripts/up.sh
[+] Running 3/3
 ✔ Container hasura-playground-data-connector-agent-1  Healthy                                                                                                                                                                                                               0.0s
 ✔ Container hasura-playground-postgres-1              Running                                                                                                                                                                                                               0.0s
 ✔ Container hasura-playground-graphql-engine-1        Running                                                                                                                                                                                                               0.0s
Waiting for graphql-engine:8080  .  up!
Everything is up
INFO hasura cli is up to date                      version=2.38.1
INFO Metadata applied
```

You can then go to `http://localhost:8080` to access hasura dashboard.

By default some fixtures are automatically imported, you can see them in
[`./fixtures/index.sql`](./fixtures/index.sql).

## Reset hasura and database

You can reset hasura and postgres to default state by using
[`reset-local-database.sh`](./scripts/reset-local-database.sh):

```sh
$ ./scripts/reset-local-database.sh
NOTICE:  drop cascades to 4 other objects
DETAIL:  drop cascades to table users
drop cascades to table tags
drop cascades to table users_tags
drop cascades to table events
INFO Seeds planted
INFO migrations applied
INFO migrations applied
```

Hasura and database will be reset with default fixtures.

## Enter postgres database

A script is available to automatically connect to postgres shell using
[pgcli](https://www.pgcli.com/):

```sh
$ ./scripts/enter-postgres.sh
Server: PostgreSQL 15.6
Version: 4.0.1
Home: http://pgcli.com
hasura@127:hasura>
```

You can now execute any SQL commands.

## Down

You can cleanup project by using [`down.sh`](./scripts/down.sh):

```sh
$ ./scripts/down.sh
```

## License

[MIT](/LICENSE)
