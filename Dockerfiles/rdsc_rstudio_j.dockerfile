FROM joundso/rdsc_headless_j:latest

LABEL org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://github.com/joundso/r_datascience"

ARG \
    ## Quarto: https://github.com/quarto-dev/quarto-cli/releases
    QUARTO_VERSION="1.1.149" \

    ## RStudio: 
    ## - Semi-Stable: https://www.rstudio.com/products/rstudio/download/preview/
    ## - Pre-Relese Builds: https://dailies.rstudio.com/rstudio/spotted-wakerobin/server/jammy/
    ##   or: https://dailies.rstudio.com/rstudio/
    ##   or: https://dailies.rstudio.com/rstudio/elsbeth-geranium/server/jammy-amd64/
    RSTUDIO_VERSION="2022.11.0-daily-147"

# USER ${RSESSION_USER}

# # update all installed packages
# RUN R -q -e "vec <- unname(installed.packages()[,\"Package\"]); remotes::update_packages(packages = vec, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"  && \
#     rm -rf /tmp/*

# USER root

## Install quarto:
RUN curl -o quarto-linux-amd64.deb -L https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.deb && \
    dpkg -i quarto-linux-amd64.deb && \
    rm -f quarto-linux-amd64.deb


## UBUNTU_CODENAME (22.04 = jammy):
## - `lsb_release -cs` (needs to be installed first: `apt-get update && apt-get install -y lsb-release && apt-get clean all`)
## - `cat /etc/os-release | grep UBUNTU_CODENAME | cut -d "=" -f 2-` (without any additional package)
## - Details: https://stackoverflow.com/questions/58395566/lsb-release-command-not-found-in-latest-ubuntu-docker-container

ENV RSTUDIO_FILE="rstudio-server-${RSTUDIO_VERSION}-amd64.deb"

RUN wget \
    -O rstudio_installer.deb \
    -q https://s3.amazonaws.com/rstudio-ide-build/server/$(lsb_release -cs)/amd64/${RSTUDIO_FILE}
    # -q https://download2.rstudio.org/server/$(lsb_release -cs)/amd64/${RSTUDIO_FILE}


## install gdebi here, required to install rstudio
## (gdebi will fail without sudo)
# RUN apt-get update && apt-get install -y --no-install-recommends \
#     gdebi-core
# RUN apt-get clean && \ 
#     apt-get autoclean && \
#     rm -rf /var/lib/apt/lists/*


# RUN gdebi -n ${RSTUDIO_FILE}
RUN dpkg -i rstudio_installer.deb
RUN rm -f rstudio_installer.deb

# overwrite headless .Rprofile
RUN echo "options(shiny.port = 3838)" > /home/${RSESSION_USER}/.Rprofile && \
    echo "options(shiny.host = '0.0.0.0')" >> /home/${RSESSION_USER}/.Rprofile && \
    echo "options(shiny.launch.browser = FALSE)" >> /home/${RSESSION_USER}/.Rprofile && \
    chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.Rprofile

# add custom RStudio theme ("Dracula")
ADD config/rstudio-prefs.json /home/${RSESSION_USER}/.config/rstudio/rstudio-prefs.json
RUN chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.config/ && \
    chmod 644 /home/${RSESSION_USER}/.config/rstudio/rstudio-prefs.json


# add PATH to a bash_profile script (workaround so that path is available in rstudio\"s terminal)
# https://support.rstudio.com/hc/en-us/articles/115010737148-Using-the-RStudio-Terminal#env
# https://docs.rstudio.com/ide/server-pro/1.2.1293-1/r-sessions.html
RUN echo "export PATH=${PATH}" >> /home/${RSESSION_USER}/.bash_profile && chmod +x /home/${RSESSION_USER}/.bash_profile

# set PATH for all users
RUN echo "PATH=${PATH}" >> /etc/R/Renviron
RUN echo "PATH=${PATH}" >> /etc/environment

########################
## Remove packages no longer needed in the final container:
# RUN dpkg --purge \
#     curl \
#     wget

# clear caches

RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################

# fix permissions in home folder
# RUN chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.local


## Change rights to access packages as user 'user':
# RUN chown -R ${RSESSION_USER}:${RSESSION_USER} /usr/local/lib/R/site-library

# entrypoint
ENTRYPOINT rstudio-server start && tail -f /dev/null
# CMD ["/usr/lib/rstudio-server/bin/rserver","--server-daemonize=0","--auth-none=1"]
