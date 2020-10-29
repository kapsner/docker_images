FROM nvidia/cuda:11.0-cudnn8-devel-ubuntu18.04

# set rsession user here
ENV RSESSION_USER="user" 

# set environment variable to supress user interaction
ENV DEBIAN_FRONTEND=noninteractive \
    JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

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

# Add R apt repository for latest R
# https://cran.r-project.org/bin/linux/ubuntu/
RUN gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN gpg -a --export E298A3A825C0D65DFD57CBB651716619E084DAB9 | sudo apt-key add -
RUN add-apt-repository "deb http://cran.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

# install required custom system dependencies
RUN apt-get install -y --no-install-recommends \
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
    libopenmpi-dev \
    libpq-dev \
    libsasl2-dev \
    # V8 dependencies
    libnode-dev \
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
    pandoc \
    pandoc-citeproc \
    # rstudio dependency
    psmisc \
    python3-dev \
    python3-pip \
    python3-venv \
    qpdf \
    r-base-dev \
    # pocketsphinx
    swig \
    # dependencies for aplpack
    tcl8.6-dev \
    texinfo \
    tk8.6-dev \
    traceroute \
    unixodbc-dev

RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# add user + password
# https://stackoverflow.com/questions/2150882/how-to-automatically-add-user-account-and-password-with-a-bash-script
# workaround, to get stuff properly installed in users home dir
# set rstudio user here
ENV RSESSION_USER="user" 
ENV USER_UID=1000
ENV USER_GID=${USER_UID}

RUN groupadd --gid ${USER_GID} ${RSESSION_USER} && \
    useradd --uid ${USER_UID} --gid ${USER_GID} -m ${RSESSION_USER}
RUN echo ${RSESSION_USER}:password | chpasswd 
RUN echo ${RSESSION_USER} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${RSESSION_USER} && \
    chmod 0440 /etc/sudoers.d/${RSESSION_USER}

# make R site-library default package installation folder writeable
RUN mkdir -p /usr/local/lib/R/site-library
RUN chown -R ${RSESSION_USER}:${RSESSION_USER} /usr/local/lib/R/site-library

# set cran repo
RUN echo "options('repos' = 'https://cloud.r-project.org/')" >> /etc/R/Rprofile.site

# Update where R expects to find various Java files
RUN R CMD javareconf

# first, make sure, that package "remotes" is installed, so we can make use
# of its function remotes::update_packages 
# https://rdrr.io/cran/remotes/man/update_packages.html
RUN R -q -e "install.packages(c('remotes', 'devtools', 'reticulate', 'data.table'))"

# switch user
USER ${RSESSION_USER}

# install miniconda via reticulate and configure python
RUN R -q -e "reticulate::install_miniconda(); reticulate::py_config()"

# switch back
USER root

# we can now add add the virtualenv python to PATH (on first place)
# add newly installed dependencies to PATH
ENV PATH="/home/${RSESSION_USER}/.local/share/r-miniconda/envs/r-reticulate/bin:${PATH}"

# Add RETICULATE_PYTHON variable to Renviron
RUN echo "RETICULATE_PYTHON=/home/${RSESSION_USER}/.local/share/r-miniconda/envs/r-reticulate/bin/python" >> /etc/R/Renviron
# Since R 4.0.0, we also need to add R_LIBS_SITE to /etc/R/Renviron
ENV R_LIBS_SITE=/usr/local/lib/R/site-library
RUN echo "R_LIBS_SITE=${R_LIBS_SITE}" >> /etc/R/Renviron

# switch user (let everything in .virtualenv/r-reticulate be installed by the user)
# we can use pip here, since we added the virtualenv to the beginning of our PATH variable
USER ${RSESSION_USER}

# install python prerequisites
RUN yes | pip install \
    setuptools \
    wheel

USER root

# environment variable for data.table
# https://github.com/Rdatatable/data.table/pull/3435/files
RUN echo "R_DATATABLE_NUM_PROCS_PERCENT=100" >> /etc/R/Renviron

########################
########################
#### add GPU accelerated
#### ML capabilities
########################
########################

# install/update latest cmake (> 3.12 required for compiling of latest xgboost)
RUN yes | pip install \
    --upgrade cmake

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

# update environment variables 
ENV CUDA_HOME=/usr/local/cuda
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CUDA_HOME}/lib64
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
ENV PATH=${CUDA_HOME}/bin:${PATH}
ENV OPENCL_LIBRARIES=/usr/local/cuda/lib64
ENV OPENCL_INCLUDE_DIR=/usr/local/cuda/include

#########################
# install prerequisites for lightgbm
RUN apt-get update && apt-get install -y --no-install-recommends \
    ocl-icd-opencl-dev
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/OpenCL/vendors && \
    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd

# compile lightgbm GPU R package
# https://lightgbm.readthedocs.io/en/latest/GPU-Tutorial.html
RUN git clone --recursive https://github.com/microsoft/LightGBM
RUN cd LightGBM && \
    sed -i -e 's/use_gpu <- FALSE/use_gpu <- TRUE/g' R-package/src/install.libs.R && \
    Rscript build_r.R

# install xgboost GPU R package
# installation will work only with g++/gcc version <= 8
RUN apt-get update && apt-get install -y --no-install-recommends \
    g++-8 \
    gcc-8
RUN ln -sf /usr/bin/gcc-8 /usr/bin/gcc && \
    ln -sf /usr/bin/g++-8 /usr/bin/g++
# xgboost branch
RUN git clone --recursive https://github.com/dmlc/xgboost
RUN mkdir -p xgboost/build && \
    cd xgboost/build && \
    cmake .. -DUSE_CUDA=ON -DR_LIB=ON -DUSE_NCCL=ON && \
    make install -j$(nproc)

# clean up
RUN rm -rf xgboost
RUN rm -rf LightGBM

### install python versions
# lightgbm
RUN git clone --recursive https://github.com/microsoft/LightGBM
RUN mkdir -p LightGBM/build && \
    cd LightGBM/build && \
    cmake -DUSE_GPU=1 .. &&\
    make -j$(nproc)
RUN cd LightGBM/python-package && \
    python setup.py install --precompile

# xgboost
# Install xgboost GPU python package
RUN git clone --recursive https://github.com/dmlc/xgboost
RUN mkdir -p xgboost/build && \
    cd xgboost/build && \
    cmake .. -DUSE_CUDA=ON -DUSE_NCCL=ON && \
    make install -j$(nproc)
RUN cd xgboost/python-package && \
    python setup.py install

### Finish GPU installing stuff
# clean up
RUN rm -rf xgboost
RUN rm -rf LightGBM

# install keras/tensorflow
RUN R -q -e "install.packages('keras')"

# switch user
USER ${RSESSION_USER}

# install keras (when pip virtualenv is already installed)
RUN R -q -e "keras::install_keras(tensorflow = 'gpu')"

# switch back
USER root

# evtl add h2o4gpu, gpuR
