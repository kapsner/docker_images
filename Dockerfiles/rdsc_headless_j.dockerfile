FROM joundso/rdsc_base_j:latest

LABEL org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://github.com/joundso/r_datascience"

ENV DEBIAN_FRONTEND=noninteractive

## build ARGs
ARG NCPUS=${NCPUS:--1}

# USER ${RSESSION_USER}

RUN install2.r --error --skipinstalled -n $NCPUS \
    abind \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r --error --skipinstalled -n $NCPUS \
    bigmemory \ 
    billboarder \ 
    bookdown \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r --error --skipinstalled -n $NCPUS \
    ## Not on CRAN anymore:
    # cairoDevice \
    # citr \
    class \ 
    cluster \ 
    ClusterR \ 
    config \ 
    covr \ 
    cowplot \ 
    curl \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r --error --skipinstalled -n $NCPUS \
    data.table \
    daterangepicker \
    DBI  \
    desc \
    DescTools \ 
    devtools \
    distill \
    doParallel \
    dotenv \
    dplyr \
    DT \
    dtplyr \
    dunn.test \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r --error --skipinstalled -n $NCPUS \
    effects \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r --error --skipinstalled -n $NCPUS \
    fhircrackr \ 
    foreach \ 
    formatR \ 
    # DQAstats:
    future \ 
    # DQAstats:
    future.apply \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r --error --skipinstalled -n $NCPUS \
    ggplot2 \ 
    ggpubr \ 
    gtsummary \
    gplots \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r --error --skipinstalled -n $NCPUS \
    highcharter \
    Hmisc \ 
    httr \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r --error --skipinstalled -n $NCPUS \
    influxdbr \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r --error --skipinstalled -n $NCPUS \
    jpeg \ 
    jsonlite \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r --error --skipinstalled -n $NCPUS \
    kableExtra \ 
    knitr \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r --error --skipinstalled -n $NCPUS \
    languageserver \
    lintr \ 
    logger \
    lubridate \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r --error --skipinstalled -n $NCPUS \
    markdown \ 
    Matrix \ 
    microbenchmark \ 
    mlbench \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

# RUN R -q -e "exit(); quit()"

RUN install2.r --error --skipinstalled -n $NCPUS \
    naivebayes \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r --error --skipinstalled -n $NCPUS \
    odbc \ 
    openssl \ 
    openxlsx \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r --error --skipinstalled -n $NCPUS \
    pagedown \
    parallel \ 
    parsedate \ 
    pheatmap \ 
    plotly \ 
    plyr \ 
    psych \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

# ARG q="qpdf \ 
#     questionr"
# RUN for package in $q; do \
#     R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
#     done && \
#     rm -rf /tmp/*

RUN install2.r --error --skipinstalled -n $NCPUS \
    R.utils \ 
    R6 \ 
    rapportools \
    rattle \
    rcmdcheck \ 
    RCurl \ 
    reactable \
    readr \ 
    redcapAPI \ 
    REDCapR \
    RefManageR \
    remotes \ 
    ## Reproducible Examples:
    reprex \
    reshape2 \ 
    reticulate \
    rJava \ 
    RJDBC \ 
    RJSONIO \
    rlang \ 
    rmarkdown \ 
    Rmisc \ 
    roxygen2 \ 
    RPostgres \ 
    RSQLite \ 
    rstudioapi \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r --error --skipinstalled -n $NCPUS \
    shiny \ 
    shinyalert \ 
    shinydashboard \ 
    shinyFiles \ 
    shinyjs \ 
    shinytest \ 
    shinythemes \ 
    shinyWidgets \ 
    sqldf \  
    styler \ 
    summarytools \ 
    sunburstR \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r --error --skipinstalled -n $NCPUS \
    testthat \ 
    tidyr \ 
    tidyverse \ 
    timeDate \ 
    tinytex \
    tiff \ 
    treemap \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r --error --skipinstalled -n $NCPUS \
    urltools \ 
    usethis \ 
    utf8 \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

# ARG v="vegan \ 
#     vroom"
# RUN for package in $v; do \
#     R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
#     done && \
#     rm -rf /tmp/*

