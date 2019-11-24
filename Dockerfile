FROM rocker/verse:3.6.1

# set cran repo
RUN echo "options('repos' = 'https://ftp.fau.de/cran/')" >> /usr/local/lib/R/etc/Rprofile.site

# install required custom system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    byobu \
    curl \
    htop \
    libffi-dev \
    libglu1-mesa-dev \
    libgmp3-dev \
    libgsl-dev \
    libmpfr-dev \
    libxt-dev \
    # xslt package
    libxslt1-dev \
    lmodern \
    locate \
    nano \
    net-tools \
    pandoc \
    pandoc-citeproc \
    python3-dev \
    python3-pip \
    python3-venv \
    # dependencies for aplpack
    tcl8.6-dev \
    tk8.6-dev \
    traceroute

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
    acepack \ 
    ada \ 
    adabag \ 
    ade4 \ 
    aplpack \ 
    arm \ 
    arules \ 
    arulesViz \ 
    assertthat"
RUN for package in $a; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG b="backports \ 
    base \
    base64enc \ 
    bayesplot \ 
    BBmisc \
    bench \ 
    BH \ 
    bibtex \ 
    bigmemory \ 
    bigmemory.sri \ 
    bindr \ 
    bindrcpp \ 
    BiocManager \
    bit \ 
    bit64 \ 
    bitops \ 
    blme \ 
    blob \ 
    bmp \ 
    boot \ 
    brew \ 
    bridgesampling \ 
    brms \ 
    brnn \ 
    Brobdingnag \ 
    broom \ 
    BSDA \ 
    bst"
RUN for package in $b; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG c="C50 \ 
    callr \ 
    car \ 
    carData \ 
    caret \ 
    caretEnsemble \ 
    caTools \ 
    cellranger \ 
    checkmate \ 
    chron \ 
    Ckmeans.1d.dp \ 
    class \ 
    cli \ 
    clipr \ 
    clisymbols \ 
    cluster \ 
    ClusterR \
    cmprsk \ 
    coda \ 
    codetools \ 
    coin \ 
    colorspace \ 
    colourpicker \ 
    combinat \ 
    commonmark \ 
    compiler \
    config \ 
    corpcor \ 
    corpus \
    corrplot \ 
    covr \ 
    cowplot \ 
    CPE \ 
    cramer \ 
    crayon \ 
    crosstalk \ 
    Cubist \ 
    curl \ 
    CVST"
RUN for package in $c; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG d="data.table \ 
    DatabaseConnector \ 
    DatabaseConnectorJars \ 
    datasets \
    DBI \ 
    dbplyr \ 
    ddalpha \ 
    debugme \ 
    deepboost \ 
    dendextend \ 
    DEoptimR \ 
    desc \ 
    DescTools \ 
    deSolve \ 
    devtools \ 
    DiagrammeR \ 
    dichromat \ 
    digest \ 
    dimRed \ 
    diptest \ 
    discretization \ 
    distrom \ 
    DMwR \ 
    doBy \ 
    doMC \ 
    doParallel \ 
    downloader \ 
    dplyr \ 
    DRR \ 
    DT \ 
    dtt \ 
    dtplyr \ 
    dunn.test \ 
    dygraphs"
RUN for package in $d; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG e="e1071 \ 
    earth \ 
    effects \ 
    effsize \ 
    ellipse \ 
    emmeans \ 
    EMT \ 
    epitools \ 
    estimability \ 
    evaluate \ 
    exactRankTests \ 
    expm"
RUN for package in $e; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG f="factoextra \
    FactoMineR \ 
    fansi \ 
    fastAdaboost \ 
    fastmatch \ 
    feather \ 
    ff \ 
    ffbase \ 
    flashClust \ 
    flexclust \
    flexmix \ 
    forcats \ 
    foreach \ 
    forecast \
    foreign \ 
    forge \ 
    formatR \ 
    Formula \ 
    fpc \ 
    fs \ 
    futile.logger \ 
    futile.options"
