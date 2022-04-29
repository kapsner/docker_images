FROM ubuntu:20.04

LABEL org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://github.com/joundso/r_datascience"

# set ENV-Vars
# set environment variable to supress user interaction
ENV DEBIAN_FRONTEND=noninteractive

## build ARGs
ARG NCPUS=${NCPUS:--1}
ARG DISPLAY
ENV DISPLAY=${DISPLAY}

# install essential packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    build-essential \
    # ca-certificates important for curl from https:
    ca-certificates \
    cmake \
    curl \
    dirmngr \
    ffmpeg \
    ghostscript \
    git \
    gpg-agent \
    htop \
    imagemagick \
    iputils-ping \
    libboost-dev \
    libboost-filesystem-dev \
    libboost-system-dev \
    libbz2-dev \
    libcairo2-dev \
    libclang-dev \
    libcurl4-openssl-dev \
    libffi-dev \
    libfribidi-dev \
    ## For `leaflet`:
    libgdal-dev \
    libglu1-mesa-dev \
    libgsl-dev \
    ## For rattle:
    libgtk2.0-dev \
    libharfbuzz-dev \
    libjpeg-dev \
    libjq-dev \
    liblzma-dev \
    libmagick++-dev \
    ## For package `RMariaDB`:
    # libmariadb-dev \
    libmpfr-dev \
    ## For `leaflet` deps:
    libmysqlclient-dev \
    libobjc-7-dev \
    libopenblas-dev \
    libopenmpi-dev \
    libpng-dev \
    libpq-dev \
    libsasl2-dev \
    libssl-dev \
    libudunits2-dev \
    libxml2-dev \
    libxslt1-dev \
    libxt-dev \
    libzmq3-dev \
    locales \
    locate \
    nano \
    net-tools \
    openjdk-17-jdk \
    python \
    python3-pip \
    software-properties-common \
    tar \
    unixodbc-dev \
    unzip \
    wget && \
    # clear caches
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
# define image user
ENV USER="user" 
# set rsession user here
ENV RSESSION_USER=${USER} 
ENV USER_UID=1000
ENV USER_GID=${USER_UID}

RUN groupadd --gid ${USER_GID} ${USER} && \
    useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USER}
########################

RUN locale-gen en_US.utf8 \
    && /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8

########################
# Install Miniconda and Python 3.8
ENV CONDA_AUTO_UPDATE_CONDA=false
ENV PATH=/home/${USER}/miniconda/bin:$PATH

USER ${USER}

ARG TARGETPLATFORM 
ENV TARGETPLATFORM=${TARGETPLATFORM}
ENV ARM_LABEL="linux/arm64"
ENV AMD_LABEL="linux/amd64"

# RUN echo "Current architecture: ${TARGETPLATFORM}"

# ## ARM:
# RUN if [ "$TARGETPLATFORM" = "$ARM_LABEL" ] ; \
#     then echo '!ARM!' && \
#     curl -sLo ~/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh && \
#     chmod +x ~/miniconda.sh ; \
#     fi

# ## AMD:
# RUN if [ "$TARGETPLATFORM" = "$AMD_LABEL" ] ; \
#     then echo '!AMD!' && \
#     curl -sLo ~/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
#     chmod +x ~/miniconda.sh ; \
#     fi

# # RUN curl -sLo ~/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
# #     chmod +x ~/miniconda.sh
# RUN ~/miniconda.sh -b -p ~/miniconda  && \
#     rm ~/miniconda.sh

# RUN conda install -y python==${PYVERSION} && \
#     conda clean -ya

# # install some (python) prerequisites
# RUN conda install -y \
#     numpy \
#     pip \
#     pyyaml \
#     requests \
#     ruamel_yaml \
#     setuptools \
#     wheel

RUN yes | pip install --no-cache-dir \
    auto-changelog \
    ## For auto-changelog (breaking as of 2022-03-01, see <https://github.com/aws/aws-sam-cli/issues/3661>):
    markupsafe==2.0.1 \
    testresources

