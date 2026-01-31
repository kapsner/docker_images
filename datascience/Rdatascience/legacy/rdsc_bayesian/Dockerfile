FROM rocker/verse:latest

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y --no-install-recommends \
    jags

ARG pkg="coda \
    rjags \
    R2jags"
RUN for package in $pkg; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

########################
# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y
