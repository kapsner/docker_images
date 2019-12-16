FROM ubuntu:18.04

# set environment variable to supress user interaction
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \ 
    dialog \
    dirmngr \
    gdebi-core \
    gpg-agent \
    htop \
    less \
    libcurl4-openssl-dev \
    libssh-dev \
    libssl-dev \
    locales \
    nano \
    software-properties-common \
    ssh \
    sudo \
    tar \
    unzip \
    vim \
    wget

RUN apt-get clean && apt-get autoclean

RUN locale-gen en_US.utf8 \
    && /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8