ARG BASEIMAGE

# GPU: gpu_base:latest
# else: rdsc_base_img:latest

FROM ${BASEIMAGE}

# set rsession user here
ENV RSESSION_USER=${USER} 

# install essential packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    dirmngr \
    ghostscript \
    gpg-agent \
    libcurl4-openssl-dev \
    libssl-dev \
    libobjc-9-dev \
    libzmq3-dev \
    openjdk-8-jdk \
    unixodbc-dev
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# Add R apt-get repository for latest R
RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | \
    tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

RUN apt-get update && apt-get install -y --no-install-recommends \
    jags \
    lmodern \
    libapparmor1 \
    libfribidi-dev \
    libgit2-dev \
    libharfbuzz-dev \
    libnode-dev \
    psmisc \
    qpdf \
    r-base \
    r-base-dev \
    r-recommended \
    tcl8.6-dev \
    tk8.6-dev
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# make R site-library default package installation folder writeable
ENV R_LIBS_SITE=/usr/local/lib/R/site-library
RUN mkdir -p ${R_LIBS_SITE}
RUN chown -R ${RSESSION_USER}:${RSESSION_USER} ${R_LIBS_SITE}

# set cran repo
RUN echo "options(\"repos\" = \"https://cloud.r-project.org/\")" >> /etc/R/Rprofile.site

# Update where R expects to find various Java files

# update envar
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
RUN echo JAVA_HOME="${JAVA_HOME}" > /etc/environment
RUN R CMD javareconf

# add littler binaries to PATH
ENV PATH=/usr/local/lib/R/site-library/littler/bin:/usr/local/lib/R/site-library/littler/examples:${PATH}

USER ${RSESSION_USER}
RUN R -q -e "install.packages(c('littler', 'docopt'))"
RUN install2.r --skipinstalled --ncpus -1 \
    data.table \
    devtools \
    pak \
    reticulate \
    stringi

# install miniconda via reticulate and configure python
RUN echo "reticulate::py_config()" | r
RUN conda clean -ya

# switch back
USER root

# this happens already in the base image
# ENV PATH=/home/${RSESSION_USER}/miniconda/bin:${PATH}

# Add RETICULATE_PYTHON variable to Renviron
RUN echo "RETICULATE_PYTHON=/home/${RSESSION_USER}/miniconda/bin/python" >> /etc/R/Renviron
# Since R 4.0.0, we also need to add R_LIBS_SITE to /etc/R/Renviron
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
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

#######################
