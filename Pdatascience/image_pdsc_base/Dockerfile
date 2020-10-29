FROM ubuntu:20.04

# set environment variable to supress user interaction
ENV DEBIAN_FRONTEND=noninteractive \
    JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# set ENV-Vars
ARG DISPLAY
ENV DISPLAY=${DISPLAY}

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils\ 
    build-essential \
    byobu \
    cmake \
    curl \
    #default-jdk \
    #default-jre \
    openjdk-8-jdk \
    dialog \
    dirmngr \
    ffmpeg \
    gcc-8 \
    gdebi-core \
    git \
    gfortran \
    gpg-agent \
    htop \
    iputils-ping \
    less \
    libcurl4-openssl-dev \
    libssh-dev \
    libssl-dev \
    locales \
    make \
    nano \
    net-tools \
    software-properties-common \
    ssh \
    sudo \
    tar \
    traceroute \
    unzip \
    vim \
    wget
RUN rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.utf8 \
    && /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8

RUN echo JAVA_HOME="${JAVA_HOME}" >> /etc/environment

# install required custom system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    imagemagick \
    # pocketsphinx
    libasound2-dev \ 
    libboost-dev \
    libboost-system-dev \
    libboost-filesystem-dev \
    libbz2-dev \
    libcairo2-dev \
    libclang-dev \
    libffi-dev \
    libglu1-mesa-dev \
    libgmp3-dev \
    libgsl-dev \
    # rJava dependencies
    liblzma-dev \ 
    libmagick++-dev \
    libmpfr-dev \
    libobjc-7-dev \
    libopenblas-dev \
    libopenmpi-dev \
    libpq-dev \
    libsasl2-dev \
    libxt-dev \
    # xml2 package
    libxml2-dev \
    # xslt package
    libxslt1-dev \
    libzmq3-dev \
    lmodern \
    # pocketsphinx
    libpulse-dev \
    locate \
    nano \
    net-tools \
    python3-dev \
    python3-gdcm \ 
    python3-pip \
    python3-yaml \ 
    python3-h5py\ 
    python3-venv \
    # pocketsphinx
    swig \
    traceroute \
    unixodbc-dev

RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# add user + password
# https://stackoverflow.com/questions/2150882/how-to-automatically-add-user-account-and-password-with-a-bash-script
# workaround, to get stuff properly installed in users home dir
# set rstudio user here
ENV PYTHON_USER="user" 
ENV USER_UID=1000
ENV USER_GID=${USER_UID}

RUN groupadd --gid ${USER_GID} ${PYTHON_USER} && \
    useradd --uid ${USER_UID} --gid ${USER_GID} -m ${PYTHON_USER}
RUN echo ${PYTHON_USER}:password | chpasswd 
RUN echo ${PYTHON_USER} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${PYTHON_USER} && \
    chmod 0440 /etc/sudoers.d/${PYTHON_USER}

# symlink pip3
RUN ln -s /bin/pip3 /bin/pip

# symlink python
RUN ln -s /bin/python3 /bin/python

RUN yes | pip install \
    --upgrade pip

# install python prerequisites
RUN yes | pip install \
    --upgrade numpy>=1.19.2 \
    setuptools \
    wheel

# install datascience packages
ADD ./config/requirements*.txt /home/${PYTHON_USER}/
RUN yes | pip install -r /home/${PYTHON_USER}/requirements_base.txt --use-feature=2020-resolver
RUN yes | pip install -r /home/${PYTHON_USER}/requirements.txt --use-feature=2020-resolver

ENV PATH=/home/${PYTHON_USER}/.local/bin:${PATH}
