FROM rdsc_base:latest

ENV DEBIAN_FRONTEND=noninteractive

USER ${RSESSION_USER}

ARG a="abind \ 
    ada \ 
    adabag \ 
    aplpack \ 
    arm \ 
    arules \ 
    arulesViz"
RUN export pkg="\"$(echo ${a} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

ARG b="badger \
    bayestestR \
    bench \ 
    BH \ 
    bigmemory \ 
    blme \ 
    bookdown \ 
    boot \
    bootstrap \
    brms \ 
    brnn \ 
    bst"
RUN export pkg="\"$(echo ${b} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
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
    coda \
    coin \ 
    compare \
    config \ 
    corpus \ 
    correlation \
    corrplot \ 
    covr \ 
    cowplot \ 
    CPE \ 
    cramer \ 
    curl \ 
    cutpointr \
    CVST"
RUN export pkg="\"$(echo ${c} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

ARG d="d3r \ 
    data.table \ 
    DBI \ 
    deepboost \ 
    desc \ 
    DescrTab2 \
    DescTools \ 
    devtools \ 
    DHARMa \
    DiagrammeR \ 
    dimRed \ 
    discretization \ 
    distrom \ 
    doBy \ 
    doMC \ 
    doParallel \ 
    doRNG \
    dplyr \ 
    DT \ 
    dtplyr \ 
    dunn.test \ 
    dygraphs"
RUN export pkg="\"$(echo ${d} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

ARG e="e1071 \ 
    earth \ 
    easystats \
    effects \ 
    effectsize \
    effsize \ 
    epitools \ 
    exactRankTests"
RUN export pkg="\"$(echo ${e} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

ARG f="factoextra \ 
    fastAdaboost \
    fastshap \ 
    flexclust \ 
    flexdashboard \ 
    flexmix \ 
    flextable \ 
    foreach \ 
    forecast \ 
    foreign \ 
    formatR \ 
    fpc \ 
    future \ 
    future.apply"
RUN export pkg="\"$(echo ${f} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

ARG g="GA \
    gamlr \ 
    gbm \ 
    gclus \ 
    genetics \ 
    ggcorrplot \
    ggfortify \ 
    ggmap \ 
    ggplot2 \ 
    ggpubr \ 
    ggraph \ 
    ggridges \ 
    ggstatsplot \
    git2r \ 
    glmnet \ 
    glmmTMB \
    gplots"
RUN export pkg="\"$(echo ${g} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

ARG h="haplo.stats \ 
    haven \ 
    here \
    hexSticker \
    Hmisc \ 
    httr \ 
    hunspell"
RUN export pkg="\"$(echo ${h} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

ARG i="igraph \ 
    imager \
    influxdbr \ 
    infotheo \ 
    invgamma \
    ipred \ 
    irlba \ 
    irr"
RUN export pkg="\"$(echo ${i} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

ARG j="jpeg \ 
    jsonlite"
RUN export pkg="\"$(echo ${j} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

ARG k="kableExtra \ 
    kernlab \ 
    kknn \ 
    knitr"
RUN export pkg="\"$(echo ${k} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

ARG l="languageserver \
    latticeExtra \ 
    lava \ 
    lda \ 
    ldatuning \ 
    LDAvis \ 
    LiblineaR \
    lightgbm \ 
    lintr \ 
    lm.beta \ 
    lme4 \ 
    lmtest \ 
    lsa \ 
    lubridate"
RUN export pkg="\"$(echo ${l} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
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
    mgcv \
    mlbench \ 
    MLmetrics \ 
    mlr3db \ 
    mlr3learners \
    mlr3measures \ 
    mlr3misc \ 
    mlr3proba \ 
    mlr3verse \ 
    mlr3viz \
    mltools \ 
    modelbased \
    muhaz"
RUN export pkg="\"$(echo ${m} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

ARG n="naivebayes \ 
    neuralnet \ 
    ngramrr \ 
    nlme \ 
    NLP \ 
    nls2 \ 
    nnet \ 
    nnls \ 
    nortest"
RUN export pkg="\"$(echo ${n} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

ARG o="odbc \ 
    officer \ 
    onewaytests \ 
    openNLPdata \ 
    openssl \ 
    openxlsx \ 
    optparse \
    ordinal"
