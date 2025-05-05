FROM docker.io/library/node:22.15.0-alpine3.21@sha256:ad1aedbcc1b0575074a91ac146d6956476c1f9985994810e4ee02efd932a68fd

# renovate: datasource=repology depName=alpine_3_21/bash versioning=loose
ENV BASH_VERSION="5.2.37-r0"

# renovate: datasource=repology depName=alpine_3_21/c-ares versioning=loose
ENV CARES_VERSION="1.34.5-r0"

# renovate: datasource=repology depName=alpine_3_21/curl versioning=loose
ENV CURL_VERSION="8.12.1-r1"

# renovate: datasource=repology depName=alpine_3_21/git versioning=loose
ENV GIT_VERSION="2.47.2-r0"

# renovate: datasource=repology depName=alpine_3_21/gnupg versioning=loose
ENV GNUPG_VERSION="2.4.7-r0"

# renovate: datasource=repology depName=alpine_3_21/libssl3 versioning=loose
ENV LIBSSL3_VERSION="3.3.3-r0"

# renovate: datasource=repology depName=alpine_3_21/openssh versioning=loose
ENV OPENSSH_VERSION="9.9_p2-r0"

# renovate: datasource=repology depName=alpine_3_21/sqlite-libs versioning=loose
ENV SQLITE_LIBS_VERSION="3.48.0-r2"

RUN apk update && \
    apk add --no-cache \
    bash="${BASH_VERSION}" \
    c-ares="${CARES_VERSION}" \
    curl="${CURL_VERSION}" \
    git="${GIT_VERSION}" \
    gnupg="${GNUPG_VERSION}" \
    libssl3="${LIBSSL3_VERSION}" \
    openssh="${OPENSSH_VERSION}" \
    sqlite-libs="${SQLITE_LIBS_VERSION}"

WORKDIR /app

USER node

COPY --chown=node release-it-entrypoint.sh /usr/local/bin/release-it-containerized

ENTRYPOINT ["release-it-containerized"]

CMD ["sh"]
