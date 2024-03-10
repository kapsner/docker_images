FROM ubuntu:22.04

# set environment variable to supress user interaction
ENV DEBIAN_FRONTEND=noninteractive

# install essential packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \ 
    # ca-certificates important for curl from https
    ca-certificates \
    # curl required to download miniconda
    curl \
    dirmngr \
    lsb-release \
    software-properties-common \
    wget
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

########################
# define image user
ENV USER="user"
RUN useradd -ms /bin/bash ${USER}

# set rsession user here
ENV RSESSION_USER=${USER} 

# Add R apt-get repository for latest R
# RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | \
#     tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# # add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
# RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    libcurl4-openssl-dev \
    libssl-dev \
    qpdf \
    r-base \
    r-base-dev \
    r-recommended
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*


# make R site-library default package installation folder writeable
ENV R_LIBS_SITE=/usr/local/lib/R/site-library
RUN mkdir -p ${R_LIBS_SITE}
RUN chown -R ${RSESSION_USER}:${RSESSION_USER} ${R_LIBS_SITE}

# set cran repo
RUN echo "options(\"repos\" = \"https://cloud.r-project.org/\")" >> /etc/R/Rprofile.site

USER ${RSESSION_USER}
RUN R -q -e "install.packages(c('littler', 'docopt'))"

# add littler binaries to PATH
ENV PATH=/usr/local/lib/R/site-library/littler/bin:/usr/local/lib/R/site-library/littler/examples:${PATH}

RUN install2.r --error --ncpus -1 \
    data.table \
    qpdf \
    quantmod \
    slackr \
    here \
    qpdf

USER root
# Since R 4.0.0, we also need to add R_LIBS_SITE to /etc/R/Renviron
RUN echo "R_LIBS_SITE=${R_LIBS_SITE}" >> /etc/R/Renviron

# environment variable for data.table
# https://github.com/Rdatatable/data.table/pull/3435/files
RUN echo "R_DATATABLE_NUM_PROCS_PERCENT=100" >> /etc/R/Renviron

########################
# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

USER ${RSESSION_USER}
WORKDIR /home/${RSESSION_USER}/
