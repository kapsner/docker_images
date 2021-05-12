FROM rdsc_rstudio:latest
#FROM rdsc_headless:latest

# install some dependencies for enhancedvolcano
RUN apt update && apt install -y --no-install-recommends \
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
    gcrma \
    GEOquery \
    GO.db \
    gPCA \
    hgu133plus2cdf \
    hgu133plus2probe \
    impute \
    org.Hs.eg.db \
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
RUN R -q -e "remotes::install_git(url = \"https://gitlab.miracum.org/clearly/sigident.preproc.git\", ref = \"master\")"
RUN R -q -e "remotes::install_git(url = \"https://gitlab.miracum.org/clearly/sigident.func.git\", ref = \"master\")"
RUN R -q -e "remotes::install_git(url = \"https://gitlab.miracum.org/clearly/sigident.git\", ref = \"master\")"
RUN R -q -e "remotes::install_git(url = \"https://gitlab.miracum.org/clearly/tromics.git\", ref = \"master\")"

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
