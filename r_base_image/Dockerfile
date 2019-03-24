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
    libxml2-dev \
    libgmp3-dev \
    libpq-dev \
    libffi-dev \
    libmagick++-dev \
    libmpfr-dev \
    libgsl-dev \
    libglu1-mesa-dev \
    texinfo \
    unixodbc-dev

RUN apt-get clean && apt-get autoclean

# get RStudio-Server (Preview Version): https://www.rstudio.com/products/rstudio/download/preview/
#RUN wget https://s3.amazonaws.com/rstudio-ide-build/server/trusty/amd64/rstudio-server-1.2.1206-amd64.deb
RUN wget https://s3.amazonaws.com/rstudio-ide-build/desktop/bionic/amd64/rstudio-1.2.1330-amd64.deb
RUN gdebi -n rstudio-server*amd64.deb
RUN rm -f rstudio-server*amd64.deb

