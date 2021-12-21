FROM rdsc_rstudio:latest
#FROM rdsc_headless:latest

# install some dependencies for enhancedvolcano
RUN apt-get update && apt-get install -y --no-install-recommends \
    libharfbuzz-dev \
    libfribidi-dev \
    libproj-dev

USER ${RSESSION_USER}

ARG packages="BiocManager" 
RUN for package in $packages; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

# install devel version
#RUN R -q -e "BiocManager::install(version = \"devel\", ask = FALSE)"

ARG a="affy \ 
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
    gPCA \
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
RUN for package in $a; do \
    R -q -e "p <- \"$package\"; BiocManager::install(pkgs = p, update = TRUE, ask = FALSE)"; \
    done && \
    rm -rf /tmp/*

# install the stuff, where I participated
ARG gitlab_array="\
    https://gitlab.miracum.org/clearly/sigident.preproc.git,master \
    https://gitlab.miracum.org/clearly/sigident.func.git,master \
    https://gitlab.miracum.org/clearly/sigident.git,master \
    https://gitlab.miracum.org/clearly/tromics.git,master"
RUN for repo in ${gitlab_array}; do IFS=",";\ 
    set -- $repo; \
    R -q -e "p <- \"$1\"; remotes::install_git(url = p, ref = \"$2\", upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

USER root

########################
# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
