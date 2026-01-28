FROM rdsc_base:latest

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND=noninteractive

USER ${RSESSION_USER}

ARG a="abind \ 
    arm \ 
    arules"
RUN export pkg="\"$(echo ${a} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG b="badger \
    bench \ 
    BH \ 
    bibliometrix \
    blme \ 
    bookdown \ 
    boot \
    bootstrap"
RUN export pkg="\"$(echo ${b} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG c="C50 \ 
    car \ 
    carData \ 
    checkhelper \
    class \ 
    clipr \ 
    cluster \ 
    coda \
    coin \ 
    compare \
    config \ 
    correlation \
    corrplot \ 
    covr \ 
    cowplot \ 
    cramer \ 
    curl \ 
    cutpointr"
RUN export pkg="\"$(echo ${c} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG d="data.table \ 
    DBI \ 
    desc \ 
    devtools \ 
    discretization \ 
    doMC \
    doParallel \ 
    doRNG \
    dplyr \ 
    DT \ 
    dunn.test"
RUN export pkg="\"$(echo ${d} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG e="e1071 \ 
    easyPubMed \
    easystats \
    effects \ 
    effectsize \
    effsize \ 
    epitools"
RUN export pkg="\"$(echo ${e} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG f="factoextra \ 
    fastshap \ 
    flexclust \ 
    flexmix \ 
    flextable \ 
    foreach \ 
    forecast \ 
    foreign \ 
    formatR \ 
    future \ 
    future.apply"
RUN export pkg="\"$(echo ${f} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG g="ggcorrplot \
    ggfortify \ 
    ggmap \ 
    ggplot2 \ 
    ggpubr \ 
    ggraph \ 
    ggridges \ 
    ggstatsplot \
    git2r \ 
    glmnet \
    gplots"
RUN export pkg="\"$(echo ${g} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG h="haven \ 
    here \
    hexSticker \
    Hmisc \ 
    httr \ 
    hunspell"
RUN export pkg="\"$(echo ${h} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG i="igraph \ 
    imager \
    influxdbr \ 
    invgamma \
    IRkernel \
    irr"
RUN export pkg="\"$(echo ${i} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG j="jpeg \ 
    jsonlite"
RUN export pkg="\"$(echo ${j} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG k="kableExtra \ 
    kernelshap \
    kernlab \ 
    kknn \ 
    knitr"
RUN export pkg="\"$(echo ${k} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG l="languageserver \
    latticeExtra \ 
    lava \ 
    lightgbm \ 
    lintr \ 
    lme4 \ 
    lmtest \ 
    lubridate"
RUN export pkg="\"$(echo ${l} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG m="markdown \ 
    MASS \ 
    Matrix \ 
    MCMCpack \ 
    measures \
    mice \
    microbenchmark \ 
    mgcv \
    mlbench \ 
    mltools \ 
    modelbased"
RUN export pkg="\"$(echo ${m} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG n="naivebayes \ 
    neuralnet \ 
    nlme \ 
    nls2 \ 
    nnet"
RUN export pkg="\"$(echo ${n} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG o="odbc \ 
    officer \ 
    onewaytests \ 
    openssl \ 
    openxlsx \ 
    optparse \
    ordinal"
RUN export pkg="\"$(echo ${o} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG p="pak \
    parallel \ 
    parameters \
    party \ 
    partykit \ 
    PearsonDS \
    performance \
    PerformanceAnalytics \ 
    plyr \ 
    polynom \ 
    precrec \ 
    pROC \
    processx \ 
    progress \
    PRROC \ 
    pspearman \ 
    psych \
    pubmedR"
RUN export pkg="\"$(echo ${p} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG q="qpdf \ 
    quantmod \
    quarto"
RUN export pkg="\"$(echo ${q} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG r="R6 \ 
    rBayesianOptimization \
    randomForest \ 
    ranger \ 
    rcmdcheck \ 
    Rcpp \ 
    RCurl \ 
    readr \ 
    remotes \ 
    renv \
    reprex \
    reticulate \ 
    rhub \ 
    rJava \ 
    RJDBC \ 
    rlang \ 
    rmarkdown \ 
    ROCR \ 
    roxygen2 \ 
    rpart \ 
    RPostgres \ 
    rstan \ 
    rstantools \ 
    rstudioapi \ 
    rticles \
    rvest"
