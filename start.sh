#!/bin/sh
# Start Hasura on Railway's PORT and refuse to start without an admin secret.
set -e

export HASURA_GRAPHQL_SERVER_PORT="${PORT:-8080}"

if [ -z "${HASURA_GRAPHQL_ADMIN_SECRET:-}" ]; then
  echo "HASURA_GRAPHQL_ADMIN_SECRET is empty: refusing to start an open GraphQL endpoint." >&2
  exit 1
fi

# An empty variable would be read as a connection string, so drop empty ones.
[ -n "${HASURA_GRAPHQL_DATABASE_URL:-}" ] || unset HASURA_GRAPHQL_DATABASE_URL
[ -n "${HASURA_GRAPHQL_METADATA_DATABASE_URL:-}" ] || unset HASURA_GRAPHQL_METADATA_DATABASE_URL

if [ -z "${HASURA_GRAPHQL_DATABASE_URL:-}" ] && [ -z "${HASURA_GRAPHQL_METADATA_DATABASE_URL:-}" ]; then
  echo "Set HASURA_GRAPHQL_METADATA_DATABASE_URL (and optionally HASURA_GRAPHQL_DATABASE_URL) to a Postgres URL." >&2
  exit 1
fi

exec "${HGE_BINARY:-graphql-engine}" serve
