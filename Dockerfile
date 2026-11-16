# Hasura GraphQL Engine for Railway.
# Pinned to the official image by version and multi-arch index digest.
FROM hasura/graphql-engine:v2.51.8@sha256:2ebf7df902ca13fb32e0714ef2e73d47dc66e7867f33698cd014320e3f577e03

# Safe production defaults. Any of them can be overridden with a Railway variable.
ENV HASURA_GRAPHQL_ENABLE_CONSOLE=true \
    HASURA_GRAPHQL_DEV_MODE=false \
    HASURA_GRAPHQL_ENABLE_TELEMETRY=false

COPY start.sh /usr/local/bin/railway-start.sh
RUN chmod 0755 /usr/local/bin/railway-start.sh

CMD ["/usr/local/bin/railway-start.sh"]
