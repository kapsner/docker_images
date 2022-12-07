ARG BASEIMAGE

# GPU: nvidia/cuda:11.0-cudnn8-devel-ubuntu18.04
# else: ubuntu:20.10

FROM ${BASEIMAGE}

# set ENV-Vars
# set environment variable to supress user interaction
ENV DEBIAN_FRONTEND=noninteractive

ARG DISPLAY
ENV DISPLAY=${DISPLAY}

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
RUN useradd -ms /bin/bash ${USER}

########################
# Install Miniconda and Python 3.10
ENV CONDA_AUTO_UPDATE_CONDA=false
ENV PATH=/home/${USER}/miniconda/bin:$PATH

# ARG PYVERSION
# ENV PYVERSION=${PYVERSION}
ENV PYVERSION=3.10

USER ${USER}

RUN curl -sLo ~/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    chmod +x ~/miniconda.sh
RUN ~/miniconda.sh -b -p ~/miniconda  && \
    rm ~/miniconda.sh

# update conda
RUN conda update -n base -c defaults conda

RUN conda install -y python==${PYVERSION} && \
    conda clean -ya

# trying to make pip faster
# https://stackoverflow.com/questions/26669244/how-to-install-compile-pip-requirements-in-parallel-make-j-equivalent
ENV MAKEFLAGS="-j$(nproc)"

# install some (python) prerequisites
RUN yes | pip install \
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
    net-tools \
    software-properties-common \
    tar \
    unzip \
    wget
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
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
