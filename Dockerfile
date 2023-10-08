ARG ALPINE_TAG=3.18

FROM alpine:$ALPINE_TAG

RUN echo "--- create labhug user ---" && \
    adduser -s /bin/false -H -D -u 900 labhug && \
    echo "--- add packages ---" && \
    apk --no-cache add \
    su-exec \
    tini && \
    mkdir -p /app /config

ENTRYPOINT ["/sbin/tini" , "--"]