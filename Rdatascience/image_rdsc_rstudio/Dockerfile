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
ENV RSTUDIO_VERSION=2024.04.0-daily-426 \
    RSTUDIO_URL_BASE=https://s3.amazonaws.com/rstudio-ide-build/server/

ENV RSTUDIO_FILE="rstudio-server-${RSTUDIO_VERSION}-amd64.deb"
RUN wget ${RSTUDIO_URL_BASE}$(lsb_release -cs)/amd64/${RSTUDIO_FILE}

RUN gdebi -n ${RSTUDIO_FILE} && \
    rm -rf ${RSTUDIO_FILE}

# configure quarto
ENV QUARTO_BASE=/usr/lib/rstudio-server/bin/quarto/bin
ENV QUARTO_PATH=${QUARTO_BASE}/quarto \
    PANDOC_BASE=${QUARTO_BASE}/tools
ENV PATH=${QUARTO_BASE}:${PANDOC_BASE}:${PATH}

# overwrite headless .Rprofile
RUN echo "options(shiny.port = 3838)" > /home/${RSESSION_USER}/.Rprofile && \
    echo "options(shiny.host = \"0.0.0.0\")" >> /home/${RSESSION_USER}/.Rprofile && \
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

# set QUARTO_PATH for all users
RUN echo "QUARTO_PATH=${QUARTO_PATH}" >> /etc/R/Renviron && \
    echo "QUARTO_PATH=${QUARTO_PATH}" >> /etc/environment

########################
# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
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
