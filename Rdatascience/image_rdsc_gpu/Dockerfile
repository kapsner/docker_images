FROM gpu_base:latest

# set environment variable to supress user interaction
ENV DEBIAN_FRONTEND=noninteractive \
    JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

RUN echo JAVA_HOME="${JAVA_HOME}" >> /etc/environment

# Add R apt repository for latest R
# https://cran.r-project.org/bin/linux/ubuntu/
RUN gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN gpg -a --export E298A3A825C0D65DFD57CBB651716619E084DAB9 | sudo apt-key add -
RUN echo "deb http://cran.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" >> /etc/apt/sources.list.d/r.list

# install required custom system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    pandoc \
    pandoc-citeproc \
    # rstudio dependency
    libapparmor1 \
    psmisc \
    qpdf \
    r-base-dev \
    # dependencies for aplpack
    tcl8.6-dev \
    texinfo \
    tk8.6-dev
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
    cmake \
    setuptools \
    wheel

USER root

# environment variable for data.table
# https://github.com/Rdatatable/data.table/pull/3435/files
RUN echo "R_DATATABLE_NUM_PROCS_PERCENT=100" >> /etc/R/Renviron


# compile lightgbm GPU R package
# https://lightgbm.readthedocs.io/en/latest/GPU-Tutorial.html
RUN git clone --recursive https://github.com/microsoft/LightGBM
RUN cd LightGBM && \
    sed -i -e 's/use_gpu <- FALSE/use_gpu <- TRUE/g' R-package/src/install.libs.R && \
    Rscript build_r.R

# install xgboost GPU R package
# xgboost branch
RUN git clone --recursive https://github.com/dmlc/xgboost
RUN mkdir -p xgboost/build && \
    cd xgboost/build && \
    cmake .. -DUSE_CUDA=ON -DR_LIB=ON -DUSE_NCCL=ON && \
    make install -j$(nproc)

# clean up
RUN rm -rf xgboost
RUN rm -rf LightGBM

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

# finally, install required R packages

ARG packages="data.table"
RUN for package in $packages; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG packages="future \
    future.apply"
RUN for package in $packages; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

# ARG packages="gpuR" 
# RUN for package in $packages; do \
#     R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
#     done && \
#     rm -rf /tmp/*

ARG packages="h2o"
RUN for package in $packages; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG packages="mlr3misc \ 
    mlr3verse \ 
    mlbench \ 
    MLmetrics"
RUN for package in $packages; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG packages="RcppRoll"
RUN for package in $packages; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG packages="tidyr"
RUN for package in $packages; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG packages="qpdf"
RUN for package in $packages; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG packages="vroom"
RUN for package in $packages; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

# install my own stuff
RUN R -q -e "devtools::install_github(repo = 'kapsner/lightgbm.py', ref = 'master')"
RUN R -q -e "devtools::install_github(repo = 'kapsner/mlr3learners.lgbpy', ref = 'master')"
RUN R -q -e "devtools::install_github(repo = 'mlr3learners/mlr3learners.lightgbm', ref = 'development')"

# install python stuff
RUN yes | pip install \
    scikit-learn

# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*
RUN rm -rf /home/${RSESSION_USER}/.cache/pip/*
RUN apt-get clean && apt-get autoclean && apt-get autoremove

# get RStudio-Server (Preview Version): https://www.rstudio.com/products/rstudio/download/preview/
ENV RSTUDIO_VERSION=1.4.1013 \
    RSTUIO_URL=https://s3.amazonaws.com/rstudio-ide-build/server/bionic/amd64/
# stable
# ENV RSTUDIO_VERSION=1.2.5033 \
#     RSTUIO_URL=https://download2.rstudio.org/server/bionic/amd64/
ENV RSTUDIO_FILE="rstudio-server-${RSTUDIO_VERSION}-amd64.deb"
ENV RSTUDIO_LINK=${RSTUIO_URL}${RSTUDIO_FILE}
RUN wget ${RSTUDIO_LINK}
RUN apt-get update && apt-get install -y --no-install-recommends \
    libapparmor1
RUN dpkg -i ${RSTUDIO_FILE}
RUN rm -f ${RSTUDIO_FILE}

# overwrite headless .Rprofile
RUN echo "options(shiny.port = 3838)" > /home/${RSESSION_USER}/.Rprofile && \
    echo "options(shiny.host = '0.0.0.0')" >> /home/${RSESSION_USER}/.Rprofile && \
    echo "options(shiny.launch.browser = FALSE)" >> /home/${RSESSION_USER}/.Rprofile && \
    chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.Rprofile

# add custom RStudio theme ("Dracula")
ADD config/rstudio-prefs.json /home/${RSESSION_USER}/.config/rstudio/rstudio-prefs.json
RUN chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.config/ && \
    chmod 644 /home/${RSESSION_USER}/.config/rstudio/rstudio-prefs.json

# add PATH to a bash_profile script (workaround so that path is available in rstudio's terminal)
# https://support.rstudio.com/hc/en-us/articles/115010737148-Using-the-RStudio-Terminal#env
# https://docs.rstudio.com/ide/server-pro/1.2.1293-1/r-sessions.html
RUN echo "export PATH=${PATH}" >> /home/${RSESSION_USER}/.bash_profile && chmod +x /home/${RSESSION_USER}/.bash_profile

# set PATH for all users
RUN echo "PATH=${PATH}" >> /etc/R/Renviron
RUN echo "PATH=${PATH}" >> /etc/environment

# entrypoint
ENTRYPOINT rstudio-server start && tail -f /dev/null

# docker GPU not working with docker-compose
# docker run --rm --gpus all -p 8787:8787 -v ~/R:/home/user/volume rdsc_gpu
# debug: docker run --rm --gpus all -p 8787:8787 -e PASSWORD=password rdsc_gpu
