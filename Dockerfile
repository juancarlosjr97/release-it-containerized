FROM docker.io/library/node:26.13.0-alpine3.24@sha256:c6ad9e9c1d80f6eb607c26b4b0a132ff7a2344fad1c78ea3baa2a7d4c8de6d94

# renovate: datasource=repology depName=alpine_3_24/bash versioning=loose
ENV BASH_VERSION="5.3.9-r1"

# renovate: datasource=repology depName=alpine_3_24/curl versioning=loose
ENV CURL_VERSION="8.23.0-r0"

# renovate: datasource=repology depName=alpine_3_24/git versioning=loose
ENV GIT_VERSION="2.54.0-r0"

# renovate: datasource=repology depName=alpine_3_24/gnupg versioning=loose
ENV GNUPG_VERSION="2.4.9-r1"

# renovate: datasource=repology depName=alpine_3_24/libssl3 versioning=loose
ENV LIBSSL3_VERSION="3.5.9-r0"

# renovate: datasource=repology depName=alpine_3_24/musl versioning=loose
ENV MUSL_VERSION="1.2.6-r3"

# renovate: datasource=repology depName=alpine_3_24/musl-utils versioning=loose
ENV MUSL_UTILS_VERSION="1.2.6-r3"

# renovate: datasource=repology depName=alpine_3_24/openssh versioning=loose
ENV OPENSSH_VERSION="10.3_p1-r2"

# renovate: datasource=repology depName=alpine_3_24/zlib versioning=loose
ENV ZLIB_VERSION="1.4-r0"

RUN apk update && \
    apk add --no-cache \
    bash="${BASH_VERSION}" \
    curl="${CURL_VERSION}" \
    git="${GIT_VERSION}" \
    gnupg="${GNUPG_VERSION}" \
    libssl3="${LIBSSL3_VERSION}" \
    musl="${MUSL_VERSION}" \
    musl-utils="${MUSL_UTILS_VERSION}" \
    openssh="${OPENSSH_VERSION}" \
    zlib="${ZLIB_VERSION}"

WORKDIR /app

USER node

COPY --chown=node release-it-entrypoint.sh /usr/local/bin/release-it-containerized

ARG REPO=https://github.com/juancarlosjr97/release-it-containerized
ARG VERSION=dev
ARG BUILD_DATE=unknown
ARG VCS_REF=unknown
ARG BASE_NAME=docker.io/library/node:24.19.0-alpine3.23
ARG BASE_DIGEST=sha256:244cc2b53f46f9e876304391d17682b0ddae9ac33491f4857e25e35a36ba7995

LABEL org.opencontainers.image.authors="Juan Carlos Blanco Delgado" \
      org.opencontainers.image.annotations.documentation="https://github.com/opencontainers/image-spec/blob/v1.1.1/annotations.md" \
      org.opencontainers.image.base.digest="${BASE_DIGEST}" \
      org.opencontainers.image.base.name="${BASE_NAME}" \
      org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.description="A containerized version of release-it that runs in any environment without requiring a Node.js installation" \
      org.opencontainers.image.documentation="https://github.com/opencontainers/image-spec/blob/v1.1.1/annotations.md" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.revision="${VCS_REF}" \
      org.opencontainers.image.source="${REPO}" \
      org.opencontainers.image.title="Release It Containerized" \
      org.opencontainers.image.version="${VERSION}"

ENTRYPOINT ["release-it-containerized"]

CMD ["sh"]
