FROM ubuntu:20.10

# set ENV-Vars
# set environment variable to supress user interaction
ENV DEBIAN_FRONTEND=noninteractive

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
    libglu1-mesa-dev \
    libgsl-dev \
    libjpeg-dev \
    liblzma-dev \
    libmagick++-dev \
    libmpfr-dev \
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
    openjdk-14-jdk \
    software-properties-common \
    tar \
    unixodbc-dev \
    unzip \
    wget
    

########################
# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
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
    r-base \
    r-base-dev \
    r-recommended \
    tcl8.6-dev \
    texinfo \
    tk8.6-dev \
    wajig
## For Rattle:
RUN wajig install -y libgtk2.0-dev
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*


# make R site-library default package installation folder writeable
RUN mkdir -p /usr/local/lib/R/site-library
RUN chown -R ${RSESSION_USER}:${RSESSION_USER} /usr/local/lib/R/site-library

RUN ln -s /usr/lib/R/site-library/littler/examples/install.r /usr/local/bin/install.r && \
    ln -s /usr/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r && \
    ln -s /usr/lib/R/site-library/littler/examples/installGithub.r /usr/local/bin/installGithub.r && \
    ln -s /usr/lib/R/site-library/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r

# set cran repo
RUN echo "options(\"repos\" = \"https://cloud.r-project.org/\")" >> /etc/R/Rprofile.site

# Update where R expects to find various Java files

# update envar
ENV JAVA_HOME=/usr/lib/jvm/java-14-openjdk-amd64
RUN echo JAVA_HOME="${JAVA_HOME}" >> /etc/environment
RUN R CMD javareconf

# first, make sure, that package "remotes" is installed, so we can make use
USER ${RSESSION_USER}
# of its function remotes::update_packages 
# https://rdrr.io/cran/remotes/man/update_packages.html
RUN R -q -e "install.packages(\"docopt\")"
RUN R -q -e "install.packages(\"stringi\", configure.args=\"--disable-pkg-config\")"
RUN install2.r --error \
    remotes \
    devtools \
    reticulate \
    data.table

# switch back
USER root

ENV PATH="/home/${RSESSION_USER}/miniconda/bin:${PATH}"

# Since R 4.0.0, we also need to add R_LIBS_SITE to /etc/R/Renviron
ENV R_LIBS_SITE=/usr/local/lib/R/site-library
RUN echo "R_LIBS_SITE=${R_LIBS_SITE}" >> /etc/R/Renviron

# environment variable for data.table
# https://github.com/Rdatatable/data.table/pull/3435/files
RUN echo "R_DATATABLE_NUM_PROCS_PERCENT=100" >> /etc/R/Renviron

########################
# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
