FROM docker.io/library/node:22.14.0-alpine3.21@sha256:9bef0ef1e268f60627da9ba7d7605e8831d5b56ad07487d24d1aa386336d1944

# renovate: datasource=repology depName=alpine_3_20/bash versioning=loose
ENV BASH_VERSION="5.2.37-r0"

# renovate: datasource=repology depName=alpine_3_20/curl versioning=loose
ENV CURL_VERSION="8.12.1-r0"

# renovate: datasource=repology depName=alpine_3_20/git versioning=loose
ENV GIT_VERSION="2.47.2-r0"

# renovate: datasource=repology depName=alpine_3_20/gnupg versioning=loose
ENV GNUPG_VERSION="2.4.7-r0"

# renovate: datasource=repology depName=alpine_3_20/libssl3 versioning=loose
ENV LIBSSL3_VERSION="3.3.3-r0"

RUN apk update && \
    apk add --no-cache \
    bash="${BASH_VERSION}" \
    curl="${CURL_VERSION}" \
    git="${GIT_VERSION}" \
    gnupg="${GNUPG_VERSION}" \
    libssl3="${LIBSSL3_VERSION}"

WORKDIR /app

USER node

COPY --chown=node release-it-entrypoint.sh /usr/local/bin/release-it-containerized

ENTRYPOINT ["release-it-containerized"]

CMD ["sh"]
