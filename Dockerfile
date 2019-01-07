FROM r_base_image:latest

# RUN R -q -e 'install.packages(c("base"), repos = "https://ftp.fau.de/cran/", quiet=T)'                 # default installation
# RUN R -q -e 'install.packages(c("compiler"), repos = "https://ftp.fau.de/cran/", quiet=T)'                 # default installation
# RUN R -q -e 'install.packages(c("datasets"), repos = "https://ftp.fau.de/cran/", quiet=T)'                 # default installation
# RUN R -q -e 'install.packages(c("graphics"), repos = "https://ftp.fau.de/cran/", quiet=T)'                 # default installation
# RUN R -q -e 'install.packages(c("grDevices"), repos = "https://ftp.fau.de/cran/", quiet=T)'                 # default installation
# RUN R -q -e 'install.packages(c("grid"), repos = "https://ftp.fau.de/cran/", quiet=T)'                 # default installation
# RUN R -q -e 'install.packages(c("methods"), repos = "https://ftp.fau.de/cran/", quiet=T)'                 # default installation
# RUN R -q -e 'install.packages(c("parallel"), repos = "https://ftp.fau.de/cran/", quiet=T)'                 # default installation
# RUN R -q -e 'install.packages(c("splines"), repos = "https://ftp.fau.de/cran/", quiet=T)'                 # default installation
# RUN R -q -e 'install.packages(c("stats"), repos = "https://ftp.fau.de/cran/", quiet=T)'                 # default installation
# RUN R -q -e 'install.packages(c("stats4"), repos = "https://ftp.fau.de/cran/", quiet=T)'                 # default installation
# RUN R -q -e 'install.packages(c("tcltk"), repos = "https://ftp.fau.de/cran/", quiet=T)'                 # default installation
# RUN R -q -e 'install.packages(c("tools"), repos = "https://ftp.fau.de/cran/", quiet=T)'                 # default installation
# RUN R -q -e 'install.packages(c("utils"), repos = "https://ftp.fau.de/cran/", quiet=T)'                 # default installation

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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG b="backports \ 
    base64enc \ 
    bayesplot \ 
    BBmisc \ 
    BH \ 
    bibtex \ 
    bigmemory \ 
    bigmemory.sri \ 
    bindr \ 
    bindrcpp \ 
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    cmprsk \ 
    coda \ 
    codetools \ 
    coin \ 
    colorspace \ 
    colourpicker \ 
    combinat \ 
    commonmark \ 
    config \ 
    corpcor \ 
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG d="data.table \ 
    DatabaseConnector \ 
    DatabaseConnectorJars \ 
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
    dunn.test \ 
    dygraphs"
RUN for package in $d; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG f="FactoMineR \ 
    fansi \ 
    fastAdaboost \ 
    fastmatch \ 
    feather \ 
    ff \ 
    ffbase \ 
    flashClust \ 
    flexmix \ 
    forcats \ 
    foreach \ 
    foreign \ 
    forge \ 
    formatR \ 
    Formula \ 
    fpc \ 
    fs \ 
    futile.logger \ 
    futile.options"
RUN for package in $f; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG g="gamlr \ 
    gbm \ 
    gclus \ 
    gdata \ 
    gdtools \ 
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
    gridBase \ 
    gridExtra \ 
    gsubfn \ 
    gtable \ 
    gtools"
RUN for package in $g; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG j="jpeg \ 
    jsonlite"
RUN for package in $j; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG k="kableExtra \ 
    keras \ 
    kernlab \ 
    KernSmooth \ 
    km.ci \ 
    KMsurv \ 
    knitr"
RUN for package in $k; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    mgcv \ 
    mi \ 
    mime \ 
    miniUI \ 
    minqa \ 
    miscTools \ 
    mixOmics \ 
    mlapi \ 
    mlbench \ 
    MLmetrics \ 
    mlr \ 
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG n="naivebayes \ 
    neuralnet \ 
    ngramrr \ 
    nleqslv \ 
    nlme \ 
    nloptr \ 
    NLP \ 
    NMF \ 
    nnet \ 
    nnls \ 
    nortest \ 
    numDeriv"
RUN for package in $n; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG o="OAIHarvester \ 
    odbc \ 
    officer \ 
    onewaytests \ 
    openNLPdata \ 
    openssl \ 
    openxlsx \ 
    ordinal"
