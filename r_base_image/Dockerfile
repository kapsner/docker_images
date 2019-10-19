FROM base_image:latest

ENV DEBIAN_FRONTEND=noninteractive

# Add R apt repository for latest R
# https://cran.r-project.org/bin/linux/ubuntu/
RUN gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN gpg -a --export E298A3A825C0D65DFD57CBB651716619E084DAB9 | sudo apt-key add -
RUN add-apt-repository "deb http://cran.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran35/"

RUN apt-get update && apt-get install -y --no-install-recommends \
    r-base-dev \
    pandoc \
    pandoc-citeproc \
    libcairo2-dev \
    libxt-dev \
    libsasl2-dev \
    # xml2 package
    libxml2-dev \
    # xslt package
    libxslt1-dev \
    libgmp3-dev \
    libpq-dev \
    libffi-dev \
    libmagick++-dev \
    libmpfr-dev \
    libgsl-dev \
    libglu1-mesa-dev \
    texinfo \
    unixodbc-dev \
    gcc-8 \
    libobjc-7-dev \
    lmodern \
    # rJava dependencies
    liblzma-dev \ 
    libbz2-dev

RUN apt-get clean && apt-get autoclean

# get RStudio-Server (Preview Version): https://www.rstudio.com/products/rstudio/download/preview/
ENV RSTUDIO_VERSION=1.2.5001 \
    RSTUIO_URL=https://download2.rstudio.org/server/bionic/amd64/
ENV RSTUDIO_FILE="rstudio-server-${RSTUDIO_VERSION}-amd64.deb"
ENV RSTUDIO_LINK=${RSTUIO_URL}${RSTUDIO_FILE}
#RUN wget -O rstudio-server.deb https://s3.amazonaws.com/rstudio-ide-build/server/bionic/amd64/rstudio-server-1.2.1330-amd64.deb
RUN wget ${RSTUDIO_LINK}
RUN gdebi -n ${RSTUDIO_FILE}
RUN rm -f ${RSTUDIO_FILE}

# add custom RStudio theme ("Dracula")
ADD ./user-settings /home/user/.rstudio/monitored/user-settings/
RUN chown -R user:user /home/user/.rstudio && \
    chmod 644 /home/user/.rstudio/monitored/user-settings/user-settings

# to test, if rstudio server is working and if user-settings have the correct format, run:
# docker run -it -p 8787:8787 --rm r_base_image bash
# in the chontainer run: rstudio-server start