RUN for package in $f; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG g="GA \
    gamlr \ 
    gbm \ 
    gclus \ 
    gdata \ 
    gdtools \ 
    GeneralizedHyperbolic \
    generics \ 
    genetics \ 
    geometry \ 
    GGally \
    ggeffects \ 
    ggfortify \ 
    ggmap \
    ggplot2 \ 
    ggpubr \ 
    ggrepel \ 
    ggridges \ 
    ggsci \ 
    ggsignif \ 
    gh \ 
    gistr \ 
    git2r \ 
    glmmTMB \ 
    glmnet \ 
    glue \ 
    gmailr \ 
    gmp \ 
    gower \ 
    GPArotation \ 
    gplots \ 
    graphics \
    grDevices \
    grid \
    gridBase \ 
    gridExtra \ 
    gsubfn \ 
    gtable \ 
    gtools"
RUN for package in $g; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG h="h2o \ 
    h2oEnsemble \ 
    haplo.stats \ 
    haven \ 
    hermite \ 
    hexbin \ 
    highr \ 
    Hmisc \ 
    hms \ 
    htmltab \ 
    htmlTable \ 
    htmltools \ 
    htmlwidgets \ 
    httpuv \ 
    httr \ 
    hunspell"
RUN for package in $h; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG i="igraph \ 
    influenceR \ 
    infotheo \ 
    ini \ 
    inline \ 
    inum \ 
    ipred \ 
    IRdisplay \ 
    IRkernel \ 
    irlba \ 
    irr \ 
    iterators"
RUN for package in $i; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG j="jpeg \ 
    jsonlite"
RUN for package in $j; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG k="kableExtra \ 
    keras \ 
    kernlab \ 
    KernSmooth \ 
    kknn \
    km.ci \ 
    KMsurv \ 
    knitr"
RUN for package in $k; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG l="labeling \ 
    lambda.r \ 
    lars \ 
    lasso2 \ 
    later \ 
    lattice \ 
    latticeExtra \ 
    lava \ 
    lazyeval \ 
    lda \ 
    ldatuning \ 
    LDAvis \ 
    leaps \ 
    lhs \
    libcoin \ 
    LiblineaR \ 
    lintr \ 
    lm.beta \ 
    lme4 \ 
    lmtest \ 
    loo \ 
    lpSolve \ 
    lsa \ 
    lubridate"
RUN for package in $l; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG m="magic \ 
    magrittr \ 
    manipulate \ 
    manipulateWidget \ 
    maps \ 
    maptools \ 
    markdown \ 
    MASS \ 
    Matrix \ 
    matrixcalc \ 
    MatrixModels \ 
    matrixStats \ 
    maxLik \ 
    maxstat \ 
    mboost \ 
    mc2d \ 
    mclust \ 
    mcmc \ 
    MCMCpack \ 
    memoise \ 
    merTools \ 
    methods \
    mgcv \ 
    mi \ 
    microbenchmark \
    mime \ 
    miniUI \ 
    minqa \ 
    miscTools \ 
    mixOmics \ 
    mlapi \ 
    mlbench \ 
    MLmetrics \ 
    mlr \ 
    mlr3 \
    mlr3db \
    mlr3filters \
    mlr3learners \
    mlr3tuning \
    mltools \ 
    mnormt \ 
    ModelMetrics \ 
    modelr \ 
    modeltools \ 
    moments \ 
    mongolite \ 
    mstate \ 
    muhaz \ 
    multcomp \ 
    multcompView \ 
    munsell \ 
    mvtnorm"
RUN for package in $m; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG n="naivebayes \ 
    neuralnet \ 
    ngramrr \ 
    nleqslv \ 
    nlme \ 
    nloptr \ 
    NLP \ 
    nls2 \
    NMF \ 
    nnet \ 
    nnls \ 
    nortest \ 
    numDeriv"
RUN for package in $n; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG o="OAIHarvester \ 
    odbc \ 
    officer \ 
    onewaytests \ 
    openNLPdata \ 
    openssl \ 
    openxlsx \ 
    optparse \
    ordinal"