RUN export pkg="\"$(echo ${r} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG s="see\
    SentimentAnalysis \ 
    shapviz \
    shiny \ 
    shinyalert \
    shinydashboard \ 
    shinyFiles \ 
    shinyjs \ 
    shinytest \
    shinythemes \ 
    shinyWidgets \ 
    sjlabelled \ 
    sjmisc \ 
    sjPlot \ 
    sjstats \ 
    slackr \
    smbinning \ 
    spelling \
    splines \
    splitTools \
    stargazer \ 
    styler \ 
    sunburstR \ 
    survex \
    survival \ 
    survminer"
RUN export pkg="\"$(echo ${s} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG t="tau \ 
    testthat \ 
    tibble \ 
    tidyr \ 
    tidymodels \ 
    tidyselect \ 
    tidyverse \ 
    tinyplot \
    tiff \
    tm \ 
    tinytex \ 
    tseries"
RUN export pkg="\"$(echo ${t} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG u="udpipe \ 
    urltools \ 
    usethis \ 
    utf8"
RUN export pkg="\"$(echo ${u} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG v="vroom"
RUN export pkg="\"$(echo ${v} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG w="wesanderson \ 
    wordcloud \ 
    wordcloud2"
RUN export pkg="\"$(echo ${w} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG x="xfun \ 
    xgboost \
    XML \ 
    xml2"
RUN export pkg="\"$(echo ${x} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG y="yaml"
RUN export pkg="\"$(echo ${y} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

ARG z="zip \ 
    zoo"
RUN export pkg="\"$(echo ${z} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

# install required LaTeX-Packages
RUN R -q -e "tinytex::install_tinytex()"

ENV PATH="/home/${RSESSION_USER}/bin:/home/${RSESSION_USER}/.TinyTeX/bin/x86_64-linux:${PATH}"

ARG tiny="\"amsfonts\", \ 
    \"adjustbox\", \ 
    \"amsmath\", \ 
    \"atveryend\", \ 
    \"babel\", \ 
    \"babel-german\", \ 
    \"bookmark\", \ 
    \"caption\", \ 
    \"colortbl\", \ 
    \"csquotes\", \
    \"dehyph-exptl\", \ 
    \"ec\", \ 
    \"enumitem\", \ 
    \"environ\", \ 
    \"epstopdf-pkg\", \ 
    \"eurosym\", \ 
    \"fancyhdr\", \ 
    \"float\", \ 
    \"geometry\", \ 
    \"graphbox\", \ 
    \"graphics\", \ 
    \"graphics-def\", \ 
    \"hycolor\", \ 
    \"hyperref\", \ 
    \"hyphen-german\", \ 
    \"iftex\", \ 
    \"koma-script\", \ 
    \"latex-graphics-dev\", \ 
    \"latexconfig\", \ 
    \"lm\", \ 
    \"makecell\", \ 
    \"makeindex\", \ 
    \"multirow\", \ 
    \"needspace\", \ 
    \"nomencl\", \ 
    \"oberdiek\", \ 
    \"placeins\", \ 
    \"pdfcol\", \ 
    \"pdfcrop\", \ 
    \"pdflscape\", \ 
    \"pdfpages\", \ 
    \"pdftex\", \ 
    \"pgf\", \ 
    \"ragged2e\", \ 
    \"realboxes\", \ 
    \"setspace\", \ 
    \"tabu\", \ 
    \"tcolorbox\", \ 
    \"tex-gyre-math\", \ 
    \"texlive-scripts\", \ 
    \"threeparttable\", \ 
    \"threeparttablex\", \ 
    \"titling\", \ 
    \"tools\", \ 
    \"trimspaces\", \ 
    \"ulem\", \ 
    \"varwidth\", \ 
    \"wrapfig\", \ 
    \"ulem\", \ 
    \"url\", \ 
    \"xcolor\""