RUN install2.r --error --skipinstalled -n $NCPUS \
    wesanderson \ 
    wordcloud \ 
    wordcloud2 \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r --error --skipinstalled -n $NCPUS \
    xfun \ 
    xgboost \
    XML \ 
    xml2 \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r --error --skipinstalled -n $NCPUS \
    yaml \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r --error --skipinstalled -n $NCPUS \
    zip \
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

USER ${RSESSION_USER}

# install required LaTeX-Packages
RUN R -q -e "tinytex::install_tinytex()"

ENV PATH="/home/${RSESSION_USER}/bin:/home/${RSESSION_USER}/.TinyTeX/bin/x86_64-linux:${PATH}"

ARG tiny="'amsfonts', \ 
    'amsmath', \ 
    'atveryend', \ 
    'babel', \ 
    'babel-german', \ 
    'caption', \ 
    'colortbl', \ 
    'dehyph-exptl', \ 
    'ec', \ 
    'environ', \ 
    'epstopdf-pkg', \ 
    'float', \ 
    'geometry', \ 
    'graphics', \ 
    'graphics-def', \ 
    'hycolor', \ 
    'hyperref', \ 
    'hyphen-german', \ 
    'iftex', \ 
    'koma-script', \ 
    'latex-graphics-dev', \ 
    'latexconfig', \ 
    'lm', \ 
    'makecell', \ 
    'multirow', \ 
    'oberdiek', \ 
    'pdfcrop', \ 
    'pdflscape', \ 
    'tabu', \ 
    'tex-gyre-math', \ 
    'texlive-scripts', \ 
    'threeparttable', \ 
    'threeparttablex', \ 
    'titling', \ 
    'tools', \ 
    'trimspaces', \ 
    'ulem', \ 
    'varwidth', \ 
    'wrapfig', \ 
    'ulem', \ 
    'url', \ 
    'xcolor'"

RUN R -q -e "tinytex::tlmgr_conf()"
RUN R -q -e "tinytex::tlmgr_install(pkgs = c(${tiny}))"
RUN R -q -e "tinytex::tlmgr_update()"

USER root

RUN chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.TinyTeX && \
    chmod -R g+w /home/${RSESSION_USER}/.TinyTeX && \
    chmod -R g+wx /home/${RSESSION_USER}/bin



# safety-check at the end: 
# 1) look if everything is installed correctely (if not, you might add system-dependencies in the base_image)
# 2) update all packages to the newest version
# 3) start rstudio-server
# ARG allpackages="\"$a\" \"$b\" \"$c\" \"$d\" \"$e\" \"$f\" \"$g\" \"$h\" \ 
#     \"$i\" \"$j\" \"$k\" \"$l\" \"$m\" \"$n\" \"$o\" \"$p\" \"$q\" \"$r\" \ 
#     \"$s\" \"$t\" \"$u\" \"$v\" \"$w\" \"$x\" \"$y\" \"$z\""

# RUN export packages_format="$(echo $(echo ${allpackages} | sed -e 's/ /\"\, \"/g') | sed -e 's/\"\"/\"/g')" && \
#     R -q -e "vec <- setdiff(c($packages_format), unname(installed.packages()[,\"Package\"])); print(vec); vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); install.packages(pkgs = vec2)"

