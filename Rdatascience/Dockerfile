FROM rocker/verse:3.6.2

ENV DEBIAN_FRONTEND noninteractive

# set cran repo
RUN echo "options('repos' = 'https://ftp.fau.de/cran/')" >> /usr/local/lib/R/etc/Rprofile.site

# install required custom system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    byobu \
    curl \
    htop \
    imagemagick \
    # pocketsphinx
    libasound2-dev \ 
    libffi-dev \
    libglu1-mesa-dev \
    libgmp3-dev \
    libgsl-dev \
    libmpfr-dev \
    libxt-dev \
    # xslt package
    libxslt1-dev \
    lmodern \
    # pocketsphinx
    libpulse-dev \
    locate \
    nano \
    net-tools \
    pandoc \
    pandoc-citeproc \
    python3-dev \
    python3-pip \
    python3-venv \
    # pocketsphinx
    swig \
    # dependencies for aplpack
    tcl8.6-dev \
    tk8.6-dev \
    traceroute
RUN rm -rf /var/lib/apt/lists/*

# Update where R expects to find various Java files
RUN R CMD javareconf

# set ENV-Vars
ARG DISPLAY
ENV DISPLAY=${DISPLAY}

# first, make sure, that package "remotes" is installed, so we can make use
# of its function remotes::update_packages 
# https://rdrr.io/cran/remotes/man/update_packages.html
RUN R -q -e "p <- \"remotes\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"

ARG a="abind \ 
    ada \ 
    adabag \ 
    arm \ 
    arules \ 
    arulesViz"
RUN for package in $a; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG b="bench \ 
    BH \ 
    bigmemory \ 
    blme \ 
    bookdown \ 
    brms \ 
    brnn \ 
    bst"
RUN for package in $b; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG c="C50 \ 
    car \ 
    carData \ 
    caret \ 
    caretEnsemble \ 
    cellranger \ 
    checkmate \ 
    citr \
    Ckmeans.1d.dp \ 
    class \ 
    clipr \ 
    cluster \ 
    ClusterR \ 
    coin \ 
    config \ 
    corpus \ 
    corrplot \ 
    covr \ 
    cowplot \ 
    CPE \ 
    cramer \ 
    curl \ 
    CVST"
RUN for package in $c; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG d="data.table \ 
    DBI \ 
    deepboost \ 
    desc \ 
    DescTools \ 
    devtools \ 
    DiagrammeR \ 
    dimRed \ 
    discretization \ 
    distrom \ 
    doBy \ 
    doMC \ 
    doParallel \ 
    dplyr \ 
    DT \ 
    dtplyr \ 
    dunn.test \ 
    dygraphs"
RUN for package in $d; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG e="e1071 \ 
    earth \ 
    effects \ 
    effsize \ 
    epitools \ 
    exactRankTests"
RUN for package in $e; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG f="factoextra \ 
    fastAdaboost \ 
    flexclust \
    flexmix \ 
    foreach \ 
    forecast \
    foreign \ 
    formatR \ 
    fpc \ 
    future \ 
    future.apply"
RUN for package in $f; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG g="GA \
    gamlr \ 
    gbm \ 
    gclus \ 
    genetics \ 
    ggfortify \ 
    ggmap \ 
    ggplot2 \ 
    ggpubr \ 
    ggridges \ 
    git2r \ 
    glmnet \ 
    gplots"
RUN for package in $g; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG h="haplo.stats \ 
    haven \ 
    Hmisc \ 
    httr \ 
    hunspell"
RUN for package in $h; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG i="igraph \ 
    infotheo \ 
    ipred \ 
    irlba \ 
    irr"
RUN for package in $i; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG j="jpeg \ 
    jsonlite"
RUN for package in $j; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG k="kableExtra \ 
    kernlab \ 
    kknn \ 
    knitr"
RUN for package in $k; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG l="latticeExtra \ 
    lava \ 
    lda \ 
    ldatuning \ 
    LDAvis \ 
    LiblineaR \ 
    lintr \ 
    lm.beta \ 
    lme4 \ 
    lmtest \ 
    lsa \ 
    lubridate"
RUN for package in $l; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG m="manipulate \ 
    manipulateWidget \ 
    maps \ 
    maptools \ 
    markdown \ 
    MASS \ 
    Matrix \ 
    MatrixModels \ 
    mboost \ 
    MCMCpack \ 
    merTools \ 
    microbenchmark \ 
    mlbench \ 
    MLmetrics \ 
    mlr3 \ 
    mlr3db \ 
    mlr3filters \ 
    mlr3learners \ 
    mlr3measures \ 
    mlr3misc \ 
    mlr3pipelines \ 
    mlr3proba \ 
    mlr3tuning \ 
    mlr3verse \ 
    mltools \ 
    muhaz"
RUN for package in $m; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

RUN R -q -e "devtools::install_github(repo = 'mlr-org/mlr3ordinal', ref = 'master')"
RUN R -q -e "devtools::install_github(repo = 'mlr-org/mlr3survival', ref = 'master')"
RUN R -q -e "devtools::install_github(repo = 'mlr-org/mlr3viz', ref = 'master')"
#RUN R -q -e "devtools::install_github(repo = 'mlr3learners/mlr3learners.ctree', ref = 'master')"
RUN R -q -e "devtools::install_github(repo = 'mlr3learners/mlr3learners.extratrees', ref = 'master')"
RUN R -q -e "devtools::install_github(repo = 'mlr3learners/mlr3learners.fnn', ref = 'master')"
#RUN R -q -e "devtools::install_github(repo = 'mlr3learners/mlr3learners.gbm', ref = 'master')"
#RUN R -q -e "devtools::install_github(repo = 'mlr3learners/mlr3learners.ksvm', ref = 'master')"
#RUN R -q -e "devtools::install_github(repo = 'mlr3learners/mlr3learners.liblinear', ref = 'master')"
RUN R -q -e "devtools::install_github(repo = 'mlr3learners/mlr3learners.mboost', ref = 'master')"

ARG n="naivebayes \ 
    neuralnet \ 
    ngramrr \ 
    nlme \ 
    NLP \ 
    nls2 \ 
    nnet \ 
    nnls \ 
    nortest"
RUN for package in $n; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG o="odbc \ 
    officer \ 
    onewaytests \ 
    openNLPdata \ 
    openssl \ 
    openxlsx \ 
    optparse \
    ordinal"
RUN for package in $o; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG p="parallel \ 
    party \ 
    partykit \ 
    pbkrtest \ 
    PerformanceAnalytics \ 
    plotly \ 
    pls \ 
    plyr \ 
    polynom \ 
    precrec \ 
    pROC \
    processx \ 
    profvis \ 
    PRROC \ 
    pspearman \ 
    psych"
RUN for package in $p; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG q="qdap \ 
    qpdf \ 
    quantreg \ 
    quantregForest \
    questionr"
RUN for package in $q; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG r="R.utils \ 
    r2d3 \ 
    R6 \ 
    randomForest \ 
    ranger \ 
    rbokeh \ 
    Rcmdr \ 
    rcompanion \ 
    RConics \ 
    Rcpp \ 
    RCurl \ 
    readr \ 
    readstata13 \ 
    readxl \ 
    remotes \ 
    ReporteRs \ 
    ReporteRsjars \ 
    reshape2 \ 
    reticulate \ 
    rgenoud \ 
    rJava \ 
    RJDBC \ 
    rlang \ 
    rmarkdown \ 
    rms \ 
    rngtools \ 
    rnn \ 
    ROCR \ 
    roxygen2 \ 
    rpart \ 
    RPostgres \ 
    RSQLite \ 
    rstan \ 
    rstantools \ 
    rstudioapi \ 
    rts \ 
    RVAideMemoire \ 
    rversions \ 
    rvest \ 
    rvg"
RUN for package in $r; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG s="SentimentAnalysis \ 
    sem \ 
    seriation \ 
    shiny \ 
    shinydashboard \ 
    shinyFiles \ 
    shinyjs \ 
    shinystan \ 
    shinytest \
    shinythemes \ 
    shinyWidgets \ 
    sigmoid \ 
    sjlabelled \ 
    sjmisc \ 
    sjPlot \ 
    sjstats \ 
    smbinning \ 
    sparklyr \ 
    SparseM \ 
    sqldf \  
    stargazer \ 
    styler \ 
    summarytools \ 
    survival \ 
    survminer \ 
    synthpop \ 
    syuzhet"
RUN for package in $s; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG t="tau \ 
    testthat \ 
    text2vec \ 
    textstem \ 
    textir \ 
    threejs \ 
    tibble \ 
    tidyr \ 
    tidymodels \ 
    tidyselect \ 
    tidyverse \ 
    timeDate \ 
    tm \ 
    tinytex \ 
    topicmodels \ 
    tseries \ 
    twitteR"
RUN for package in $t; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG u="ucminf \ 
    udpipe \ 
    urltools \ 
    usethis \ 
    utf8"
RUN for package in $u; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG v="vegan"
RUN for package in $v; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG w="wesanderson \ 
    wordcloud \ 
    wordcloud2"
RUN for package in $w; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG x="xfun \ 
    xgboost \
    XML \ 
    xml2"
RUN for package in $x; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG y="yaml"
RUN for package in $y; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG z="zip \ 
    zoo"
RUN for package in $z; do \   
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

# install required LaTeX-Packages
RUN tlmgr option repository http://mirror.ctan.org/systems/texlive/tlnet && \
    tlmgr update --self && \
    tlmgr install \
    amsfonts \
    amsmath \
    babel \
    babel-german \
    caption \
    colortbl \
    ec \
    environ \
    epstopdf-pkg \
    float \
    geometry \
    graphics \
    graphics-def \
    hyperref \
    hyphen-german \
    iftex \
    koma-script \
    latex-graphics-dev \
    lm \
    makecell \
    multirow \
    oberdiek \
    pdflscape \
    tabu \
    tex-gyre-math \
    threeparttable \
    threeparttablex \
    titling \
    tools \
    trimspaces \
    varwidth \
    wrapfig \
    ulem \
    url \
    xcolor

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
RUN R -q -e "vec <- unname(installed.packages()[,\"Package\"]); remotes::update_packages(packages = vec, upgrade = \"always\")"  && \
    rm -rf /tmp/*

# install development packages
RUN R -q -e "devtools::install_github(repo = 'skranz/ReplaceInFiles', ref = 'master')"

# Install lightgbm R package
RUN git clone --recursive --branch stable --depth 1 https://github.com/microsoft/LightGBM
RUN cd LightGBM && \
    Rscript build_r.R
RUN rm -rf LightGBM

# workaround, to get stuff properly installed in users home dir
# set rstudio user here
ENV RSTUDIO_USER="rstudio" 

# add user + password
# https://s/home/${RSTUDIO_USER}/.virtualenvs/r-reticulate/bin/tackoverflow.com/questions/2150882/how-to-automatically-add-user-account-and-password-with-a-bash-script
#RUN useradd -ms /bin/bash ${RSTUDIO_USER} # rstudio user already exists
RUN echo ${RSTUDIO_USER}:password | chpasswd 

# switch user
USER ${RSTUDIO_USER}

# install miniconda via reticulate and configure python
RUN R -q -e "reticulate::install_miniconda(); reticulate::py_config()"

# switch back
USER root

# we can now add add the virtualenv python to PATH (on first place)
# add newly installed dependencies to PATH
ENV PATH="/home/${RSTUDIO_USER}/bin:${PATH}"
ENV PATH="/home/${RSTUDIO_USER}/.local/share/r-miniconda/envs/r-reticulate/bin:${PATH}"

# add PATH to a profile script (workaround so that path is available in rstudio's terminal)
RUN echo "export PATH=${PATH}" > /home/${RSTUDIO_USER}/.profile && chmod +x /home/${RSTUDIO_USER}/.profile

# Add RETICULATE_PYTHON variable to Renviron
# current ${R_HOME} = /usr/local/lib/R
RUN echo "export RETICULATE_PYTHON=/home/${RSTUDIO_USER}/.local/share/r-miniconda/envs/r-reticulate/bin/python" >> /usr/local/lib/R/etc/Renviron
# set PATH for all users
RUN echo "PATH=${PATH}" > /etc/environment

# switch user (let everything in .virtualenv/r-reticulate be installed by the user)
# we can use pip3 here, since we added the virtualenv to the beginning of our PATH variable
USER ${RSTUDIO_USER}

# install python prerequisites
RUN yes | pip3 install \
    setuptools \
    wheel

# now install other python packages
RUN yes | pip3 install \
    catboost \
    "colorama>=0.3.8" \
    cython

RUN yes | pip3 install \
    fhirclient

RUN yes | pip3 install \
    jinja2

RUN yes | pip3 install \
    lightgbm

RUN yes | pip3 install \
    matplotlib

RUN yes | pip3 install \
    nltk \
    nose \
    numpy

RUN yes | pip3 install \
    pandas \
    pocketsphinx

RUN yes | pip3 install \
    scikit-learn \
    scipy \
    SpeechRecognition

# configure the other r packages
# install phantomjs
RUN R -q -e "webshot::install_phantomjs()"

# install shinytest dependencies (= phantomjs)
RUN R -q -e "shinytest::installDependencies()"

# switch back
USER root

# install my own stuff
RUN R -q -e "devtools::install_github(repo = 'kapsner/KhelpeR', ref = 'latest')"
RUN R -q -e "devtools::install_github(repo = 'kapsner/rBiasCorrection', ref = 'latest')"
RUN R -q -e "devtools::install_github(repo = 'kapsner/BiasCorrector', ref = 'latest')"
RUN R -q -e "devtools::install_github(repo = 'kapsner/expenditR', ref = 'master')"
RUN R -q -e "devtools::install_github(repo = 'kapsner/lightgbm.py', ref = 'master')"
RUN R -q -e "devtools::install_github(repo = 'kapsner/mlr3learners.lgbpy', ref = 'master')"
RUN R -q -e "devtools::install_github(repo = 'mlr3learners/mlr3learners.lightgbm', ref = 'master')"
RUN R -q -e "devtools::install_git(url = 'https://gitlab.miracum.org/miracum/dqa/dqastats.git', ref = 'master')"
RUN R -q -e "devtools::install_git(url = 'https://gitlab.miracum.org/miracum/dqa/dqagui.git', ref = 'master')"
RUN R -q -e "devtools::install_git(url = 'https://gitlab.miracum.org/miracum/dqa/miRacumDQA.git', ref = 'master')"
RUN R -q -e "devtools::install_git(url = 'https://gitlab.miracum.org/kosmic/kosmicgui.git', ref = 'master')"

# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*
RUN rm -rf /home/${RSTUDIO_USER}/.cache/pip/*
RUN apt-get clean && apt-get autoclean && apt-get autoremove

# make deployed shiny app accessible via port 3838
RUN echo "options(shiny.port = 3838)" >> /home/${RSTUDIO_USER}/.Rprofile && \
    echo "options(shiny.host = '0.0.0.0')" >> /home/${RSTUDIO_USER}/.Rprofile && \
    echo "options(shiny.launch.browser = FALSE)" >> /home/${RSTUDIO_USER}/.Rprofile 

# add custom RStudio theme ("Dracula")
ADD _volume/user-settings /home/${RSTUDIO_USER}/.rstudio/monitored/user-settings/
RUN chown -R ${RSTUDIO_USER}:${RSTUDIO_USER} /home/${RSTUDIO_USER}/.rstudio && \
    chmod 644 /home/${RSTUDIO_USER}/.rstudio/monitored/user-settings/user-settings

# debugging:
# docker run --rm -p 8787:8787 -e PASSWORD=password -v ~/R:/home/rstudio/volume rocker/verse:3.6.1
