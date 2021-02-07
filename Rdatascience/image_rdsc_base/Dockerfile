ARG BASEIMAGE

# GPU: gpu_base:latest
# else: rdsc_base_img:latest

FROM ${BASEIMAGE}

# set rsession user here
ENV RSESSION_USER=${USER} 

# Add R apt repository for latest R
# https://cran.r-project.org/bin/linux/ubuntu/
RUN gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN gpg -a --export E298A3A825C0D65DFD57CBB651716619E084DAB9 | \
    sudo apt-key --keyring /etc/apt/trusted.gpg.d/r-software-apt-key.gpg add
RUN add-apt-repository "deb http://cran.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

RUN apt-get update && apt-get install -y --no-install-recommends \
    lmodern \
    libapparmor1 \
    libgit2-dev \
    libnode-dev \
    pandoc \
    pandoc-citeproc \
    psmisc \
    qpdf \
    r-base-dev \
    tcl8.6-dev \
    texinfo \
    tk8.6-dev
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# make R site-library default package installation folder writeable
RUN mkdir -p /usr/local/lib/R/site-library
RUN chown -R ${RSESSION_USER}:${RSESSION_USER} /usr/local/lib/R/site-library

# set cran repo
RUN echo "options(\"repos\" = \"https://cloud.r-project.org/\")" >> /etc/R/Rprofile.site

# Update where R expects to find various Java files
RUN R CMD javareconf

# first, make sure, that package "remotes" is installed, so we can make use
# of its function remotes::update_packages 
# https://rdrr.io/cran/remotes/man/update_packages.html
RUN R -q -e "install.packages(c(\"remotes\", \"devtools\", \"reticulate\", \"data.table\"))"

# switch user
USER ${RSESSION_USER}

# install miniconda via reticulate and configure python
RUN R -q -e "reticulate::py_config()"
RUN conda clean -ya

# switch back
USER root

ENV PATH="/home/${RSESSION_USER}/miniconda/envs/r-reticulate/bin:${PATH}"

# Add RETICULATE_PYTHON variable to Renviron
RUN echo "RETICULATE_PYTHON=/home/${RSESSION_USER}/miniconda/envs/r-reticulate/bin/python" >> /etc/R/Renviron
# Since R 4.0.0, we also need to add R_LIBS_SITE to /etc/R/Renviron
ENV R_LIBS_SITE=/usr/local/lib/R/site-library
RUN echo "R_LIBS_SITE=${R_LIBS_SITE}" >> /etc/R/Renviron

# environment variable for data.table
# https://github.com/Rdatatable/data.table/pull/3435/files
RUN echo "R_DATATABLE_NUM_PROCS_PERCENT=100" >> /etc/R/Renviron

########################
# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*
RUN rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/*
RUN conda clean -ya
RUN apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
