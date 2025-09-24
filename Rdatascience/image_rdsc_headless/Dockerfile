FROM rdsc_base:latest

ENV DEBIAN_FRONTEND=noninteractive

USER ${RSESSION_USER}

ARG a="abind \ 
    arm \ 
    arules"
RUN export pkg="\"$(echo ${a} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
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
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

ARG c="C50 \ 
    car \ 
    carData \ 
    caret \ 
    checkhelper \
    citr \
    class \ 
    clipr \ 
    cluster \ 
    coda \
    coin \ 
    compare \
    config \ 
    corpus \ 
    correlation \
    corrplot \ 
    covr \ 
    cowplot \ 
    cramer \ 
    curl \ 
    cutpointr"
RUN export pkg="\"$(echo ${c} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

ARG d="data.table \ 
    DBI \ 
    desc \ 
    DescrTab2 \
    deSolve \
    devtools \ 
    diffviewer \
    DHARMa \
    DiagrammeR \ 
    discretization \ 
    doMC \
    doParallel \ 
    doRNG \
    dplyr \ 
    DT \ 
    dtplyr \ 
    dunn.test"
RUN export pkg="\"$(echo ${d} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

ARG e="e1071 \ 
    easyPubMed \
    easystats \
    effects \ 
    effectsize \
    effsize \ 
    epitools"
RUN export pkg="\"$(echo ${e} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
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
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
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
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

ARG h="haven \ 
    here \
    hexSticker \
    Hmisc \ 
    httr \ 
    hunspell"
RUN export pkg="\"$(echo ${h} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

ARG i="igraph \ 
    imager \
    influxdbr \ 
    invgamma \
    IRkernel \
    irr"
RUN export pkg="\"$(echo ${i} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

ARG j="jpeg \ 
    jsonlite"
RUN export pkg="\"$(echo ${j} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

ARG k="kableExtra \ 
    kernelshap \
    kernlab \ 
    kknn \ 
    knitr"
RUN export pkg="\"$(echo ${k} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

ARG l="languageserver \
    latticeExtra \ 
    lava \ 
    lda \ 
    ldatuning \ 
    lightgbm \ 
    lintr \ 
    lgrdata \
    lme4 \ 
    lmtest \ 
    lsa \ 
    lubridate"
RUN export pkg="\"$(echo ${l} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

ARG m="manipulate \ 
    manipulateWidget \ 
    maps \ 
    maptools \ 
    markdown \ 
    MASS \ 
    Matrix \ 
    MCMCpack \ 
    merTools \ 
    mice \
    microbenchmark \ 
    mgcv \
    mlbench \ 
    MLmetrics \ 
    measures \
    mltools \ 
    modelbased \
    muhaz"
RUN export pkg="\"$(echo ${m} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

ARG n="naivebayes \ 
    neuralnet \ 
    ngramrr \ 
    nlme \ 
    NLP \ 
    nls2 \ 
    nnet \ 
    nnls"
RUN export pkg="\"$(echo ${n} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

ARG o="odbc \ 
    officer \ 
    onewaytests \ 
    openssl \ 
    openxlsx \ 
    optparse \
    ordinal"
RUN export pkg="\"$(echo ${o} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

ARG p="pagedown \
    pak \
    parallel \ 
    parameters \
    ParBayesianOptimization \
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
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

ARG q="qpdf \ 
    quantreg \ 
    quantregForest \
    quantmod \
    quarto"
RUN export pkg="\"$(echo ${q} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

ARG r="R6 \ 
    randomForest \ 
    ranger \ 
    rcmdcheck \ 
    Rcpp \ 
    RCurl \ 
    readr \ 
    remotes \ 
    renv \
    reticulate \ 
    rhub \ 
    R2jags \
    rjags \
    rJava \ 
    RJDBC \ 
    rlang \ 
    rmarkdown \ 
    rms \ 
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
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
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
    survminer \ 
    synthpop \ 
    syuzhet"
RUN export pkg="\"$(echo ${s} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

ARG t="tau \ 
    testthat \ 
    text2vec \ 
    textstem \ 
    tibble \ 
    tidyr \ 
    tidymodels \ 
    tidyselect \ 
    tidyverse \ 
    tinyplot \
    tiff \
    tm \ 
    tinytex \ 
    topicmodels \ 
    treeshap \
    tseries \ 
    twitteR"
