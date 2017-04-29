FROM alpine:3.5

ENV HUGO_VERSION 0.20.6

RUN set -x \
  && apk add --no-cache --update \
    bash \
    curl \
    openssh-client \
    rsync \
  && curl -L https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz | tar xvz -C /tmp \
  && mv /tmp/hugo /usr/local/bin/hugo \
  && rm -f /tmp/*.md

EXPOSE 1313