RUN export pkg="\"$(echo ${o} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

ARG p="pagedown \
    parallel \ 
    parameters \
    ParBayesianOptimization \
    party \ 
    partykit \ 
    pbkrtest \ 
    PearsonDS \
    performance \
    PerformanceAnalytics \ 
    plotly \ 
    pls \ 
    plyr \ 
    polynom \ 
    precrec \ 
    pROC \
    processx \ 
    progress \
    profvis \ 
    PRROC \ 
    pspearman \ 
    psych"
RUN export pkg="\"$(echo ${p} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

ARG q="qdap \ 
    qpdf \ 
    quantreg \ 
    quantregForest \
    quarto \
    questionr"
RUN export pkg="\"$(echo ${q} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

ARG r="R.utils \ 
    r2d3 \ 
    R6 \ 
    randomForest \ 
    ranger \ 
    rbokeh \ 
    Rcmdr \ 
    rcmdcheck \ 
    rcompanion \ 
    RConics \ 
    Rcpp \ 
    RcppRoll \ 
    RCurl \ 
    readr \ 
    readstata13 \ 
    readxl \ 
    remotes \ 
    renv \
    ReporteRs \ 
    ReporteRsjars \ 
    reshape2 \ 
    reticulate \ 
    rgenoud \
    rgl \  
    rhub \ 
    R2jags \
    rjags \
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
    rticles \
    rts \ 
    RVAideMemoire \ 
    rversions \ 
    rvest \ 
    rvg"
RUN export pkg="\"$(echo ${r} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

ARG s="see \
    SentimentAnalysis \ 
    sem \ 
    seriation \ 
    shapviz \
    shiny \ 
    shinyalert \
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
    spelling \
    splines \
    splitTools \
    sqldf \  
    stargazer \ 
    styler \ 
    summarytools \ 
    sunburstR \ 
    survival \ 
    survminer \ 
    synthpop \ 
    syuzhet"
RUN export pkg="\"$(echo ${s} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
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
    tiff \
    timeDate \ 
    tm \ 
    tinytex \ 
    topicmodels \ 
    tseries \ 
    twitteR"
RUN export pkg="\"$(echo ${t} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

ARG u="ucminf \ 
    udpipe \ 
    urltools \ 
    usethis \ 
    utf8"
RUN export pkg="\"$(echo ${u} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

ARG v="vegan \ 
    vroom"
RUN export pkg="\"$(echo ${v} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

ARG w="wesanderson \ 
    wordcloud \ 
    wordcloud2"
RUN export pkg="\"$(echo ${w} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

ARG x="xfun \ 
    xgboost \
    XML \ 
    xml2"
RUN export pkg="\"$(echo ${x} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

ARG y="yaml"
RUN export pkg="\"$(echo ${y} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

ARG z="zip \ 
    zoo"