RUN export pkg="\"$(echo ${t} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

ARG u="udpipe \ 
    urltools \ 
    usethis \ 
    utf8"
RUN export pkg="\"$(echo ${u} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

ARG v="vroom"
RUN export pkg="\"$(echo ${v} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

ARG w="wesanderson \ 
    wordcloud \ 
    wordcloud2"
RUN export pkg="\"$(echo ${w} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

ARG x="xfun \ 
    xgboost \
    XML \ 
    xml2"
RUN export pkg="\"$(echo ${x} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

ARG y="yaml"
RUN export pkg="\"$(echo ${y} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

ARG z="zip \ 
    zoo"
RUN export pkg="\"$(echo ${z} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

# install required LaTeX-Packages
RUN echo "tinytex::install_tinytex()" | r

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

RUN echo "tinytex::tlmgr_conf()" | r && \
    echo "tinytex::tlmgr_install(pkgs = c(${tiny}))" | r && \
    echo "tinytex::tlmgr_update()" | r


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

RUN export packages_format="$(echo $(echo ${allpackages} | sed -e \"s/ /\"\, \"/g\") | sed -e \"s/\"\"/\"/g\")" && \
    export install_pkg=$(echo "vec <- setdiff(c($packages_format), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r --skipinstalled --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

# update all installed packages
RUN echo "vec <- unname(installed.packages()[,'Package']); \
    remotes::update_packages(packages = vec, upgrade = 'always')" | r && \
    rm -rf /tmp/*

# install development packages
ARG github_array="\
    skranz/ReplaceInFiles \
    crsh/citr \
    ropensci/tic"

RUN export pkg="\"$(echo ${github_array} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- c($pkg); cat(vec)" | r) && \
    installGithub.r $install_pkg && \
    rm -rf /tmp/*

# stay with user here (let everything in .virtualenv/r-reticulate be installed by the user)
# we can use pip here, since we added the virtualenv to the beginning of our PATH variable
# install additional python packages
# install datascience packages
ADD ./config/requirements.txt /home/${RSESSION_USER}/
RUN yes | pip install -r /home/${RSESSION_USER}/requirements.txt

# install playwright (revealjs2pdf)
RUN playwright install chromium

# pip install our own stuff
RUN yes | pip install \
    git+https://github.com/miracum/dqa-mdr-connector

# configure the other r packages
# install phantomjs
RUN echo "webshot::install_phantomjs()" | r

# install shinytest dependencies (= phantomjs)
RUN echo "shinytest::installDependencies()" | r

# to get r jupyter kernel running
RUN echo "IRkernel::installspec()" | r

# install my packages

# declare arrays to install dev-packages
ARG github_array="\
    # kapsner/KhelpeR@development \
    # kapsner/mlr3learners.lightgbm@development \
    miracum/dqa-miracumdqa"

RUN export pkg="\"$(echo ${github_array} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- c($pkg); cat(vec)" | r) && \
    installGithub.r $install_pkg && \
    rm -rf /tmp/*

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
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); \
    vec2 <- intersect(c(vec), unname(available.packages()[,'Package'])); cat(vec2)" | r) && \
    install2.r $install_pkg && \
    rm -rf /tmp/*

# switch back
USER root

########################
# install sudo here, required for cifs-utils and mounting network drives
RUN apt-get update && apt-get install -y --no-install-recommends \
    cifs-utils \
    sudo
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# set ubuntu password here (password required for rstudio login)
RUN echo ${RSESSION_USER}:password | chpasswd 
RUN echo ${RSESSION_USER} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${RSESSION_USER} && \
    chmod 0440 /etc/sudoers.d/${RSESSION_USER}

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

# add radian profile, init folder for rhub profile &
# fix permissions in home folder and /etc/ to allow running the config_env-script
ADD config/.radian_profile /home/${RSESSION_USER}/.radian_profile
RUN chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.radian_profile
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
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################

# add config_env.sh script
ADD config/config_env.sh /
RUN chmod +x /config_env.sh

USER ${RSESSION_USER}

WORKDIR /home/${RSESSION_USER}

# entrypoint
ENTRYPOINT bash -c "/config_env.sh && tail -f /dev/null"
