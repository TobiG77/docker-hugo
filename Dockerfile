FROM alpine:latest

ENV HUGO_VERSION 0.19

RUN apk add --no-cache --update curl && \
    curl -L https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz | tar xvz -C /tmp && \
    mv /tmp/hugo_${HUGO_VERSION}_linux_amd64/hugo_${HUGO_VERSION}_linux_amd64 /usr/local/bin/hugo && \
    rm -rf /tmp/hugo_${HUGO_VERSION}_Linux_amd64/

EXPOSE 1313

ENTRYPOINT ["hugo"]