FROM alpine:3.7

ARG NATSS_VERSION=v0.9.2
ENV NATSS_VERSION=${NATSS_VERSION}

EXPOSE 4222 6222 8222

RUN apk update && \
    apk add --no-cache ca-certificates openssl

RUN wget -q https://github.com/nats-io/nats-streaming-server/releases/download/${NATSS_VERSION}/nats-streaming-server-${NATSS_VERSION}-linux-amd64.zip -O /tmp/nats-streaming-server.zip && \
    unzip /tmp/nats-streaming-server.zip -d / && \
    mv /nats-streaming-server-${NATSS_VERSION}-linux-amd64 /opt/ && \
    rm /tmp/nats-streaming-server.zip

CMD "/opt/nats-streaming-server"

