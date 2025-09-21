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
    gdebi-core \
    openssh-server
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# setup ssh-server
RUN sed -i -E 's,^#?Port.*$,Port 2375,' /etc/ssh/sshd_config && \
    sh -c "echo '${USER} ALL=(root) NOPASSWD: /usr/sbin/service ssh start' >/etc/sudoers.d/service-ssh-start"

# get latest quarto vscode-extension release version
ENV QUARTO_VSIX_VER_URL="https://api.github.com/repos/quarto-dev/quarto/tags" \
    # get latest quarto-cli release version
    QUARTO_CLI_VER_URL="https://api.github.com/repos/quarto-dev/quarto-cli/tags" \
    POSITRON_EXTENSION_PATH="/home/${RSESSION_USER}/.positron-server/extensions" \
    QUARTO_DL_URL=https://github.com/quarto-dev/quarto-cli/releases/download

RUN QUARTO_VERSION=$( \
      curl -s ${QUARTO_CLI_VER_URL} | \
      jq -r '.[0].name'| \
      awk '{ gsub("[[:alpha:]]", "") ; print $0 }' \
    ) && \
    mkdir -p /opt/quarto/${QUARTO_VERSION} && \
    curl -o quarto.tar.gz -L \
    "${QUARTO_DL_URL}/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.tar.gz" && \
    tar -zxvf quarto.tar.gz \
    -C "/opt/quarto/${QUARTO_VERSION}" \
    --strip-components=1 && \
    rm quarto.tar.gz && \
    QUARTO_VSIX_VERSION=$( \
      curl -s ${QUARTO_VSIX_VER_URL} | \
      jq -r '.[1].name' | \
      awk '{ gsub("[[:alpha:]]|-", "") ; print $0 }' \
    ) && \
    DICPATH="${POSITRON_EXTENSION_PATH}/quarto.quarto-${QUARTO_VSIX_VERSION}/out/lsp/resources/dictionaries" && \
    QUARTO_BASE=/opt/quarto/"${QUARTO_VERSION}"/bin && \
    PANDOC_BASE=${QUARTO_BASE}/tools/x86_64 && \
    QUARTO_PATH=${QUARTO_BASE}/quarto && \
    PATH=${QUARTO_BASE}:${PANDOC_BASE}:${PATH} && \
    cd /home/${RSESSION_USER} && \
    # add PATH to a bash_profile script (workaround so that path is available in rstudio\"s terminal)
    # https://support.rstudio.com/hc/en-us/articles/115010737148-Using-the-RStudio-Terminal#env
    # https://docs.rstudio.com/ide/server-pro/1.2.1293-1/r-sessions.html
    echo "export PATH=${PATH}" >> .bash_profile && \
    chmod +x .bash_profile && \
    chown -R ${RSESSION_USER}:${RSESSION_USER} .bash_profile && \
    # PATH to .Renviron to have it available in positron's r-session
    echo "PATH=${PATH}\nDICPATH=${DICPATH}\nR_LIBS_USER=${R_LIBS_USER}" >> .Renviron && \
    echo "QUARTO_VERSION=${QUARTO_VERSION}\nQUARTO_VSIX_VERSION=${QUARTO_VSIX_VERSION}" >> .Renviron && \
    echo "_R_CHECK_TEST_TIMING_CPU_TO_ELAPSED_THRESHOLD_=2.5\n_R_CHECK_TIMINGS_=5" >> .Renviron && \
    chmod +x .Renviron && \
    chown -R ${RSESSION_USER}:${RSESSION_USER} .Renviron && \
    # for cran checks https://cran.r-project.org/doc/manuals/r-release/R-ints.html
    mkdir -p .R && touch .R/check.Renviron && \
    echo "_R_CHECK_TEST_TIMING_CPU_TO_ELAPSED_THRESHOLD_=2.5\n_R_CHECK_TIMINGS_=5" > .R/.Renviron && \
    chmod +x .R/check.Renviron && \
    chown -R ${RSESSION_USER}:${RSESSION_USER} .R && \
    # set QUARTO_PATH for all users
    echo "QUARTO_PATH=${QUARTO_PATH}\nDICPATH=${DICPATH}" >> /etc/R/Renviron && \
    echo "QUARTO_PATH=${QUARTO_PATH}\nDICPATH=${DICPATH}" >> /etc/environment


########################
# # add r-devel
# # https://people.math.aau.dk/~sorenh/misc/misc/install-rdevel.html

# ENV RDEVEL=/usr/local/lib/R-devel \
#     RSOURCES=/home/${RSESSION_USER}/src

# # bypass miniconda which leads to compilation errors
# ENV PATH_OLD=${PATH}
# ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/x86_64-linux-gnu

# RUN mkdir -p ${RDEVEL} && \
#     mkdir -p ${RSOURCES}

# RUN cd ${RSOURCES} && \
#     svn co https://svn.r-project.org/R/trunk R-devel
# RUN cd ${RSOURCES} && R-devel/tools/rsync-recommended

# RUN cd ${RDEVEL} && \
#     ${RSOURCES}/R-devel/configure \
#     --enable-R-shlib \
#     --enable-memory-profiling \
#     --with-blas \
#     --with-cairo \
#     --with-lapack && \
#     make -j
#     # --without-recommended-packages && \

# # in case of failure:
# # make uninstall
# # make clean
# # make distclean

# RUN rm -rf ${RSOURCES}

# USER ${RSESSION_USER} 
# RUN echo "alias rdevel=${RDEVEL}/bin/R" >> ~/.bashrc && \
#     chmod +x ~/.bashrc
# USER root

# RUN ${RDEVEL}/bin/R -q -e "install.packages(c('pak'), dependencies = TRUE, lib = '${RDEVEL}/library', repos = 'https://cloud.r-project.org/')"
# RUN ${RDEVEL}/bin/R -q -e "pak::pkg_install('devtools')"

# # in order to run RStudio with R-devel version, you need to exec in running container
# # and execute the following commands:
# # rstudio-server stop
# # export RSTUDIO_WHICH_R=/usr/local/lib/R-devel/bin/R
# # rstudio-server start

# # restore PATH
# ENV PATH=${PATH_OLD}

########################
# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################see the command that starts ark? Is that where you got this information from? Can you please share that section of the logs?

# add start_new.sh script
ADD config/start_new.sh /
RUN chmod +x /start_new.sh && \
    chown ${RSESSION_USER}:${RSESSION_USER} /start_new.sh

########################

WORKDIR /home/${RSESSION_USER}

USER ${RSESSION_USER}

# entrypoint
SHELL ["/bin/bash", "-c"]
ENTRYPOINT ["/start_new.sh"]
