FROM docker.io/library/node:20.12.2-alpine3.19@sha256:e18f74fc454fddd8bf66f5c632dfc78a32d8c2737d1ba4e028ee60cfc6f95a9b

# renovate: datasource=repology depName=alpine_3_19/bash versioning=loose
ENV BASH_VERSION="5.2.21-r0"

# renovate: datasource=repology depName=alpine_3_19/c-ares versioning=loose
ENV C_ARES_VERSION="1.27.0-r0"

# renovate: datasource=repology depName=alpine_3_19/git versioning=loose
ENV GIT_VERSION="2.43.0-r0"

# renovate: datasource=repology depName=alpine_3_19/gnupg versioning=loose
ENV GNUPG_VERSION="2.4.4-r0"

# renovate: datasource=repology depName=alpine_3_19/libcrypto3 versioning=loose
ENV LIBCRYPTO3_VERSION="3.1.4-r6"

# renovate: datasource=repology depName=alpine_3_19/libssl3 versioning=loose
ENV LIBSSL3_VERSION="3.1.4-r6"

# renovate: datasource=repology depName=alpine_3_19/openssh versioning=loose
ENV OPENSSH_VERSION="9.6_p1-r0"

RUN apk update && \
    apk add --no-cache \
    bash="${BASH_VERSION}" \
    c-ares="${C_ARES_VERSION}" \
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
