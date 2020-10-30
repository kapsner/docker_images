FROM nvidia/cuda:11.0-cudnn8-devel-ubuntu18.04

ENV DEBIAN_FRONTEND=noninteractive

ENV PYVERSION=3.7

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
    gfortran \
    git \
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
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install required custom system dependencies
RUN add-apt-repository ppa:deadsnakes/ppa
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
    libboost-dev \
    libboost-system-dev \
    libboost-filesystem-dev \
    libbz2-dev \
    # V8 dependencies
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
    # pocketsphinx
    swig \
    traceroute \
    unixodbc-dev \
    python${PYVERSION} \
    python${PYVERSION}-dev \
    python3-pip \
    python${PYVERSION}-venv
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.utf8 \
    && /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8

#########################
ARG CUDA=11.0
ARG CUDNN=8.0.4.30-1
ARG CUDNN_MAJOR_VERSION=8
ARG LIB_DIR_PREFIX=x86_64
ARG LIBNVINFER=7.1.3-1
ARG LIBNVINFER_MAJOR_VERSION=7
# https://www.tensorflow.org/install/gpu
# Install TensorRT. Requires that libcudnn7 is installed above.
RUN apt-get update && apt-get install -y --no-install-recommends \
    libnvinfer${LIBNVINFER_MAJOR_VERSION}=${LIBNVINFER}+cuda${CUDA} \
    libnvinfer-dev=${LIBNVINFER}+cuda${CUDA} \
    libnvinfer-plugin-dev=${LIBNVINFER}+cuda${CUDA} \
    libnvinfer-plugin${LIBNVINFER_MAJOR_VERSION}=${LIBNVINFER}+cuda${CUDA} && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

########################
# update environment variables 
ENV CUDA_HOME=/usr/local/cuda
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CUDA_HOME}/lib64
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
ENV PATH=${CUDA_HOME}/bin:${PATH}
ENV OPENCL_LIBRARIES=/usr/local/cuda/lib64
ENV OPENCL_INCLUDE_DIR=/usr/local/cuda/include
########################

# symlink pip3
RUN ln -s /usr/bin/pip3 /usr/bin/pip

# symlink python
RUN ln -s /usr/bin/python${PYVERSION} /usr/bin/python

# update-alternatives
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python${PYVERSION} 2

RUN update-alternatives --config python3

RUN yes | pip install \
    --upgrade pip

# install python prerequisites
RUN yes | pip install \
    --upgrade numpy>=1.19.2
RUN yes | pip install \
    --upgrade setuptools \
    wheel

# install/update latest cmake (> 3.12 required for compiling of latest xgboost)
RUN yes | pip install \
    --upgrade cmake

########################
# xgboost installation will work only with g++/gcc version <= 8
RUN apt-get update && apt-get install -y --no-install-recommends \
    g++-8 \
    gcc-8 \
    gfortran-8
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN ln -sf /usr/bin/gcc-8 /usr/bin/gcc && \
    ln -sf /usr/bin/g++-8 /usr/bin/g++ && \
    ln -sf /usr/bin/gfortran-8 /usr/bin/gfortran

#########################
# install prerequisites for lightgbm
RUN apt-get update && apt-get install -y --no-install-recommends \
    ocl-icd-opencl-dev
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/OpenCL/vendors && \
    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd
