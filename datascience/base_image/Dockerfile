ARG BASEIMAGE
# GPU: nvidia/cuda:11.0-cudnn8-devel-ubuntu18.04
# else: ubuntu:20.10

FROM ${BASEIMAGE}

ARG BASEIMAGE
SHELL ["/bin/bash", "-c"]

# set ENV-Vars
# set environment variable to supress user interaction
ENV DEBIAN_FRONTEND=noninteractive

ARG DISPLAY
ENV DISPLAY=${DISPLAY}

# Delete custom user in ubuntu from 24.04 on https://askubuntu.com/a/1515958
RUN if [ "$BASEIMAGE" = "ubuntu:24.04" ]; then \
    echo "Deleting user ubuntu" && \
    touch /var/mail/ubuntu && chown ubuntu /var/mail/ubuntu && userdel -r ubuntu; \
    fi
    
# install essential packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \ 
    # ca-certificates important for curl from https
    ca-certificates \
    # curl required to download miniconda
    curl
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

########################
# define image user
ENV USER="user"
RUN useradd -m -s /usr/bin/bash -u 1000 ${USER}

########################
# Install Miniconda and Python 3.10
ENV CONDA_AUTO_UPDATE_CONDA=false
ENV PATH=/home/${USER}/miniconda/bin:$PATH

# ARG PYVERSION
# ENV PYVERSION=${PYVERSION}
ENV PYVERSION=3.13

USER ${USER}

RUN curl -sLo ~/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    chmod +x ~/miniconda.sh
RUN ~/miniconda.sh -b -p ~/miniconda  && \
    rm ~/miniconda.sh

# https://www.anaconda.com/docs/getting-started/tos-plugin#docker-in-ci%2Fcd-environments
ENV CONDA_PLUGINS_AUTO_ACCEPT_TOS=true

# update conda
RUN conda config --set channel_priority flexible && \
    conda update -n base -c defaults conda

RUN conda install -y python==${PYVERSION} && \
    conda clean -ya

# trying to make pip faster
# https://stackoverflow.com/questions/26669244/how-to-install-compile-pip-requirements-in-parallel-make-j-equivalent
ENV MAKEFLAGS="-j$(nproc)"

# install some (python) prerequisites
RUN source activate base && yes | pip install uv
RUN source activate base && \
    uv pip install --system \
    auto-changelog \
    numpy \
    pyyaml \
    requests \
    ruamel_yaml \
    setuptools \
    six \
    testresources \
    tqdm \
    virtualenv \
    wheel

########################
USER root
# install more essential packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    dbus-user-session \
    ffmpeg \
    git \
    htop \
    iputils-ping \
    jq \
    libjpeg-dev \
    libpng-dev \
    imagemagick \
    libboost-dev \
    libboost-system-dev \
    libboost-filesystem-dev \
    libbz2-dev \
    libcairo2-dev \
    libclang-dev \
    libffi-dev \
    libglu1-mesa-dev \
    libgsl-dev \
    liblzma-dev \ 
    libmagick++-dev \
    libmpfr-dev \
    libopenblas-dev \
    libopenmpi-dev \
    libpq-dev \
    libsasl2-dev \
    libxt-dev \
    libxml2-dev \
    libxslt1-dev \
    locales \
    locate \
    nano \
    ncdu \
    net-tools \
    rsync \
    software-properties-common \
    tar \
    unzip \
    wget \
    zip
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.utf8 \
    && /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8

########################
# clear caches
RUN conda clean -ya

RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    rm -rf /root/.cache/uv/* && \
    rm -rf /home/${USER}/.cache/uv/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
