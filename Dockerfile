FROM docker.io/library/node:20.15.0-alpine3.19@sha256:c39be8a03811d866e0f5e18fcd2065a914931a3c0830b29403017db3def59d91

# renovate: datasource=repology depName=alpine_3_19/bash versioning=loose
ENV BASH_VERSION="5.2.21-r0"

# renovate: datasource=repology depName=alpine_3_19/busybox versioning=loose
ENV BUSYBOX_VERSION="1.36.1-r19"

# renovate: datasource=repology depName=alpine_3_19/c-ares versioning=loose
ENV C_ARES_VERSION="1.27.0-r0"

# renovate: datasource=repology depName=alpine_3_19/git versioning=loose
ENV GIT_VERSION="2.43.4-r0"

# renovate: datasource=repology depName=alpine_3_19/gnupg versioning=loose
ENV GNUPG_VERSION="2.4.4-r0"

# renovate: datasource=repology depName=alpine_3_19/libcrypto3 versioning=loose
ENV LIBCRYPTO3_VERSION="3.1.5-r0"

# renovate: datasource=repology depName=alpine_3_19/libssl3 versioning=loose
ENV LIBSSL3_VERSION="3.1.5-r0"

# renovate: datasource=repology depName=alpine_3_19/openssh versioning=loose
ENV OPENSSH_VERSION="9.6_p1-r0"

RUN apk update && \
    apk add --no-cache \
    bash="${BASH_VERSION}" \
    busybox="${BUSYBOX_VERSION}" \
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
