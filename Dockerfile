FROM docker.io/library/node:20.18.0-alpine3.20@sha256:c13b26e7e602ef2f1074aef304ce6e9b7dd284c419b35d89fcf3cc8e44a8def9

# renovate: datasource=repology depName=alpine_3_20/bash versioning=loose
ENV BASH_VERSION="5.2.26-r0"

# renovate: datasource=repology depName=alpine_3_20/busybox versioning=loose
ENV BUSYBOX_VERSION="1.36.1-r29"

# renovate: datasource=repology depName=alpine_3_20/c-ares versioning=loose
ENV C_ARES_VERSION="1.33.1-r0"

# renovate: datasource=repology depName=alpine_3_20/curl versioning=loose
ENV CURL_VERSION="8.10.1-r0"

# renovate: datasource=repology depName=alpine_3_20/expat versioning=loose
ENV EXPACT_VERSION="2.6.3-r0"

# renovate: datasource=repology depName=alpine_3_20/git versioning=loose
ENV GIT_VERSION="2.45.2-r0"

# renovate: datasource=repology depName=alpine_3_20/gnupg versioning=loose
ENV GNUPG_VERSION="2.4.5-r0"

# renovate: datasource=repology depName=alpine_3_20/libcrypto3 versioning=loose
ENV LIBCRYPTO3_VERSION="3.3.2-r0"

# renovate: datasource=repology depName=alpine_3_20/libssl3 versioning=loose
ENV LIBSSL3_VERSION="3.3.2-r0"

# renovate: datasource=repology depName=alpine_3_20/openssh versioning=loose
ENV OPENSSH_VERSION="9.7_p1-r4"

RUN apk update && \
    apk add --no-cache \
    bash="${BASH_VERSION}" \
    busybox="${BUSYBOX_VERSION}" \
    c-ares="${C_ARES_VERSION}" \
    curl="${CURL_VERSION}" \
    expat="${EXPACT_VERSION}" \
    git="${GIT_VERSION}" \
    gnupg="${GNUPG_VERSION}" \
    libcrypto3="${LIBCRYPTO3_VERSION}" \
    libssl3="${LIBSSL3_VERSION}" \
    openssh="${OPENSSH_VERSION}"

WORKDIR /app

USER node

COPY --chown=node release-it-entrypoint.sh /usr/local/bin/release-it-containerized

ENTRYPOINT ["release-it-containerized"]

CMD ["sh"]