ENV PATH="/home/${USER}/.local/bin:$PATH"

USER root


########################

# Add R apt repository for latest R
# https://cran.r-project.org/bin/linux/ubuntu/
# RUN gpg --keyserver hkp://keyserver.ubuntu.com:80 \
#     --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
# RUN mkdir -p /usr/local/share/keyrings
# RUN gpg --export E298A3A825C0D65DFD57CBB651716619E084DAB9 >  /etc/apt/trusted.gpg.d/r-software-archive-keyring.gpg
# RUN echo "deb http://cran.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" | \
#     tee -a /etc/apt/sources.list.d/r-software.list

RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

## ARM only:
RUN if [ "$TARGETPLATFORM" = "$ARM_LABEL" ] ; \
    then echo '!ARM!' && \
    apt-get update && apt-get install -y --no-install-recommends \
    gfortran \
    libreadline6-dev \
    libx11-dev \
    libxt-dev \
    libpng-dev \
    libjpeg-dev \
    libcairo2-dev \
    xvfb \
    libzstd-dev \
    texinfo \
    texlive \
    texlive-fonts-extra \
    screen \
    wget \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libpcre2-dev \
    libcurl4-openssl-dev && \
    # clear caches
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y; \
    fi

ARG CACHEBREAKER=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    lmodern \
    libapparmor1 \
    libgit2-dev \
    libnode-dev \
    pandoc \
    pandoc-citeproc \
    psmisc \
    qpdf \
    littler \
    r-cran-littler \
    r-base \
    r-base-dev \
    r-base-core \
    r-recommended \
    tcl8.6-dev \
    texinfo \
    tk8.6-dev \
    wajig \
    && ln -s /usr/lib/R/site-library/littler/examples/install.r /usr/local/bin/install.r \
    && ln -s /usr/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r \
    && ln -s /usr/lib/R/site-library/littler/examples/installBioc.r /usr/local/bin/installBioc.r \
    && ln -s /usr/lib/R/site-library/littler/examples/installDeps.r /usr/local/bin/installDeps.r \
    && ln -s /usr/lib/R/site-library/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
    && ln -s /usr/lib/R/site-library/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r \
    # clear caches
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /root/.cache/pip/* \
    && rm -rf /home/${USER}/.cache/pip/* \
    && apt-get clean && apt-get autoclean && apt-get autoremove -y

## For Rattle:
RUN wajig install -y libgtk2.0-dev && \
    apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*


# make R site-library default package installation folder writeable
RUN mkdir -p /usr/local/lib/R/site-library && \
    chown -R ${RSESSION_USER}:${RSESSION_USER} /usr/local/lib/R/site-library


# set cran repo
RUN echo "options('repos' = 'https://cloud.r-project.org/')" >> /etc/R/Rprofile.site

# Update where R expects to find various Java files
# update envar
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

RUN echo JAVA_HOME="${JAVA_HOME}" >> /etc/environment && \
    R CMD javareconf


USER ${RSESSION_USER}

RUN R -q -e "install.packages('docopt'); install.packages('stringi', configure.args='--disable-pkg-config')"
RUN install2.r --error --deps TRUE --skipinstalled -n $NCPUS \
    remotes \
    devtools \
    reticulate \
    data.table \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

# switch back
USER root

ENV PATH="/home/${RSESSION_USER}/miniconda/bin:${PATH}"

# Since R 4.0.0, we also need to add R_LIBS_SITE to /etc/R/Renviron
ENV R_LIBS_SITE=/usr/local/lib/R/site-library

RUN echo "R_LIBS_SITE=${R_LIBS_SITE}" >> /etc/R/Renviron && \
    echo "R_DATATABLE_NUM_PROCS_PERCENT=100" >> /etc/R/Renviron

########################
# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y
########################
