FROM rdsc_rstudio:latest
#FROM rdsc_headless:latest

ARG packages="BiocManager" 
RUN for package in $packages; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

# install devel version
RUN R -q -e "BiocManager::install(version = 'devel', ask = FALSE)"

# install Bioconductorstuff
RUN R -q -e "BiocManager::install('affy')"
RUN R -q -e "BiocManager::install('Biobase')"
RUN R -q -e "BiocManager::install('BiocCheck')"
RUN R -q -e "BiocManager::install('clusterProfiler')"
RUN R -q -e "BiocManager::install('DESeq2')"
RUN R -q -e "BiocManager::install('EnhancedVolcano')"
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
RUN R -q -e "BiocManager::install('pheatmap')"
RUN R -q -e "BiocManager::install('SummarizedExperiment')"
RUN R -q -e "BiocManager::install('sva')"

# install the stuff, where I participated
RUN R -q -e "remotes::install_git(url = 'https://gitlab.miracum.org/clearly/sigident.git', ref = 'master')"
RUN R -q -e "remotes::install_git(url = 'https://gitlab.miracum.org/clearly/sigident.preproc.git', ref = 'master')"
RUN R -q -e "remotes::install_git(url = 'https://gitlab.miracum.org/clearly/sigident.func.git', ref = 'master')"
RUN R -q -e "remotes::install_git(url = 'https://gitlab.miracum.org/clearly/tromics.git', ref = 'master')"

# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /home/${RSTUDIO_USER}/.cache/pip/* && \
    apt-get clean && apt-get autoclean && apt-get autoremove
