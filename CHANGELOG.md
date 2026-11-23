# Changelog

## 2.51.9 (2026-11-23)

- Breaking changes: none. No new variables. Metadata is upgraded in place on start as before.
- Patch release: fixes a segfault or corrupted results on gzipped responses over 2 GB, Console permission summaries, and dependency vulnerabilities in the data connector. See the [v2.51.9 release notes](https://github.com/hasura/graphql-engine/releases/tag/v2.51.9).
- Hasura GraphQL Engine v2.51.8 → **v2.51.9** (`hasura/graphql-engine:v2.51.9@sha256:70fba12ae0967b75f33cdc5b67280a264777a46e8dfcd89859a1c4ff1fe80baf`).
- Tested on Railway before merging: the published template was deployed, data was written, the service was switched to this version, and the data and login were still there.

## 2.51.8-1 (2026-11-16)

- README: add the Deploy on Railway button for the published template `hasura-2`. No changes to the app or its configuration.
- No breaking changes.

## 2.51.8 (2026-11-16)

- First release of the template: Hasura GraphQL Engine v2.51.8 (`hasura/graphql-engine:v2.51.8@sha256:2ebf7df902ca13fb32e0714ef2e73d47dc66e7867f33698cd014320e3f577e03`) with Railway Postgres for metadata.
- No breaking changes.
