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

# get RStudio-Server (Preview Version): https://www.rstudio.com/products/rstudio/download/preview/
ENV RSTUDIO_VERSION=2022.07.0-548 \
    RSTUIO_URL_BASE=https://download2.rstudio.org/server/

# stable
# ENV RSTUDIO_VERSION=1.2.5033 \
#     RSTUIO_URL=https://download2.rstudio.org/server/bionic/amd64/
ENV RSTUDIO_FILE="rstudio-server-${RSTUDIO_VERSION}-amd64.deb"
RUN wget ${RSTUIO_URL_BASE}$(lsb_release -cs)/amd64/${RSTUDIO_FILE}

RUN gdebi -n ${RSTUDIO_FILE} && \
    rm -rf ${RSTUDIO_FILE}

# install quarto
# ENV QUARTO_VERSION=1.0.37
# RUN curl -o quarto-linux-amd64.deb -L \
#     https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.deb
# RUN gdebi -n quarto-linux-amd64.deb
# https://github.com/quarto-dev/quarto-r/blob/main/R/quarto.R#L10
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
