FROM docker.io/library/node:20.11.1-alpine3.19@sha256:f4c96a28c0b2d8981664e03f461c2677152cd9a756012ffa8e2c6727427c2bda

# renovate: datasource=repology depName=alpine_3_19/bash versioning=loose
ENV BASH_VERSION="5.2.21-r0"

# renovate: datasource=repology depName=alpine_3_19/git versioning=loose
ENV GIT_VERSION="2.43.0-r0"

# renovate: datasource=repology depName=alpine_3_19/gnupg versioning=loose
ENV GNUPG_VERSION="2.4.4-r0"

# renovate: datasource=repology depName=alpine_3_19/openssh versioning=loose
ENV OPENSSH_VERSION="9.6_p1-r0"

RUN apk update && \
    apk add --no-cache \
    bash="${BASH_VERSION}" \
    git="${GIT_VERSION}" \
    gnupg="${GNUPG_VERSION}" \
    openssh="${OPENSSH_VERSION}"

WORKDIR /app

USER node

COPY --chown=node release-it-entrypoint.sh /usr/local/bin/release-it-containerized

ENTRYPOINT ["release-it-containerized"]

CMD ["sh"]
