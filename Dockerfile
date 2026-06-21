FROM docker.io/library/node:24.16.0-alpine3.23@sha256:2bdb65ed1dab192432bc31c95f94155ca5ad7fc1392fb7eb7526ab682fa5bf14

# renovate: datasource=repology depName=alpine_3_23/bash versioning=loose
ENV BASH_VERSION="5.3.3-r1"

# renovate: datasource=repology depName=alpine_3_23/busybox versioning=loose
ENV BUSYBOX_VERSION="1.37.0-r30"

# renovate: datasource=repology depName=alpine_3_23/c-ares versioning=loose
ENV CARES_VERSION="1.34.6-r0"

# renovate: datasource=repology depName=alpine_3_23/curl versioning=loose
ENV CURL_VERSION="8.19.0-r0"

# renovate: datasource=repology depName=alpine_3_23/git versioning=loose
ENV GIT_VERSION="2.52.0-r0"

# renovate: datasource=repology depName=alpine_3_23/gnupg versioning=loose
ENV GNUPG_VERSION="2.4.9-r0"

# renovate: datasource=repology depName=alpine_3_23/libexpat versioning=loose
ENV LIBEXPAT_VERSION="2.8.1-r0"

# renovate: datasource=repology depName=alpine_3_23/libcrypto3 versioning=loose
ENV LIBCRYPTO3_VERSION="3.5.7-r0"

# renovate: datasource=repology depName=alpine_3_23/libssl3 versioning=loose
ENV LIBSSL3_VERSION="3.5.7-r0"

# renovate: datasource=repology depName=alpine_3_23/libtasn1 versioning=loose
ENV LIBTASN_VERSION="4.21.0-r0"

# renovate: datasource=repology depName=alpine_3_23/musl versioning=loose
ENV MUSL_VERSION="1.2.5-r23"

# renovate: datasource=repology depName=alpine_3_23/musl-utils versioning=loose
ENV MUSL_UTILS_VERSION="1.2.5-r23"

# renovate: datasource=repology depName=alpine_3_23/openssh versioning=loose
ENV OPENSSH_VERSION="10.2_p1-r0"

# renovate: datasource=repology depName=alpine_3_23/sqlite-libs versioning=loose
ENV SQLITE_LIBS_VERSION="3.51.2-r0"

# renovate: datasource=repology depName=alpine_3_23/zlib versioning=loose
ENV ZLIB_VERSION="1.3.2-r0"

RUN apk update && \
    apk add --no-cache \
    bash="${BASH_VERSION}" \
    busybox="${BUSYBOX_VERSION}" \
    c-ares="${CARES_VERSION}" \
    curl="${CURL_VERSION}" \
    git="${GIT_VERSION}" \
    gnupg="${GNUPG_VERSION}" \
    libexpat="${LIBEXPAT_VERSION}" \
    libcrypto3="${LIBCRYPTO3_VERSION}" \
    libssl3="${LIBSSL3_VERSION}" \
    libtasn1="${LIBTASN_VERSION}" \
    musl="${MUSL_VERSION}" \
    musl-utils="${MUSL_UTILS_VERSION}" \
    openssh="${OPENSSH_VERSION}" \
    sqlite-libs="${SQLITE_LIBS_VERSION}" \
    zlib="${ZLIB_VERSION}"

WORKDIR /app

USER node

COPY --chown=node release-it-entrypoint.sh /usr/local/bin/release-it-containerized

ARG REPO=https://github.com/juancarlosjr97/release-it-containerized
ARG VERSION=dev

LABEL org.opencontainers.image.authors="Juan Carlos Blanco Delgado" \
      org.opencontainers.image.annotations.documentation="https://github.com/opencontainers/image-spec/blob/v1.1.1/annotations.md" \
      org.opencontainers.image.description="A containerized version of release-it that runs in any environment without requiring a Node.js installation" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.source="${REPO}" \
      org.opencontainers.image.title="Release It Containerized" \
      org.opencontainers.image.version="${VERSION}"

ENTRYPOINT ["release-it-containerized"]

CMD ["sh"]
