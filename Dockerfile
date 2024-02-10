FROM node:20.11.0-alpine3.19

RUN apk update && \
    apk add --no-cache \
    bash=5.2.21-r0 \
    git=2.43.0-r0 \
    gnupg=2.4.4-r0 \
    openssh=9.6_p1-r0

WORKDIR /app

USER node

COPY --chown=node release-it-entrypoint.sh /usr/local/bin/release-it-dockerised

ENTRYPOINT ["release-it-dockerised"]

CMD ["sh"]
