FROM rdsc_rstudio:latest
#FROM rdsc_headless:latest

USER root

# install some dependencies for enhancedvolcano
RUN apt-get update && apt-get install -y --no-install-recommends \
    libproj-dev

USER ${RSESSION_USER}

RUN install2.r --error --ncpus -1 BiocManager

ARG bio="affy \ 
    Biobase \ 
    BiocCheck \ 
    clusterProfiler \ 
    DESeq2 \ 
    EnhancedVolcano \ 
    flowCore \
    flowStats \
    gcrma \
    GEOquery \
    ggcyto \
    GO.db \
    hgu133plus2cdf \
    hgu133plus2probe \
    impute \
    org.Hs.eg.db \
    openCyto \
    pathfindR \
    pathview \
    pheatmap \
    SummarizedExperiment \
    sva"
# pak currently takes >5 hours to install the packages --> infeasible
# RUN for package in $a; do \
#     echo "pak::pkg_install(pkg = \"$package\", upgrade = TRUE, ask = FALSE)" | r; \
#     done && \
#     rm -rf /tmp/*
RUN export pkg="\"$(echo ${bio} | sed -e 's/ /\"\, \"/g')"\" && \
    export install_pkg=$(echo "vec <- setdiff(c($pkg), unname(installed.packages()[,'Package'])); cat(vec)" | r) && \
    installBioc.r --ncpus -1 $install_pkg && \
    rm -rf /tmp/*

# install the stuff, where I participated
ARG gitlab_array="\
    https://github.com/kapsner/sigident.preproc.git,master \
    https://github.com/kapsner/sigident.func.git,master \
    https://github.com/kapsner/sigident.git,master \
    https://github.com/kapsner/tromics.git,master"
RUN for repo in ${gitlab_array}; do IFS=",";\ 
    set -- $repo; \
    echo "p <- \"$1\"; \
        tryCatch({remotes::install_git(url = p, ref = \"$2\", upgrade = \"always\")}, error = function(e) {print(e)})" | r; \
    done && \
    rm -rf /tmp/*

USER root

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
