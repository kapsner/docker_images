ARG BASEIMAGE

# GPU: gpu_base:latest
# else: rdsc_base_img:latest

FROM ${BASEIMAGE}

SHELL ["/bin/bash", "-c"]

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
    default-jdk \
    default-jdk-headless \
    unixodbc-dev \
    poppler-utils \
    libpoppler-cpp-dev
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# Add R apt-get repository for latest R
RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | \
    tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
RUN add-apt-repository -s "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

RUN apt-get update && apt-get install -y --no-install-recommends \
    jags \
    lmodern \
    libapparmor1 \
    libfribidi-dev \
    libgit2-dev \
    libglpk-dev \
    libharfbuzz-dev \
    psmisc \
    qpdf \
    r-base \
    r-base-dev \
    r-recommended \
    tidy \
    tcl8.6-dev \
    tk8.6-dev
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# make R site-library default package installation folder writeable
ENV R_LIBS_SITE=/home/${RSESSION_USER}/R/x86_64-pc-linux-gnu-library/4.5
ENV R_LIBS_USER=${R_LIBS_SITE}
RUN mkdir -p ${R_LIBS_SITE}
RUN chown -R ${RSESSION_USER}:${RSESSION_USER} ${R_LIBS_SITE}

# Add RETICULATE_PYTHON variable to Renviron
RUN echo "RETICULATE_PYTHON=/home/${RSESSION_USER}/miniconda/bin/python" >> /etc/R/Renviron && \
    # Since R 4.0.0, we also need to add R_LIBS_SITE to /etc/R/Renviron
    echo "R_LIBS_SITE=${R_LIBS_SITE}" >> /etc/R/Renviron && \
    # environment variable for data.table
    # https://github.com/Rdatatable/data.table/pull/3435/files
    echo "R_DATATABLE_NUM_PROCS_PERCENT=100" >> /etc/R/Renviron && \
    # set cran repo
    echo "options(\"repos\" = \"https://cloud.r-project.org/\")" >> /etc/R/Rprofile.site

# Update where R expects to find various Java files

# update envar
ENV JAVA_HOME=/usr/lib/jvm/default-java
RUN echo JAVA_HOME="${JAVA_HOME}" > /etc/environment && \
    R CMD javareconf

########################
# clear caches before switching user
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    rm -rf /root/.cache/uv/* && \
    rm -rf /home/${USER}/.cache/uv/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################

USER ${RSESSION_USER}
RUN R -q -e "install.packages(c('pak'))"
ARG basepkg="data.table \ 
    devtools \ 
    reticulate \
    stringi"
RUN export pkg="\"$(echo ${basepkg} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

########################

# install miniconda via reticulate and configure python
RUN R -q -e "reticulate::py_config()"
RUN conda clean -ya

# switch back
USER root

########################
# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    rm -rf /root/.cache/uv/* && \
    rm -rf /home/${USER}/.cache/uv/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

#######################
