FROM rdsc_headless:latest

# set rstudio user here
ENV RSESSION_USER="user" 
ENV DEBIAN_FRONTEND=noninteractive

# get RStudio-Server (Preview Version): https://www.rstudio.com/products/rstudio/download/preview/
ENV RSTUDIO_VERSION=1.3.926 \
    RSTUIO_URL=https://s3.amazonaws.com/rstudio-ide-build/server/bionic/amd64/
ENV RSTUDIO_FILE="rstudio-server-${RSTUDIO_VERSION}-amd64.deb"
ENV RSTUDIO_LINK=${RSTUIO_URL}${RSTUDIO_FILE}
RUN wget ${RSTUDIO_LINK}
RUN gdebi -n ${RSTUDIO_FILE}
RUN rm -f ${RSTUDIO_FILE}

# add custom RStudio theme ("Dracula")
ADD config/user-settings /home/${RSESSION_USER}/.rstudio/monitored/user-settings/
RUN chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.rstudio && \
    chmod 644 /home/${RSESSION_USER}/.rstudio/monitored/user-settings/user-settings

# entrypoint
ENTRYPOINT rstudio-server start && tail -f /dev/null