RUN for package in $o; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG p="packrat \ 
    pander \ 
    parallel \
    parallelMap \ 
    ParamHelpers \ 
    party \ 
    partykit \ 
    pbapply \ 
    pbdZMQ \ 
    pbkrtest \ 
    PBSmodelling \ 
    PerformanceAnalytics \
    permute \ 
    pillar \ 
    pkgbuild \ 
    pkgconfig \ 
    pkgload \ 
    pkgmaker \ 
    PKI \ 
    plogr \ 
    plotly \ 
    plotmo \ 
    plotrix \ 
    pls \ 
    plyr \ 
    pmml \ 
    polspline \ 
    polynom \ 
    prabclus \ 
    praise \
    praznik \ 
    precrec \
    prediction \ 
    prettyunits \ 
    pROC \
    processx \ 
    prodlim \ 
    profvis \ 
    progress \ 
    promises \ 
    proto \ 
    proxy \ 
    PRROC \ 
    pryr \ 
    ps \ 
    pscl \ 
    pspearman \ 
    psych \ 
    purrr \ 
    pwr"
RUN for package in $p; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG q="qap \ 
    qdapDictionaries \ 
    qpdf \
    quadprog \ 
    quantmod \ 
    quantreg \ 
    quantregForest \
    questionr"
RUN for package in $q; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG r="R.methodsS3 \ 
    R.oo \ 
    R.utils \ 
    r2d3 \ 
    R6 \ 
    randomForest \ 
    ranger \
    rappdirs \ 
    rapportools \ 
    rARPACK \ 
    rbokeh \ 
    rcmdcheck \ 
    Rcmdr \ 
    RColorBrewer \ 
    rcompanion \ 
    RConics \ 
    Rcpp \ 
    RcppEigen \ 
    RcppParallel \ 
    RcppRoll \ 
    RCurl \ 
    readr \ 
    readstata13 \ 
    readxl \ 
    recipes \ 
    REdaS \ 
    registry \ 
    relimp \ 
    rematch \ 
    remotes \ 
    ReporteRs \ 
    ReporteRsjars \ 
    repr \ 
    reprex \ 
    reshape \ 
    reshape2 \ 
    ResourceSelection \ 
    reticulate \ 
    rex \ 
    rgenoud \ 
    rgexf \ 
    rgl \ 
    rio \ 
    rJava \ 
    RJDBC \ 
    rjson \ 
    RJSONIO \ 
    rlang \ 
    rmarkdown \ 
    Rmpfr \ 
    rms \ 
    rngtools \ 
    rnn \ 
    robustbase \ 
    ROCR \ 
    Rook \ 
    ROSE \ 
    roxygen2 \ 
    rpart \ 
    RPostgres \
    RPostgreSQL \ 
    rprojroot \ 
    rsconnect \ 
    rsdmx \
    RSpectra \ 
    RSQLite \ 
    rstan \ 
    rstantools \ 
    rstudioapi \ 
    RVAideMemoire \ 
    rversions \ 
    rvest \ 
    rvg"
RUN for package in $r; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG s="sandwich \ 
    scales \ 
    scatterplot3d \ 
    sciplot \ 
    selectr \ 
    sem \ 
    seriation \ 
    sessioninfo \ 
    sfsmisc \ 
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
    slam \ 
    smbinning \ 
    snakecase \ 
    snow \ 
    SnowballC \ 
    snowfall \ 
    sourcetools \ 
    sp \ 
    sparklyr \ 
    SparseM \ 
    sparsepp \ 
    spatial \ 
    spikeslab \ 
    splines \
    sqldf \ 
    SqlRender \ 
    SQUAREM \ 
    stabs \ 
    StanHeaders \ 
    stargazer \ 
    stats \ 
    stats4 \ 
    stringdist \ 
    stringi \ 
    stringr \ 
    strucchange \ 
    styler \
    summarytools \ 
    survey \ 
    survival \ 
    survminer \ 
    survMisc \ 
    svglite \
    synthpop \
    syuzhet"
