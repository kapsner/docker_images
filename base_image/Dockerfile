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
    curl \
    sudo
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

########################
# define image user
ENV USER="user" 
ENV USER_UID=1000
ENV USER_GID=${USER_UID}

RUN groupadd --gid ${USER_GID} ${USER} && \
    useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USER}
RUN echo ${USER}:password | chpasswd 
RUN echo ${USER} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USER} && \
    chmod 0440 /etc/sudoers.d/${USER}

########################
# Install Miniconda and Python 3.8
ENV CONDA_AUTO_UPDATE_CONDA=false
ENV PATH=/home/${USER}/miniconda/bin:$PATH

# ARG PYVERSION
# ENV PYVERSION=${PYVERSION}
ENV PYVERSION=3.8.5

USER ${USER}

RUN curl -sLo ~/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    chmod +x ~/miniconda.sh
RUN ~/miniconda.sh -b -p ~/miniconda  && \
    rm ~/miniconda.sh
    
########################
# create and activate conda env
RUN conda create --name ml
SHELL ["conda", "run", "-n", "ml", "/bin/bash", "-c"]

RUN conda install -y python==${PYVERSION} && \
    conda clean -ya

########################
USER root
# install more essential packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    cifs-utils \
    dialog \
    dirmngr \
    gdebi-core \
    gpg-agent \
    htop \
    iputils-ping \
    locales \
    locate \
    nano \
    net-tools \
    software-properties-common \
    tar
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.utf8 \
    && /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8

########################
USER ${USER}

########################

# install some (python) prerequisites
RUN conda install -y \
    git \
    mkl \
    mkl-include \
    numpy \
    openjdk=8 \
    pip \
    pyyaml \
    requests \
    ruamel_yaml \
    setuptools \
    unzip \
    wget \
    wheel

RUN yes | pip install \
    testresources

########################
# install compiler tools
RUN conda install -y \
    -c conda-forge \
    conda-build \
    cmake \
    gcc_linux-64 \
    gxx_linux-64 \
    gfortran_linux-64 \
    imagemagick \
    libclang \
    libffi \
    libboost \
    make \
    openmpi \
    swig
# swig for GDCM
# libboost for lightgbm

########################
# clear caches
RUN conda clean -ya
USER root

RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*
RUN rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/*
RUN conda clean -ya
RUN apt-get clean && apt-get autoclean && apt-get autoremove -y

########################

# update envar
RUN echo JAVA_HOME="${JAVA_HOME}" >> /etc/environment
