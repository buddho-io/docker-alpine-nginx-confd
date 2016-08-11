FROM nginx:stable-alpine

MAINTAINER SmartThings Developers "developers@smartthings.com"

ENV CONFD_VERSION "0.11.0"

RUN \
  set -ex \
  && apk add --no-cache --virtual .build-deps \
    curl \
  && curl -fSL https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 -o /usr/bin/confd \
  && chmod 755 /usr/bin/confd \
  && apk del .build-deps

EXPOSE 80 443
