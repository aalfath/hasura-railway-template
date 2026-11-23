# Hasura GraphQL Engine for Railway.
# Pinned to the official image by version and multi-arch index digest.
FROM hasura/graphql-engine:v2.51.9@sha256:70fba12ae0967b75f33cdc5b67280a264777a46e8dfcd89859a1c4ff1fe80baf

# Safe production defaults. Any of them can be overridden with a Railway variable.
ENV HASURA_GRAPHQL_ENABLE_CONSOLE=true \
    HASURA_GRAPHQL_DEV_MODE=false \
    HASURA_GRAPHQL_ENABLE_TELEMETRY=false

COPY start.sh /usr/local/bin/railway-start.sh
RUN chmod 0755 /usr/local/bin/railway-start.sh

CMD ["/usr/local/bin/railway-start.sh"]
