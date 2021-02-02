FROM rdsc_gpu_base:latest

# compile lightgbm GPU R package
# https://lightgbm.readthedocs.io/en/latest/GPU-Tutorial.html
RUN git clone --recursive https://github.com/microsoft/LightGBM
RUN cd LightGBM && \
    Rscript build_r.R --use-gpu

# install xgboost GPU R package
# xgboost branch
RUN git clone --recursive https://github.com/dmlc/xgboost
RUN mkdir -p xgboost/build && \
    cd xgboost/build && \
    cmake .. -DUSE_CUDA=ON -DR_LIB=ON -DUSE_NCCL=ON && \
    make install -j$(nproc)

# clean up
RUN rm -rf xgboost
RUN rm -rf LightGBM

# install keras/tensorflow
RUN R -q -e "install.packages('keras')"

# switch user
USER ${RSESSION_USER}

# install keras (when pip virtualenv is already installed)
RUN R -q -e "keras::install_keras(tensorflow = 'gpu')"

# switch back
USER root

# finally, install required R packages

ARG packages="data.table"
RUN for package in $packages; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG packages="future \
    future.apply"
RUN for package in $packages; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

# ARG packages="gpuR" 
# RUN for package in $packages; do \
#     R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
#     done && \
#     rm -rf /tmp/*

ARG packages="h2o"
RUN for package in $packages; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG packages="mlr3misc \ 
    mlr3verse \ 
    mlbench \ 
    MLmetrics"
RUN for package in $packages; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG packages="RcppRoll"
RUN for package in $packages; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG packages="tidyr"
RUN for package in $packages; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG packages="qpdf"
RUN for package in $packages; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG packages="vroom"
RUN for package in $packages; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

# install my own stuff
RUN R -q -e "devtools::install_github(repo = 'mlr3learners/mlr3learners.lightgbm', ref = 'development')"

# install python stuff
RUN yes | pip install \
    scikit-learn

# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*
RUN rm -rf /home/${RSESSION_USER}/.cache/pip/* && \
    rm -rf ~/.cache/pip/*
RUN apt-get clean && apt-get autoclean && apt-get autoremove

ENTRYPOINT tail -f /dev/null

# docker GPU not working with docker-compose
# docker run --rm --gpus all -p 8787:8787 -v ~/R:/home/user/volume rdsc_gpu
# debug: docker run --rm --gpus all -p 8787:8787 -e PASSWORD=password rdsc_gpu
