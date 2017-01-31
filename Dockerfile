FROM python:3.6.0-alpine

RUN apk -Uuv add groff less && \
    pip install \
        awscli==1.11.44 \
        haproxytool==0.5.3 && \
    apk --purge -v del py-pip && \
    rm /var/cache/apk/*

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
