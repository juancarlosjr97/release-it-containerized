FROM docker.io/library/node:26.12.1-alpine3.24@sha256:40cd011b55415bc894e45b02fdd5a5dfde056921b7d23a64c74f80497af48797

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
ENV OPENSSH_VERSION="10.3_p1-r1"

# renovate: datasource=repology depName=alpine_3_24/zlib versioning=loose
ENV ZLIB_VERSION="1.3.2-r1"

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

LABEL org.opencontainers.image.authors="Juan Carlos Blanco Delgado" \
      org.opencontainers.image.annotations.documentation="https://github.com/opencontainers/image-spec/blob/v1.1.1/annotations.md" \
      org.opencontainers.image.description="A containerized version of release-it that runs in any environment without requiring a Node.js installation" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.source="${REPO}" \
      org.opencontainers.image.title="Release It Containerized" \
      org.opencontainers.image.version="${VERSION}"

ENTRYPOINT ["release-it-containerized"]

CMD ["sh"]
