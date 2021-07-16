FROM joundso/rdsc_base_j:latest

ENV DEBIAN_FRONTEND=noninteractive

USER ${RSESSION_USER}

ARG a="abind"
RUN for package in $a; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG b="bigmemory \ 
    billboarder \ 
    bookdown"
RUN for package in $b; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG c="citr \
    class \ 
    cluster \ 
    ClusterR \ 
    config \ 
    covr \ 
    cowplot \ 
    curl"
RUN for package in $c; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG d="data.table \ 
    daterangepicker \
    DBI \ 
    desc \ 
    DescTools \ 
    devtools \ 
    distill \
    doParallel \ 
    dotenv \ 
    dplyr \ 
    DT \ 
    dtplyr \ 
    dunn.test"
RUN for package in $d; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG e="effects"
RUN for package in $e; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG f="fhircrackr \ 
    foreach \ 
    formatR \ 
    # DQAstats:
    future \ 
    # DQAstats:
    future.apply"
    RUN for package in $f; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG g="ggplot2 \ 
    ggpubr \ 
    gtsummary \
    gplots"
RUN for package in $g; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG h="highcharter \
    Hmisc \ 
    httr"
RUN for package in $h; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG i="influxdbr"
RUN for package in $i; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG j="jpeg \ 
    jsonlite"
RUN for package in $j; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG k="kableExtra \ 
    knitr"
RUN for package in $k; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG l="languageserver \
    lintr \ 
    lubridate"
RUN for package in $l; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG m="markdown \ 
    Matrix \ 
    microbenchmark \ 
    mlbench"
RUN for package in $m; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG n="naivebayes"
RUN for package in $n; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG o="odbc \ 
    openssl \ 
    openxlsx"
RUN for package in $o; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG p="pagedown \
    parallel \ 
    parsedate \ 
    pheatmap \ 
    plotly \ 
    plyr \ 
    psych"
RUN for package in $p; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

# ARG q="qpdf \ 
#     questionr"
# RUN for package in $q; do \
#     R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
#     done && \
#     rm -rf /tmp/*

ARG r="R.utils \ 
    R6 \ 
    rapportools \
    rcmdcheck \ 
    RCurl \ 
    reactable \
    readr \ 
    redcapAPI \ 
    remotes \ 
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
    rstudioapi"
RUN for package in $r; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG s="shiny \ 
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
    sunburstR"
RUN for package in $s; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG t="testthat \ 
    tidyr \ 
    tidyverse \ 
    timeDate \ 
    tinytex \ 
    treemap"
RUN for package in $t; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG u="urltools \ 
    usethis \ 
    utf8"
RUN for package in $u; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

# ARG v="vegan \ 
#     vroom"
# RUN for package in $v; do \
#     R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
#     done && \
#     rm -rf /tmp/*

ARG w="wesanderson \ 
    wordcloud \ 
    wordcloud2"
RUN for package in $w; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG x="xfun \ 
    xgboost \
    XML \ 
    xml2"
RUN for package in $x; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG y="yaml"
RUN for package in $y; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG z="zip"
RUN for package in $z; do \   
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*


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

USER ${RSESSION_USER}

# safety-check at the end: 
# 1) look if everything is installed correctely (if not, you might add system-dependencies in the base_image)
# 2) update all packages to the newest version
# 3) start rstudio-server
ARG allpackages="\"$a\" \"$b\" \"$c\" \"$d\" \"$e\" \"$f\" \"$g\" \"$h\" \ 
    \"$i\" \"$j\" \"$k\" \"$l\" \"$m\" \"$n\" \"$o\" \"$p\" \"$q\" \"$r\" \ 
    \"$s\" \"$t\" \"$u\" \"$v\" \"$w\" \"$x\" \"$y\" \"$z\""

RUN export packages_format="$(echo $(echo ${allpackages} | sed -e 's/ /\"\, \"/g') | sed -e 's/\"\"/\"/g')" && \
    R -q -e "vec <- setdiff(c($packages_format), unname(installed.packages()[,\"Package\"])); print(vec); vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); install.packages(pkgs = vec2)"

# update all installed packages
RUN R -q -e "vec <- unname(installed.packages()[,\"Package\"]); remotes::update_packages(packages = vec, build_manual = FALSE, quiet = TRUE, upgrade = \"always\")"  && \
    rm -rf /tmp/*

# configure the other r packages
# install phantomjs
RUN R -q -e "webshot::install_phantomjs()"

# install shinytest dependencies (= phantomjs)
RUN R -q -e "shinytest::installDependencies()"

# install the stuff, where I participate
#RUN R -q -e "devtools::install_git(url = 'https://gitlab.miracum.org/miracum/dqa/dqastats.git', ref = 'master')"
#RUN R -q -e "devtools::install_git(url = 'https://gitlab.miracum.org/miracum/dqa/dqagui.git', ref = 'master')"
RUN R -q -e "devtools::install_git(url = 'https://gitlab.miracum.org/miracum/dqa/miRacumdqa.git', ref = 'master')"
RUN R -q -e "devtools::install_github('joundso/mainzelliste-connector', ref = 'development')"
RUN R -q -e "devtools::install_github('joundso/rkafka', ref = 'development')"
RUN R -q -e "devtools::install_github('joundso/gpas_connector', ref = 'development')"
RUN R -q -e "devtools::install_github('joundso/requirements', ref = 'development')"

# CRAN packages with my participation
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
    sudo
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*
RUN rm -rf /home/${RSESSION_USER}/.cache/pip/*
RUN apt-get clean && apt-get autoclean && apt-get autoremove -y

# set ubuntu password here (password required for rstudio login)
RUN echo ${USER}:password | chpasswd 
RUN echo ${USER} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USER} && \
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
RUN echo "PATH=${PATH}" >> /etc/R/Renviron
RUN echo "PATH=${PATH}" >> /etc/environment

# add radian profile
ADD config/.radian_profile /home/${RSESSION_USER}/.radian_profile
RUN chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.radian_profile

# fix permissions in home folder
# RUN chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.local

# Add JDBC drivers:
RUN mkdir -p /opt/libs
RUN curl -SL https://repo1.maven.org/maven2/com/oracle/database/jdbc/ojdbc8/19.8.0.0/ojdbc8-19.8.0.0.jar -o /opt/libs/ojdbc8.jar
RUN curl -SL https://repo1.maven.org/maven2/com/oracle/database/jdbc/ojdbc10/19.8.0.0/ojdbc10-19.8.0.0.jar -o /opt/libs/ojdbc10.jar
RUN chown -R ${RSESSION_USER}:${RSESSION_USER} /opt/libs/

# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

WORKDIR /home/${RSESSION_USER}
