[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/hasura-2?utm_medium=integration&utm_source=button&utm_campaign=hasura)

# Hasura GraphQL Engine on Railway

A Railway template for [Hasura GraphQL Engine](https://github.com/hasura/graphql-engine) **v2.51.9**: instant realtime GraphQL and REST APIs over Postgres, with role-based permissions, event triggers and scheduled triggers.

It is built to slot into a project that already runs an app on Railway: point Hasura at your existing Postgres over Railway's private network and get a GraphQL API on top of it.

## What it deploys

| Service | Source | Notes |
|---|---|---|
| `Hasura` | this repo (`Dockerfile`) | Official `hasura/graphql-engine:v2.51.9` image, pinned by digest. Public domain, health check `/healthz`. |
| `Postgres` | Railway Postgres | Hasura's metadata database (and the default data source until you change it). Data on a volume. |

The wrapper is small: `start.sh` makes Hasura listen on Railway's `PORT`, and refuses to start without an admin secret or a database URL, so the GraphQL endpoint is never left open. The console is on, dev mode and telemetry are off.

## Variables

| Variable | Default | What it does |
|---|---|---|
| `HASURA_GRAPHQL_ADMIN_SECRET` | `${{secret(32)}}` | Admin secret. Needed to open the console and for admin API calls (`X-Hasura-Admin-Secret` header). |
| `HASURA_GRAPHQL_METADATA_DATABASE_URL` | `${{Postgres.DATABASE_URL}}` | Where Hasura stores its metadata. Keep it on the bundled Postgres. |
| `HASURA_GRAPHQL_DATABASE_URL` | `${{Postgres.DATABASE_URL}}` | The Postgres that Hasura exposes as its `default` source. Point it at your app's database, for example `${{MyAppDb.DATABASE_URL}}`. |
| `PORT` | `8080` | Port Hasura listens on. |

Optional settings (JWT auth, an unauthorized role, CORS, more sources) are standard Hasura variables you can add on the `Hasura` service; see the [server config reference](https://hasura.io/docs/2.0/deployment/graphql-engine-flags/reference/).

## Connecting your existing database

1. Deploy the template into the project that runs your app.
2. On the `Hasura` service, set `HASURA_GRAPHQL_DATABASE_URL` to a reference to your database, for example `${{Postgres-abcd.DATABASE_URL}}`. Railway's `DATABASE_URL` uses the private `*.railway.internal` host, so traffic stays inside the project.
3. Open the public URL, go to `/console`, enter the admin secret, and track the tables you want in the API.

You can also add more databases as extra sources from the console (Data → Connect database), using an environment variable name that holds the URL.

## Updates

The `Dockerfile` pins the upstream image by version and digest. A new Hasura version arrives as a commit to `main` of this repo, with a `CHANGELOG.md` entry. Railway then shows "update available" on the services you deployed from this template, and you choose when to apply it. Read the changelog first: breaking changes are listed at the top of each entry.

## Local test

```sh
docker compose -f compose.local.yaml up --build
curl http://localhost:42331/healthz
```

## License

The wrapper files in this repo are MIT. Hasura GraphQL Engine is Apache-2.0.