RUN for package in $o; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG p="packrat \ 
    pander \ 
    parallelMap \ 
    ParamHelpers \ 
    party \ 
    partykit \ 
    pbapply \ 
    pbdZMQ \ 
    pbkrtest \ 
    PBSmodelling \ 
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG q="qap \ 
    qdapDictionaries \ 
    quadprog \ 
    quantmod \ 
    quantreg \ 
    quantregForest"
RUN for package in $q; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG r="R.methodsS3 \ 
    R.oo \ 
    R.utils \ 
    r2d3 \ 
    R6 \ 
    randomForest \ 
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
    RPostgreSQL \ 
    rprojroot \ 
    rsconnect \ 
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
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
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
    shinyjs \ 
    shinystan \ 
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
    sqldf \ 
    SqlRender \ 
    SQUAREM \ 
    stabs \ 
    StanHeaders \ 
    stargazer \ 
    stringdist \ 
    stringi \ 
    stringr \ 
    strucchange \ 
    summarytools \ 
    survey \ 
    survival \ 
    survminer \ 
    survMisc \ 
    syuzhet"
RUN for package in $s; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG t="tau \ 
    tcltk2 \ 
    TeachingDemos \ 
    tensorflow \ 
    testthat \ 
    text2vec \ 
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
    tokenizers \ 
    topicmodels \ 
    triebeard \ 
    trimcluster \ 
    TSP \ 
    TTR \ 
    twitteR"
RUN for package in $t; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG u="ucminf \ 
    udpipe \ 
    urltools \ 
    usethis \ 
    utf8 \ 
    uuid"
RUN for package in $u; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG v="vcd \ 
    vegan \ 
    viridis \ 
    viridisLite \ 
    visNetwork"
RUN for package in $v; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG w="webshot \ 
    whisker \ 
    withr \ 
    wordcloud \ 
    wordcloud2 \ 
    WRS2"
RUN for package in $w; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG x="xfun \ 
    xgboost \ 
    XML \ 
    xml2 \ 
    xopen \ 
    xtable \ 
    xts"
RUN for package in $x; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG y="yaml"
RUN for package in $y; do \
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done

ARG z="zeallot \ 
    zip \ 
    zoo"
RUN for package in $z; do \   
    R -q -e "p <- \"$package\"; if (isFALSE(p %in% installed.packages()[,\"Package\"])){; cat(paste(\"Installing package:\", p, \"\n\n\")); install.packages(p, repos = \"https://ftp.fau.de/cran/\", quiet=T);} else {;cat(paste(\"Package\", p, \"is already installed\n\n\"));}"; \
    done


# download and compile lightgbm (not yet on CRAN) # https://github.com/Microsoft/LightGBM/tree/master/R-package
RUN git clone --recursive https://github.com/Microsoft/LightGBM && \
    cd LightGBM && \
    Rscript build_r.R


# for tinytex, change user to make it available for current RStudio-Sever-User
RUN R -q -e 'install.packages("tinytex", repos = "https://ftp.fau.de/cran/", quiet=T)' 
USER user 
RUN R -q -e 'tinytex::install_tinytex()' 
# switch back for other users
USER root

# install required LaTeX-Packages
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
    makecell


# add custom RStudio theme ("Dracula")
ADD ./volume/user-settings /home/user/.rstudio/monitored/user-settings/
RUN chown -R user:user /home/user/.rstudio && \
    chmod 644 /home/user/.rstudio/monitored/user-settings/user-settings

# safety-check at the end: 
# 1) look if everything is installed correctely (if not, you might add system-dependencies in the base_image)
# 2) update all packages to the newest version
# 3) start rstudio-server
ARG allpackages="\"$a\" \"$b\" \"$c\" \"$d\" \"$e\" \"$f\" \"$g\" \"$h\" \
    \"$i\" \"$j\" \"$k\" \"$l\" \"$m\" \"$n\" \"$o\" \"$p\" \"$q\" \"$r\" \
    \"$s\" \"$t\" \"$u\" \"$v\" \"$w\" \"$x\" \"$y\" \"$z\""

RUN export packages_format="$(echo $(echo ${allpackages} | sed -e 's/ /\"\, \"/g') | sed -e 's/\"\"/\"/g')" && \
    R -q -e "vec <- setdiff(c($packages_format), unname(installed.packages()[,\"Package\"])); print(vec); if (length(vec) != 0){; for (i in vec){; cat(\"Installing required package: \", i, \"\n\n\"); install.packages(i, repos = \"https://ftp.fau.de/cran/\"); };}" && \
    R -q -e "update.packages(ask=F, repos = \"https://ftp.fau.de/cran/\")"

# entrypoint
ENTRYPOINT rstudio-server start && /bin/bash