RUN export pkg="\"$(echo ${z} | sed -e 's/ /\"\, \"/g')"\" && \
    R -q -e "vec <- setdiff(c($pkg), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    system(paste0(\"install2.r --error --ncpus -1 \", paste0(vec2, collapse = \" \")))" && \
    rm -rf /tmp/*

# install required LaTeX-Packages
RUN R -q -e "tinytex::install_tinytex()"

ENV PATH="/home/${RSESSION_USER}/bin:/home/${RSESSION_USER}/.TinyTeX/bin/x86_64-linux:${PATH}"

ARG tiny="\"amsfonts\", \ 
    \"amsmath\", \ 
    \"atveryend\", \ 
    \"babel\", \ 
    \"babel-german\", \ 
    \"bookmark\", \ 
    \"caption\", \ 
    \"colortbl\", \ 
    \"dehyph-exptl\", \ 
    \"ec\", \ 
    \"environ\", \ 
    \"epstopdf-pkg\", \ 
    \"float\", \ 
    \"geometry\", \ 
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
    \"multirow\", \ 
    \"needspace\", \ 
    \"oberdiek\", \ 
    \"pdfcrop\", \
    \"pdflscape\", \ 
    \"pdfpages\", \
    \"pgf\", \
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

RUN export packages_format="$(echo $(echo ${allpackages} | sed -e \"s/ /\"\, \"/g\") | sed -e \"s/\"\"/\"/g\")" && \
    R -q -e "vec <- setdiff(c($packages_format), unname(installed.packages()[,\"Package\"])); print(vec); \
    vec2 <- intersect(c(vec), unname(available.packages()[,\"Package\"])); print(vec2); \
    install.packages(pkgs = vec2)"

# update all installed packages
RUN R -q -e "vec <- unname(installed.packages()[,\"Package\"]); remotes::update_packages(packages = vec, upgrade = \"always\")"  && \
    rm -rf /tmp/*

# install development packages
ARG github_array="\
    skranz/ReplaceInFiles,master \
    crsh/citr,master \
    ropensci/tic,main"
    
RUN for repo in ${github_array}; do IFS=",";\ 
    set -- $repo; \
    R -q -e "p <- \"$1\"; remotes::install_github(repo = p, ref = \"$2\", upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

# stay with user here (let everything in .virtualenv/r-reticulate be installed by the user)
# we can use pip here, since we added the virtualenv to the beginning of our PATH variable
# install additional python packages
# install datascience packages
ADD ./config/requirements.txt /home/${RSESSION_USER}/
RUN yes | pip install -r /home/${RSESSION_USER}/requirements.txt

# pip install our own stuff
RUN yes | pip install \
    git+https://github.com/miracum/dqa-mdr-connector \
    git+https://github.com/kapsner/auto-changelog

# configure the other r packages
# install phantomjs
RUN R -q -e "webshot::install_phantomjs()"

# install shinytest dependencies (= phantomjs)
RUN R -q -e "shinytest::installDependencies()"

# install my packages

# CRAN packages with my participation
ARG pack="autonewsmd \
    sjtable2df \
    rBiasCorrection \
    BiasCorrector \
    DIZtools \
    DIZutils \
    DQAstats \
    DQAgui"
RUN for package in $pack; do \   
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*


# declare arrays to install dev-packages
ARG github_array="\
    kapsner/KhelpeR,development \
    kapsner/mlr3learners.lightgbm,development \
    miracum/dqa-miracumdqa,master"
RUN for repo in ${github_array}; do IFS=",";\ 
    set -- $repo; \
    R -q -e "p <- \"$1\"; \
        tryCatch({remotes::install_github(repo = p, ref = \"$2\", upgrade = \"always\")}, error = function(e) {print(e)})"; \
    done && \
    rm -rf /tmp/*

ARG gitlab_array="\
    https://gitlab.miracum.org/kosmic/kosmicgui.git,master"
RUN for repo in ${gitlab_array}; do IFS=",";\ 
    set -- $repo; \
    R -q -e "p <- \"$1\"; \
        tryCatch({remotes::install_git(url = p, ref = \"$2\", upgrade = \"always\")}, error = function(e) {print(e)})"; \
    done && \
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
    echo "source(file.path(Sys.getenv(if (.Platform\$OS.type == \"windows\") \"USERPROFILE\" else \"HOME\"), \".vscode-R\", \"init.R\"))" >> /home/${RSESSION_USER}/.Rprofile && \
    chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.Rprofile

# add PATH to a bash_profile script (workaround so that path is available in rstudio\"s terminal)
# https://support.rstudio.com/hc/en-us/articles/115010737148-Using-the-RStudio-Terminal#env
# https://docs.rstudio.com/ide/server-pro/1.2.1293-1/r-sessions.html
RUN echo "export PATH=${PATH}" >> /home/${RSESSION_USER}/.bash_profile && chmod +x /home/${RSESSION_USER}/.bash_profile

# set PATH for all users
RUN echo "PATH=${PATH}" >> /etc/R/Renviron
RUN echo "PATH=${PATH}" >> /etc/environment

# add radian profile
ADD config/.radian_profile /home/${RSESSION_USER}/.radian_profile
RUN chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.radian_profile

# add rhub profile
RUN mkdir -p /home/${RSESSION_USER}/.local/share/rhub

# fix permissions in home folder
RUN chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.local

########################
# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################

WORKDIR /home/${RSESSION_USER}
