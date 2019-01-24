FROM openjdk:11

LABEL maintainer="Anton Kozik pazitron@gmail.com"

RUN apt-get update -qq && \
    apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY import-rds-certificates.sh /usr/src

RUN /usr/src/import-rds-certificates.sh

ENTRYPOINT ["/bin/bash", "-c"]