RUN for package in $s; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG t="tau \ 
    tcltk \
    tcltk2 \ 
    TeachingDemos \ 
    tensorflow \ 
    testthat \ 
    text2vec \ 
    textstem \
    textir \ 
    textshape \ 
    tfdatasets \ 
    tfruns \ 
    TH.data \ 
    threejs \ 
    tibble \ 
    tidyr \ 
    tidyselect \ 
    tidyverse \ 
    timeDate \ 
    tm \ 
    TMB \ 
    tinytex \
    tokenizers \ 
    tools \
    topicmodels \ 
    triebeard \ 
    trimcluster \ 
    tseries \
    TSP \ 
    TTR \ 
    twitteR"
RUN for package in $t; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG u="ucminf \ 
    udpipe \ 
    urltools \ 
    usethis \ 
    utf8 \ 
    utils \
    uuid"
RUN for package in $u; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG v="vcd \ 
    vegan \ 
    viridis \ 
    viridisLite \ 
    visNetwork"
RUN for package in $v; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG w="webshot \ 
    wesanderson \
    whisker \ 
    withr \ 
    wordcloud \ 
    wordcloud2 \ 
    WRS2"
RUN for package in $w; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG x="xfun \ 
    xgboost \ 
    XML \ 
    xml2 \ 
    xopen \ 
    xtable \ 
    xts"
RUN for package in $x; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG y="yaml"
RUN for package in $y; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done

ARG z="zeallot \ 
    zip \ 
    zoo"
RUN for package in $z; do \   
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done


# download and compile lightgbm (not yet on CRAN) # https://github.com/Microsoft/LightGBM/tree/master/R-package
RUN git clone --recursive https://github.com/Microsoft/LightGBM && \
    cd LightGBM && \
    Rscript build_r.R
#RUN R -e "devtools::install_github('Microsoft/LightGBM', subdir = 'R-package')"

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
    tabu \
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
RUN R -q -e "vec <- unname(installed.packages()[,\"Package\"]); remotes::update_packages(packages = vec, upgrade = \"always\")"

# install Bioconductorstuff
RUN R -q -e "BiocManager::install('affy')"
RUN R -q -e "BiocManager::install('Biobase')"
RUN R -q -e "BiocManager::install('clusterProfiler')"
RUN R -q -e "BiocManager::install('gcrma')"
RUN R -q -e "BiocManager::install('GEOquery')"
RUN R -q -e "BiocManager::install('GO.db')"
RUN R -q -e "BiocManager::install('gPCA')"
RUN R -q -e "BiocManager::install('hgu133plus2cdf')"
RUN R -q -e "BiocManager::install('hgu133plus2probe')"
RUN R -q -e "BiocManager::install('impute')"
RUN R -q -e "BiocManager::install('org.Hs.eg.db')"
RUN R -q -e "BiocManager::install('pathfindR')"
RUN R -q -e "BiocManager::install('pathview')"
RUN R -q -e "BiocManager::install('sva')"

# install development packages
RUN R -q -e "devtools::install_github(repo = 'coolbutuseless/ggdebug', ref = 'master')"
RUN R -q -e "devtools::install_github(repo = 'mlr-org/mlr3book', ref = 'master')"
RUN R -q -e "devtools::install_github(repo = 'mlr-org/mlr3ordinal', ref = 'master')"
RUN R -q -e "devtools::install_github(repo = 'mlr-org/mlr3survival', ref = 'master')"
RUN R -q -e "devtools::install_github(repo = 'mlr-org/mlr3viz', ref = 'master')"
RUN R -q -e "devtools::install_github(repo = 'skranz/ReplaceInFiles', ref = 'master')"

# install some python packages
# install pip requirements
# virtualenv is required for install_keras
RUN yes | pip3 install \
    setuptools \
    wheel \
    virtualenv

# workaround, to get stuff properly installed in users home dir
# set rstudio user here
ENV RSTUDIO_USER="rstudio" 

# add user + password
# https://s/home/${RSTUDIO_USER}/.virtualenvs/r-reticulate/bin/tackoverflow.com/questions/2150882/how-to-automatically-add-user-account-and-password-with-a-bash-script
#RUN useradd -ms /bin/bash ${RSTUDIO_USER} # rstudio user already exists
RUN echo ${RSTUDIO_USER}:password | chpasswd 

