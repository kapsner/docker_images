FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    ssmtp \
    mailutils \
    mpack

# define image user
ENV USER="pi"
RUN useradd -ms /bin/bash ${USER}

USER ${USER}
