FROM docker.io/library/node:24.13.1-alpine3.23@sha256:4f696fbf39f383c1e486030ba6b289a5d9af541642fc78ab197e584a113b9c03

# renovate: datasource=repology depName=alpine_3_23/bash versioning=loose
ENV BASH_VERSION="5.3.3-r1"

# renovate: datasource=repology depName=alpine_3_23/busybox versioning=loose
ENV BUSYBOX_VERSION="1.37.0-r30"

# renovate: datasource=repology depName=alpine_3_23/c-ares versioning=loose
ENV CARES_VERSION="1.34.6-r0"

# renovate: datasource=repology depName=alpine_3_23/curl versioning=loose
ENV CURL_VERSION="8.17.0-r1"

# renovate: datasource=repology depName=alpine_3_23/git versioning=loose
ENV GIT_VERSION="2.52.0-r0"

# renovate: datasource=repology depName=alpine_3_23/gnupg versioning=loose
ENV GNUPG_VERSION="2.4.9-r0"

# renovate: datasource=repology depName=alpine_3_23/libssl3 versioning=loose
ENV LIBSSL3_VERSION="3.5.5-r0"

# renovate: datasource=repology depName=alpine_3_23/libtasn1 versioning=loose
ENV LIBTASN_VERSION="4.21.0-r0"

# renovate: datasource=repology depName=alpine_3_23/openssh versioning=loose
ENV OPENSSH_VERSION="10.2_p1-r0"

# renovate: datasource=repology depName=alpine_3_23/sqlite-libs versioning=loose
ENV SQLITE_LIBS_VERSION="3.51.2-r0"

RUN apk update && \
    apk add --no-cache \
    bash="${BASH_VERSION}" \
    busybox="${BUSYBOX_VERSION}" \
    c-ares="${CARES_VERSION}" \
    curl="${CURL_VERSION}" \
    git="${GIT_VERSION}" \
    gnupg="${GNUPG_VERSION}" \
    libssl3="${LIBSSL3_VERSION}" \
    libtasn1="${LIBTASN_VERSION}" \
    openssh="${OPENSSH_VERSION}" \
    sqlite-libs="${SQLITE_LIBS_VERSION}"

WORKDIR /app

USER node

COPY --chown=node release-it-entrypoint.sh /usr/local/bin/release-it-containerized

ENTRYPOINT ["release-it-containerized"]

CMD ["sh"]
