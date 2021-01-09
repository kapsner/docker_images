FROM ubuntu:20.04

# set environment variable to supress user interaction
ENV DEBIAN_FRONTEND=noninteractive \
    JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

ENV PYVERSION=3.8

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
    libgdcm-tools \
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
    python${PYVERSION} \
    python${PYVERSION}-dev \
    python3-pip \
    python3-h5py\ 
    # pocketsphinx
    swig \
    unixodbc-dev

RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# symlink pip3
RUN ln -s /usr/bin/pip3 /usr/bin/pip

# symlink python
RUN ln -s /usr/bin/python${PYVERSION} /usr/bin/python

# install python3-gdcm
RUN git clone https://github.com/malaterre/GDCM
RUN cd GDCM && \
    mkdir build
RUN ls -al /usr/local/lib/python${PYVERSION}
RUN cd GDCM/build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS=-fPIC -DCMAKE_CXX_FLAGS=-fPIC \
    -DGDCM_BUILD_SHARED_LIBS:BOOL=ON \
    -DGDCM_WRAP_PYTHON=ON PYTHON_EXECUTABLE=/usr/local/bin/python${PYVERSION} \
    PYTHON_INCLUDE_DIR=/usr/local/lib/python${PYVERSION}/dist-packages/ \
    GDCM_BUILD_SHARED_LIBS=ON GDCM_USE_VTK=ON /GDCM/ && \
    cmake --build . --target install

RUN cp /usr/local/lib/gdcm.py /usr/local/lib/python${PYVERSION}/dist-packages/.
RUN cp /usr/local/lib/gdcmswig.py /usr/local/lib/python${PYVERSION}/dist-packages/.
RUN cp /usr/local/lib/_gdcmswig.so /usr/local/lib/python${PYVERSION}/dist-packages/.
RUN cp /usr/local/lib/libgdcm* /usr/local/lib/python${PYVERSION}/dist-packages/.
RUN ldconfig

RUN rm -rf GDCM

########################
# define python user
ENV PYTHON_USER="user" 
ENV USER_UID=1000
ENV USER_GID=${USER_UID}

RUN groupadd --gid ${USER_GID} ${PYTHON_USER} && \
    useradd --uid ${USER_UID} --gid ${USER_GID} -m ${PYTHON_USER}
RUN echo ${PYTHON_USER}:password | chpasswd 
RUN echo ${PYTHON_USER} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${PYTHON_USER} && \
    chmod 0440 /etc/sudoers.d/${PYTHON_USER}

# update pip
RUN yes | pip install --upgrade pip

# install scikit-build from source (for SimpleITK)
RUN yes | pip install scikit-build

# install python prerequisites
RUN yes | pip install \
    --upgrade numpy>=1.19.2 \
    setuptools \
    wheel

# install datascience packages
ADD ./config/requirements*.txt /home/${PYTHON_USER}/
RUN yes | pip install -r /home/${PYTHON_USER}/requirements_base.txt
#RUN yes | pip install -r /home/${PYTHON_USER}/requirements_nlp.txt
RUN yes | pip install -r /home/${PYTHON_USER}/requirements.txt

ENV PATH=/home/${PYTHON_USER}/.local/bin:${PATH}