# update all installed packages
RUN R -q -e "vec <- unname(installed.packages()[,\"Package\"]); remotes::update_packages(packages = vec, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"  && \
    rm -rf /tmp/*

USER ${RSESSION_USER}

# configure the other r packages
# install phantomjs
RUN R -q -e "webshot::install_phantomjs()"

# install shinytest dependencies (= phantomjs)
RUN R -q -e "shinytest::installDependencies()"

# install the stuff, where I participate
#RUN R -q -e "devtools::install_git(url = 'https://gitlab.miracum.org/miracum/dqa/dqastats.git', ref = 'master')"
#RUN R -q -e "devtools::install_git(url = 'https://gitlab.miracum.org/miracum/dqa/dqagui.git', ref = 'master')"
RUN R -q -e "devtools::install_git(url = 'https://gitlab.miracum.org/miracum/dqa/miRacumdqa.git', ref = 'master')"
RUN R -q -e "devtools::install_github('miracum/misc-diztools', ref = 'dev')"
RUN R -q -e "devtools::install_github('joundso/mainzelliste-connector', ref = 'development')"
RUN R -q -e "devtools::install_github('joundso/rkafka', ref = 'development')"
RUN R -q -e "devtools::install_github('joundso/gpas_connector', ref = 'development')"
RUN R -q -e "devtools::install_github('joundso/requirements', ref = 'development')"
RUN R -q -e "devtools::install_github('joundso/usRbility', ref = 'dev')"

## Other stuff:
## Formatting comments and RMarkdown tables:
RUN R -q -e "devtools::install_github('mwip/beautifyR')"

## Addin to easy insert roxygen formatting options:
RUN R -q -e "remotes::install_github('matt-dray/snorkel')"

## Explore data and create ggplots:
RUN R -q -e "remotes::install_github('dreamRs/esquisse')"

## Data Analytics:
RUN R -q -e "remotes::install_github('radiant-rstats/radiant.update', upgrade = 'never'); \
    radiant.update::radiant.update()"

## CRAN packages with my participation:
ARG pack="DIZutils"
RUN for package in $pack; do \   
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

USER root
## Change rights to access packages as user 'user':
# RUN chown -R ${RSESSION_USER}:${RSESSION_USER} /usr/local/lib/R/site-library

# install sudo here, required for rstudio:
RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /home/${RSESSION_USER}/.cache/pip/* && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

# set ubuntu password here (password required for rstudio login)
RUN echo ${USER}:password | chpasswd  && \
    echo ${USER} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USER} && \
    chmod 0440 /etc/sudoers.d/${USER}

# make deployed shiny app accessible via port 3838
RUN echo "options(shiny.port = 3838)" >> /home/${RSESSION_USER}/.Rprofile && \
    echo "options(shiny.host = '0.0.0.0')" >> /home/${RSESSION_USER}/.Rprofile && \
    echo "options(shiny.launch.browser = FALSE)" >> /home/${RSESSION_USER}/.Rprofile && \
    echo "options(shiny.error = browser)" >> /home/${RSESSION_USER}/.Rprofile && \
    echo "options(shiny.fullstacktrace = TRUE)" >> /home/${RSESSION_USER}/.Rprofile && \
    # https://github.com/Ikuyadeu/vscode-R#r-session-watcher-experimental
    echo "source(file.path(Sys.getenv(if (.Platform\$OS.type == 'windows') 'USERPROFILE' else 'HOME'), '.vscode-R', 'init.R'))" >> /home/${RSESSION_USER}/.Rprofile && \
    chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.Rprofile

# add PATH to a bash_profile script (workaround so that path is available in rstudio's terminal)
# https://support.rstudio.com/hc/en-us/articles/115010737148-Using-the-RStudio-Terminal#env
# https://docs.rstudio.com/ide/server-pro/1.2.1293-1/r-sessions.html
RUN echo "export PATH=${PATH}" >> /home/${RSESSION_USER}/.bash_profile && chmod +x /home/${RSESSION_USER}/.bash_profile

# set PATH for all users
RUN echo "PATH=${PATH}" >> /etc/R/Renviron && \
    echo "PATH=${PATH}" >> /etc/environment

# add radian profile
ADD config/.radian_profile /home/${RSESSION_USER}/.radian_profile
RUN chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.radian_profile

# fix permissions in home folder
# RUN chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.local

# Add JDBC drivers:
RUN mkdir -p /opt/libs && \
    curl -SL https://repo1.maven.org/maven2/com/oracle/database/jdbc/ojdbc8/19.8.0.0/ojdbc8-19.8.0.0.jar -o /opt/libs/ojdbc8.jar && \
    curl -SL https://repo1.maven.org/maven2/com/oracle/database/jdbc/ojdbc10/19.8.0.0/ojdbc10-19.8.0.0.jar -o /opt/libs/ojdbc10.jar  && \
    chown -R ${RSESSION_USER}:${RSESSION_USER} /opt/libs/ && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

WORKDIR /home/${RSESSION_USER}
