FROM docker.io/library/node:20.11.1-alpine3.19@sha256:121edf6661770d20483818426b32042da33323b6fd30fc1ad4cd6890a817e240

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
