FROM r_base_image:latest

ENV R_REPO="https://ftp.fau.de/cran/"

# Update where R expects to find various Java files
RUN R CMD javareconf

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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    ggeffects \ 
    ggfortify \ 
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG j="jpeg \ 
    jsonlite"
RUN for package in $j; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG k="kableExtra \ 
    keras \ 
    kernlab \ 
    KernSmooth \ 
    km.ci \ 
    KMsurv \ 
    knitr"
RUN for package in $k; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    synthpop \
    syuzhet"
RUN for package in $s; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG u="ucminf \ 
    udpipe \ 
    urltools \ 
    usethis \ 
    utf8 \ 
    utils \
    uuid"
RUN for package in $u; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG v="vcd \ 
    vegan \ 
    viridis \ 
    viridisLite \ 
    visNetwork"
RUN for package in $v; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG w="webshot \ 
    wesanderson \
    whisker \ 
    withr \ 
    wordcloud \ 
    wordcloud2 \ 
    WRS2"
RUN for package in $w; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG x="xfun \ 
    xgboost \ 
    XML \ 
    xml2 \ 
    xopen \ 
    xtable \ 
    xts"
RUN for package in $x; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG y="yaml"
RUN for package in $y; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG z="zeallot \ 
    zip \ 
    zoo"
RUN for package in $z; do \   
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"${R_REPO}\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done


# download and compile lightgbm (not yet on CRAN) # https://github.com/Microsoft/LightGBM/tree/master/R-package
RUN git clone --recursive https://github.com/Microsoft/LightGBM && \
    cd LightGBM && \
    Rscript build_r.R
#RUN R -e "devtools::install_github('Microsoft/LightGBM', subdir = 'R-package')"


# for tinytex, change user to make it available for current RStudio-Sever-User
USER user 
RUN R -q -e 'tinytex::install_tinytex()' 
# switch back for other users
USER root

# install required LaTeX-Packages
RUN ./home/user/.TinyTeX/bin/x86_64-linux/tlmgr update --self
RUN ./home/user/.TinyTeX/bin/x86_64-linux/tlmgr update --self
RUN ./home/user/.TinyTeX/bin/x86_64-linux/tlmgr install \
    multirow \
    xcolor \
    colortbl \
    wrapfig \
    float \
    tabu \
    varwidth \
    threeparttable \
    threeparttablex \
    environ \
    trimspaces \
    ulem \
    makecell \
    babel \
    babel-german \
    hyphen-german \
    lm \
    hyperref \
    url \
    graphics-def \
    titling \
    caption \
    amsmath \
    amsfonts \
    tools \
    oberdiek \
    graphics \
    latex-graphics-dev \
    geometry \
    ec \
    ifxetex \
    ifluatex

# add TeX-installation to R_ENVIRON Path
RUN echo "PATH=/home/user/bin:${PATH}" >> /etc/R/Renviron.site 
ENV PATH="/home/user/bin:${PATH}"

# install phantomjs
USER user 
RUN R -q -e 'webshot::install_phantomjs()'
USER root

# make deployed shiny app accessible via port 3838
RUN echo "options(shiny.port = 3838)" >> /etc/R/Rprofile.site && \
    echo "options(shiny.host = '0.0.0.0')" >> /etc/R/Rprofile.site && \
    echo "options(shiny.launch.browser = FALSE)" >> /etc/R/Rprofile.site 

# safety-check at the end: 
# 1) look if everything is installed correctely (if not, you might add system-dependencies in the base_image)
# 2) update all packages to the newest version
# 3) start rstudio-server
ARG allpackages="\"$a\" \"$b\" \"$c\" \"$d\" \"$e\" \"$f\" \"$g\" \"$h\" \
    \"$i\" \"$j\" \"$k\" \"$l\" \"$m\" \"$n\" \"$o\" \"$p\" \"$q\" \"$r\" \
    \"$s\" \"$t\" \"$u\" \"$v\" \"$w\" \"$x\" \"$y\" \"$z\""

RUN export packages_format="$(echo $(echo ${allpackages} | sed -e 's/ /\"\, \"/g') | sed -e 's/\"\"/\"/g')" && \
    R -q -e "vec <- setdiff(c($packages_format), unname(installed.packages()[,\"Package\"])); print(vec); if (length(vec) != 0){; for (i in vec){; cat(\"Installing required package: \", i, \"\n\n\"); install.packages(i, repos = \"${R_REPO}\", quiet=T); };}" && \
    R -q -e "update.packages(ask=F, repos = \"${R_REPO}\", quiet=T)"

# install some python packages
# install pip requirements
RUN yes | pip3 install \
    setuptools \
    wheel \
    virtualenv

RUN yes | pip3 install \
    catboost \
    "colorama>=0.3.8" \
    cython

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

# install keras (when pip3 virtualenv is already installed)
USER user
RUN R -q -e 'keras::install_keras()' 
USER root

# install Bioconductorstuff
RUN R -q -e "BiocManager::install('Biobase')"
RUN R -q -e "BiocManager::install('gPCA')"
RUN R -q -e "BiocManager::install('sva')"
RUN R -q -e "BiocManager::install('GEOquery')"
RUN R -q -e "BiocManager::install('impute')"
RUN R -q -e "BiocManager::install('affy')"
RUN R -q -e "BiocManager::install('gcrma')"
RUN R -q -e "BiocManager::install('hgu133plus2cdf')"
RUN R -q -e "BiocManager::install('GO.db')"
RUN R -q -e "BiocManager::install('org.Hs.eg.db')"
RUN R -q -e "BiocManager::install('clusterProfiler')"
RUN R -q -e "BiocManager::install('pathview')"
RUN R -q -e "BiocManager::install('pathfindR')"
RUN R -q -e "BiocManager::install('hgu133plus2probe')"

# install development packages
RUN R -q -e "devtools::install_github('coolbutuseless/ggdebug')"
RUN R -q -e "devtools::install_github('skranz/ReplaceInFiles')"

# install my own stuff
RUN R -q -e "devtools::install_github('kapsner/KhelpeR@latest')"
RUN R -q -e "devtools::install_github('kapsner/rBiasCorrection@latest')"
#RUN R -q -e "devtools::install_github('kapsner/BiasCorrector@latest')"
RUN R -q -e "devtools::install_github('kapsner/expenditR')"
RUN R -q -e "devtools::install_git('https://gitlab.miracum.org/miracum-dqa/dqastats.git')"
RUN R -q -e "devtools::install_git('https://gitlab.miracum.org/miracum-dqa/dqagui.git')"
RUN R -q -e "devtools::install_git('https://gitlab.miracum.org/miracum-dqa/miRacumDQA.git')"
RUN R -q -e "devtools::install_git('https://gitlab.miracum.org/clearly/sigident.git')"
RUN R -q -e "devtools::install_git('https://gitlab.miracum.org/kosmic/kosmicgui.git')"

# entrypoint
ENTRYPOINT rstudio-server start && tail -f /dev/null