RUN R -q -e "tinytex::tlmgr_conf()" && \
    R -q -e "tinytex::tlmgr_install(pkgs = c(${tiny}))" && \
    R -q -e "tinytex::tlmgr_update()"


USER root
RUN chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.TinyTeX && \
    chmod -R g+w /home/${RSESSION_USER}/.TinyTeX && \
    chmod -R g+wx /home/${RSESSION_USER}/bin
USER ${RSESSION_USER}

# install development packages
ARG github_array="\
    skranz/ReplaceInFiles \
    crsh/citr \
    ropensci/tic"

RUN export pkg="\"$(echo ${github_array} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

# stay with user here (let everything in .virtualenv/r-reticulate be installed by the user)
# we can use pip here, since we added the virtualenv to the beginning of our PATH variable
# install additional python packages
# install datascience packages
ADD ./config/requirements.txt /home/${RSESSION_USER}/
RUN source activate base && uv pip install --system -r /home/${RSESSION_USER}/requirements.txt

# install playwright (revealjs2pdf)
RUN playwright install chromium

# pip install our own stuff
RUN source activate base && uv pip install --system \
    git+https://github.com/miracum/dqa-mdr-connector

# configure the other r packages
# install phantomjs
RUN R -q -e "pak::pkg_install(c(\"webshot\"), lib = \"${R_LIBS_USER}\"); webshot::install_phantomjs()"

# install shinytest dependencies (= phantomjs)
RUN R -q -e "shinytest::installDependencies()"

# to get r jupyter kernel running
RUN R -q -e "IRkernel::installspec()"

# install my packages

# declare arrays to install dev-packages
# ARG github_array="\
#     # kapsner/KhelpeR@development \
#     # kapsner/mlr3learners.lightgbm@development \
#     # miracum/dqa-miracumdqa"

# RUN export pkg="\"$(echo ${github_array} | sed -e 's/ /\"\, \"/g')"\" && \
#     R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
#     rm -rf /tmp/*

# CRAN packages with my participation
ARG pack="autonewsmd \
    sjtable2df \
    kdry \
    rBiasCorrection \
    BiasCorrector \
    mlexperiments \
    mllrnrs \
    mlsurvlrnrs \
    DIZtools \
    DIZutils \
    DQAstats \
    DQAgui"

RUN export pkg="\"$(echo ${pack} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "pak::pkg_install(c($pkg), lib = \"${R_LIBS_USER}\")" && \
    rm -rf /tmp/*

# switch back
USER root

########################

# make deployed shiny app accessible via port 3838
RUN echo "options(shiny.port = 3838)" >> /home/${RSESSION_USER}/.Rprofile && \
    echo "options(shiny.host = \"0.0.0.0\")" >> /home/${RSESSION_USER}/.Rprofile && \
    echo "options(shiny.launch.browser = FALSE)" >> /home/${RSESSION_USER}/.Rprofile && \
    echo "options(shiny.error = browser)" >> /home/${RSESSION_USER}/.Rprofile && \
    echo "options(shiny.fullstacktrace = TRUE)" >> /home/${RSESSION_USER}/.Rprofile && \
    echo "options(warnPartialMatchArgs = TRUE)" >> /home/${RSESSION_USER}/.Rprofile && \
    # https://github.com/Ikuyadeu/vscode-R#r-session-watcher-experimental
    #echo "source(file.path(Sys.getenv(if (.Platform\$OS.type == \"windows\") \"USERPROFILE\" else \"HOME\"), \".vscode-R\", \"init.R\"))" >> /home/${RSESSION_USER}/.Rprofile && \
    chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.Rprofile

# add init folder for rhub profile &
# fix permissions in home folder and /etc/ to allow running the config_env-script
RUN mkdir -p /home/${RSESSION_USER}/.local/share/rhub && \
    chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.local && \
    touch /home/${RSESSION_USER}/.bash_profile && \
    chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.bash_profile && \
    chown -R ${RSESSION_USER}:${RSESSION_USER} /etc/environment && \
    chown -R ${RSESSION_USER}:${RSESSION_USER} /etc/R/Renviron

########################
# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    rm -rf /root/.cache/uv/* && \
    rm -rf /home/${USER}/.cache/uv/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
