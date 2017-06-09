FROM alpine:3.5

ENV HUGO_VERSION 0.21

RUN set -x \
  && apk add --no-cache --update --update-cache \
    bash \
    curl \
    openssh-client \
    rsync \
    groff \
    less \
    python \
    py-pip \
    git \
    openssh-client \
    tar \
    gzip \
    ca-certificates

RUN curl -L https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz | tar xvz -C /tmp && \
    mv /tmp/hugo /usr/local/bin/hugo && \
    rm -f /tmp/*.md

RUN mkdir -p /aws && \
    pip install awscli

RUN apk --purge -v del py-pip && \
    rm /var/cache/apk/*

EXPOSE 1313
