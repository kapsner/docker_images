FROM base_image_light:latest

# set environment variable to supress user interaction
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
    libpq-dev \
    libxt-dev \
    libxml2-dev \
    texinfo

RUN apt-get clean && apt-get autoclean

# get RStudio-Server
RUN wget https://download2.rstudio.org/rstudio-server-1.1.463-amd64.deb
RUN gdebi -n rstudio-server-1.1.463-amd64.deb
RUN rm -f rstudio-server-1.1.463-amd64.deb

# install R packages for all users
RUN R -e 'install.packages(c("RPostgres", "data.table", "lubridate", "ggplot2", "knitr", "summarytools", "kableExtra", "jsonlite", "rmarkdown", "ggpubr", "caTools", "devtools", "tinytex", "ssh"), repos="https://ftp.fau.de/cran/")'

# add start-script to image, to start rstudio server, do some authentication management and keep server up and running
ADD ./startRServer.sh /
RUN chmod +x /startRServer.sh

# add custom RStudio theme ("Dracula")
ADD ./user-settings /root/