# switch user
USER ${RSTUDIO_USER}

# install keras (when pip3 virtualenv is already installed)
RUN R -q -e "keras::install_keras()"

# configure python
RUN R -q -e "reticulate::py_config()"

# switch back
USER root

# we can now add add the virtualenv python to PATH (on first place)
# add newly installed dependencies to PATH
ENV PATH="/home/${RSTUDIO_USER}/bin:${PATH}"
ENV PATH="/home/${RSTUDIO_USER}/.virtualenvs/r-reticulate/bin:${PATH}"

# add PATH to a profile script (workaround so that path is available in rstudio's terminal)
RUN echo "export PATH=${PATH}" > /home/${RSTUDIO_USER}/.profile && chmod +x /home/${RSTUDIO_USER}/.profile

# Add RETICULATE_PYTHON variable to Renviron
# current ${R_HOME} = /usr/local/lib/R
RUN echo "export RETICULATE_PYTHON=/home/${RSTUDIO_USER}/.virtualenvs/r-reticulate/bin/python" >> /usr/local/lib/R/etc/Renviron
# set PATH for all users
RUN echo "PATH=${PATH}" > /etc/environment

# switch user (let everything in .virtualenv/r-reticulate be installed by the user)
# we can use pip3 here, since we added the virtualenv to the beginning of our PATH variable
USER ${RSTUDIO_USER}

# now install other python packages
RUN yes | pip3 install \
    catboost \
    "colorama>=0.3.8" \
    cython

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
    pandas

RUN yes | pip3 install \
    scikit-learn \
    scipy

# configure the other r packages
# install phantomjs
RUN R -q -e "webshot::install_phantomjs()"

# install shinytest dependencies (= phantomjs)
RUN R -q -e "shinytest::installDependencies()"

# switch back
USER root

# make deployed shiny app accessible via port 3838
RUN echo "options(shiny.port = 3838)" >> /etc/R/Rprofile.site && \
    echo "options(shiny.host = '0.0.0.0')" >> /etc/R/Rprofile.site && \
    echo "options(shiny.launch.browser = FALSE)" >> /etc/R/Rprofile.site 

# install my own stuff
RUN R -q -e "devtools::install_github(repo = 'kapsner/KhelpeR', ref = 'latest')"
RUN R -q -e "devtools::install_github(repo = 'kapsner/rBiasCorrection', ref = 'latest')"
RUN R -q -e "devtools::install_github(repo = 'kapsner/BiasCorrector', ref = 'latest')"
RUN R -q -e "devtools::install_github(repo = 'kapsner/expenditR', ref = 'master')"
#RUN R -q -e "devtools::install_git(url = 'https://gitlab.miracum.org/miracum-dqa/dqastats.git', ref = 'master')"
RUN R -q -e "devtools::install_git(url = 'https://gitlab.miracum.org/miracum-dqa/dqagui.git', ref = 'master')"
RUN R -q -e "devtools::install_git(url = 'https://gitlab.miracum.org/miracum-dqa/miRacumDQA.git', ref = 'master')"
RUN R -q -e "devtools::install_git(url = 'https://gitlab.miracum.org/clearly/sigident.git', ref = 'master')"
RUN R -q -e "devtools::install_git(url = 'https://gitlab.miracum.org/kosmic/kosmicgui.git', ref = 'master')"

# clear caches
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /home/${RSTUDIO_USER}/.cache/pip/*
RUN apt-get clean && apt-get autoclean && apt-get autoremove

# add custom RStudio theme ("Dracula")
ADD volume/user-settings /home/${RSTUDIO_USER}/.rstudio/monitored/user-settings/
RUN chown -R ${RSTUDIO_USER}:${RSTUDIO_USER} /home/${RSTUDIO_USER}/.rstudio && \
    chmod 644 /home/${RSTUDIO_USER}/.rstudio/monitored/user-settings/user-settings
