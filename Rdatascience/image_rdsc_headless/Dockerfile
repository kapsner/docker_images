FROM rdsc_base_jm:latest

# set rsession user here
ENV RSESSION_USER="user" 

ENV DEBIAN_FRONTEND=noninteractive

ARG a="abind \ 
    ada \ 
    adabag \ 
    aplpack \ 
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
    flexdashboard \ 
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
    influxdbr \ 
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

ARG l="languageserver \
    latticeExtra \ 
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
    mlr3db \ 
    mlr3measures \ 
    mlr3misc \ 
    mlr3proba \ 
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
    RcppRoll \ 
    RCurl \ 
    readr \ 
    readstata13 \ 
    readxl \ 
    redcapAPI \ 
    remotes \ 
    ReporteRs \ 
    ReporteRsjars \ 
    reshape2 \ 
    reticulate \ 
    rgenoud \
    rgl \  
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
    RSelenium \ 
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

ARG v="vegan \ 
    vroom"
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

# switch user
USER ${RSESSION_USER}
# install required LaTeX-Packages
RUN R -q -e "tinytex::install_tinytex()"
USER root

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

RUN chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.TinyTeX && \
    chmod -R g+w /home/${RSESSION_USER}/.TinyTeX && \
    chmod -R g+wx /home/${RSESSION_USER}/bin

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

# switch user (let everything in .virtualenv/r-reticulate be installed by the user)
# we can use pip here, since we added the virtualenv to the beginning of our PATH variable
USER ${RSESSION_USER}

# install additional python packages
RUN yes | pip install \
    catboost \
    "colorama>=0.3.8" \
    cython

RUN yes | pip install \
    fhirclient

RUN yes | pip install \
    jedi \
    jinja2

RUN yes | pip install \
    lightgbm

RUN yes | pip install \
    matplotlib

RUN yes | pip install \
    nltk \
    nose \
    numpy

RUN yes | pip install \
    pandas \
    pocketsphinx \
    pydub \
    pylint

RUN yes | pip install \
    radian

RUN yes | pip install \
    scikit-learn \
    scipy \
    SpeechRecognition

RUN yes | pip install \
    xgboost

# configure the other r packages
# install phantomjs
RUN R -q -e "webshot::install_phantomjs()"

# install shinytest dependencies (= phantomjs)
RUN R -q -e "shinytest::installDependencies()"

# switch back
USER root

# install my own stuff
RUN R -q -e "devtools::install_github(repo = 'kapsner/KhelpeR', ref = 'latest')"
#RUN R -q -e "devtools::install_github(repo = 'kapsner/rBiasCorrection', ref = 'latest')"
RUN R -q -e "devtools::install_github(repo = 'kapsner/BiasCorrector', ref = 'latest')"
RUN R -q -e "devtools::install_github(repo = 'kapsner/expenditR', ref = 'master')"
#RUN R -q -e "devtools::install_github(repo = 'kapsner/lightgbm.py', ref = 'master')"
RUN R -q -e "devtools::install_github(repo = 'kapsner/mlr3learners.lgbpy', ref = 'master')"
RUN R -q -e "devtools::install_github(repo = 'mlr3learners/mlr3learners.lightgbm', ref = 'master')"
#RUN R -q -e "devtools::install_git(url = 'https://gitlab.miracum.org/miracum/dqa/dqastats.git', ref = 'master')"
#RUN R -q -e "devtools::install_git(url = 'https://gitlab.miracum.org/miracum/dqa/dqagui.git', ref = 'master')"
RUN R -q -e "devtools::install_git(url = 'https://gitlab.miracum.org/miracum/dqa/miRacumDQA.git', ref = 'master')"
RUN R -q -e "devtools::install_git(url = 'https://gitlab.miracum.org/kosmic/kosmicgui.git', ref = 'master')"

# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*
RUN rm -rf /home/${RSESSION_USER}/.cache/pip/*
RUN apt-get clean && apt-get autoclean && apt-get autoremove

# make deployed shiny app accessible via port 3838
RUN echo "options(shiny.port = 3838)" >> /home/${RSESSION_USER}/.Rprofile && \
    echo "options(shiny.host = '0.0.0.0')" >> /home/${RSESSION_USER}/.Rprofile && \
    echo "options(shiny.launch.browser = FALSE)" >> /home/${RSESSION_USER}/.Rprofile && \
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
