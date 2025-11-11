ARG BASEIMAGE

# GPU: rdsc_gpu:latest
# headless: rdsc_headless:latest
# bio: rdsc_bio:latest
# rad: rdsc_rad:latest

FROM ${BASEIMAGE}

USER root

# install gdebi here, required to install rstudio
# (gdebi will fail without sudo)
RUN apt-get update && apt-get install -y --no-install-recommends \
    gdebi-core
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# get RStudio-Server: stable releases: https://posit.co/download/rstudio-server/
# ENV RSTUDIO_VERSION=2023.03.0-386 \
#     RSTUDIO_URL_BASE=https://s3.amazonaws.com/rstudio-ide-build/server/

# daily builds: https://dailies.rstudio.com/rstudio/
ENV RSTUDIO_VERSION=2025.04.0-daily-299 \
    RSTUDIO_URL_BASE=https://s3.amazonaws.com/rstudio-ide-build/server/jammy
    #RSTUDIO_URL_BASE=https://download2.rstudio.org/server/jammy

ENV RSTUDIO_FILE="rstudio-server-${RSTUDIO_VERSION}-amd64.deb"
#RUN wget ${RSTUDIO_URL_BASE}$(lsb_release -cs)/amd64/${RSTUDIO_FILE}
RUN wget ${RSTUDIO_URL_BASE}/amd64/${RSTUDIO_FILE}

RUN gdebi -n ${RSTUDIO_FILE} && \
    rm -rf ${RSTUDIO_FILE}

# use quarto from RStudio
#ENV QUARTO_BASE=/usr/lib/rstudio-server/bin/quarto/bin

# use pandoc from RStudio
ENV PANDOC_BASE=${QUARTO_BASE}/tools/x86_64

# install quarto (versions: https://github.com/quarto-dev/quarto-cli/releases/)
# https://docs.posit.co/resources/install-quarto.html
ENV QUARTO_VERSION="1.7.13"
RUN mkdir -p /opt/quarto/${QUARTO_VERSION}

RUN curl -o quarto.tar.gz -L \
    "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.tar.gz"
RUN tar -zxvf quarto.tar.gz \
    -C "/opt/quarto/${QUARTO_VERSION}" \
    --strip-components=1 
RUN rm quarto.tar.gz

ENV QUARTO_BASE=/opt/quarto/"${QUARTO_VERSION}"/bin/

ENV QUARTO_PATH=${QUARTO_BASE}/quarto
ENV PATH=${QUARTO_BASE}:${PANDOC_BASE}:${PATH}

# overwrite headless .Rprofile
RUN echo "options(shiny.port = 3838)" > /home/${RSESSION_USER}/.Rprofile && \
    echo "options(shiny.host = \"0.0.0.0\")" >> /home/${RSESSION_USER}/.Rprofile && \
    echo "options(shiny.launch.browser = FALSE)" >> /home/${RSESSION_USER}/.Rprofile && \
    chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.Rprofile

# add custom RStudio theme ("Dracula")
ADD config/rstudio-prefs.json /home/${RSESSION_USER}/.config/rstudio/rstudio-prefs.json
RUN mkdir -p /home/${RSESSION_USER}/.config/rstudio/snippets
ADD config/markdown.snippets /home/${RSESSION_USER}/.config/rstudio/snippets/markdown.snippets
RUN chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.config/ && \
    chmod 644 /home/${RSESSION_USER}/.config/rstudio/rstudio-prefs.json && \
    chmod 644 /home/${RSESSION_USER}/.config/rstudio/snippets/markdown.snippets

# add PATH to a bash_profile script (workaround so that path is available in rstudio\"s terminal)
# https://support.rstudio.com/hc/en-us/articles/115010737148-Using-the-RStudio-Terminal#env
# https://docs.rstudio.com/ide/server-pro/1.2.1293-1/r-sessions.html
RUN echo "export PATH=${PATH}" >> /home/${RSESSION_USER}/.bash_profile && chmod +x /home/${RSESSION_USER}/.bash_profile

# set QUARTO_PATH for all users
RUN echo "QUARTO_PATH=${QUARTO_PATH}" >> /etc/R/Renviron && \
    echo "QUARTO_PATH=${QUARTO_PATH}" >> /etc/environment

# for cran checks
# https://cran.r-project.org/doc/manuals/r-release/R-ints.html
RUN mkdir -p /home/${RSESSION_USER}/.R && \
    cd /home/${RSESSION_USER}/.R && \
    touch check.Renviron && \
    echo "_R_CHECK_TEST_TIMING_CPU_TO_ELAPSED_THRESHOLD_=2.5" > check.Renviron && \
    echo "_R_CHECK_TIMINGS_=5" >> check.Renviron && \
    chmod 666 check.Renviron

########################
# add r-devel
# https://people.math.aau.dk/~sorenh/misc/misc/install-rdevel.html

#ENV RDEVEL=/usr/local/lib/R-devel \
#    RSOURCES=/home/${RSESSION_USER}/src

# bypass miniconda which leads to compilation errors
#ENV PATH_OLD=${PATH}
#ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/x86_64-linux-gnu

#RUN mkdir -p ${RDEVEL} && \
#    mkdir -p ${RSOURCES}

#RUN cd ${RSOURCES} && \
#    svn co https://svn.r-project.org/R/trunk R-devel
#RUN cd ${RSOURCES} && R-devel/tools/rsync-recommended

#RUN cd ${RDEVEL} && \
#    ${RSOURCES}/R-devel/configure \
#    --enable-R-shlib \
#    --enable-memory-profiling \
#    --with-blas \
#    --with-cairo \
#    --with-lapack && \
#    make -j
    # --without-recommended-packages && \

# in case of failure:
# make uninstall
# make clean
# make distclean

#RUN rm -rf ${RSOURCES}

#USER ${RSESSION_USER} 
#RUN echo "alias rdevel=${RDEVEL}/bin/R" >> ~/.bashrc && \
#    chmod +x ~/.bashrc
#USER root

#RUN ${RDEVEL}/bin/R -q -e "install.packages(c('pak'), dependencies = TRUE, lib = '${RDEVEL}/library', repos = 'https://cloud.r-project.org/')"
#RUN ${RDEVEL}/bin/R -q -e "pak::pkg_install('devtools')"

# in order to run RStudio with R-devel version, you need to exec in running container
# and execute the following commands:
# rstudio-server stop
# export RSTUDIO_WHICH_R=/usr/local/lib/R-devel/bin/R
# rstudio-server start

# restore PATH
#ENV PATH=${PATH_OLD}

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

########################

# add start.sh script
ADD config/start.sh /
RUN chmod +x /start.sh

########################

WORKDIR /home/${RSESSION_USER}

# entrypoint
ENTRYPOINT bash -c "/start.sh"
