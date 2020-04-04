#######################
### GPU image
#######################

FROM rdsc_gpu_base:latest AS gpu_compile_stage

#######################
### Final image
#######################
FROM rdsc_base:latest

# set rsession user here
ENV RSESSION_USER="user" 

ENV DEBIAN_FRONTEND=noninteractive

#######################
### GPU compiled stuff
#######################

# python
# copy miniconda path with previously installed python libs (tensorflow, xgboost, lightgbm)
ENV MINI_C_PATH /home/${RSESSION_USER}/.local
COPY --from=gpu_compile_stage ${MINI_C_PATH} ${MINI_C_PATH}

# R
# copy whole library
ENV R_DIR /usr/local/lib/R/site-library
COPY --from=gpu_compile_stage ${R_DIR} ${R_DIR}

########################
########################
#### add GPU accelerated
#### ML capabilities
########################
########################

# base
# adapted from https://gitlab.com/nvidia/container-images/cuda/-/blob/master/dist/ubuntu18.04/10.2/base/Dockerfile
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2
RUN rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub | apt-key add - && \
    echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list && \
    echo "deb https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list

ENV CUDA_VERSION=10.2.89

ENV CUDA_PKG_VERSION=10-2=$CUDA_VERSION-1

# For libraries in the cuda-compat-* package: https://docs.nvidia.com/cuda/eula/index.html#attachment-a
RUN apt-get update && apt-get install -y --no-install-recommends \
    cuda-cudart-$CUDA_PKG_VERSION \
    cuda-compat-10-2
RUN ln -s cuda-10.2 /usr/local/cuda
RUN rm -rf /var/lib/apt/lists/*

# Required for nvidia-docker v1
RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
    echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

ENV PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/nvidia/lib:/usr/local/nvidia/lib64

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility
ENV NVIDIA_REQUIRE_CUDA="cuda>=10.2 brand=tesla,driver>=384,driver<385 brand=tesla,driver>=396,driver<397 brand=tesla,driver>=410,driver<411 brand=tesla,driver>=418,driver<419"

########################
# runtime
# adapted from https://gitlab.com/nvidia/container-images/cuda/blob/master/dist/ubuntu18.04/10.2/runtime/Dockerfile
ENV NCCL_VERSION=2.5.6
ENV LIBCUBLAS_VERSION=10.2.2.89-1

RUN apt-get update && apt-get install -y --no-install-recommends \
    cuda-libraries-$CUDA_PKG_VERSION \
    cuda-nvtx-$CUDA_PKG_VERSION \
    libcublas10=${LIBCUBLAS_VERSION} \
    libnccl2=$NCCL_VERSION-1+cuda10.2 && \
    apt-mark hold libnccl2
RUN rm -rf /var/lib/apt/lists/*

# update environment variables 
ENV CUDA_HOME=/usr/local/cuda
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CUDA_HOME}/lib64
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
ENV PATH=${CUDA_HOME}/bin:${PATH}
ENV OPENCL_LIBRARIES=/usr/local/cuda/lib64
ENV OPENCL_INCLUDE_DIR=/usr/local/cuda/include

# install prerequisites for lightgbm
RUN apt-get update && apt-get install -y --no-install-recommends \
    ocl-icd-opencl-dev
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/OpenCL/vendors && \
    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd

# finally, install required R packages

ARG packages="data.table"
RUN for package in $packages; do \
    R -q -e "p <- \"$package\"; remotes::update_packages(packages = p, upgrade = \"always\")"; \
    done && \
    rm -rf /tmp/*

ARG packages="future"
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
RUN R -q -e "devtools::install_github(repo = 'kapsner/lightgbm.py', ref = 'master')"
RUN R -q -e "devtools::install_github(repo = 'kapsner/mlr3learners.lgbpy', ref = 'master')"
RUN R -q -e "devtools::install_github(repo = 'mlr3learners/mlr3learners.lightgbm', ref = 'master')"

# install python stuff
RUN yes | pip install \
    scikit-learn

# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*
RUN rm -rf /home/${RSESSION_USER}/.cache/pip/*
RUN apt-get clean && apt-get autoclean && apt-get autoremove

# get RStudio-Server (Preview Version): https://www.rstudio.com/products/rstudio/download/preview/
ENV RSTUDIO_VERSION=1.3.926 \
    RSTUIO_URL=https://s3.amazonaws.com/rstudio-ide-build/server/bionic/amd64/
# stable
# ENV RSTUDIO_VERSION=1.2.5033 \
#     RSTUIO_URL=https://download2.rstudio.org/server/bionic/amd64/
ENV RSTUDIO_FILE="rstudio-server-${RSTUDIO_VERSION}-amd64.deb"
ENV RSTUDIO_LINK=${RSTUIO_URL}${RSTUDIO_FILE}
RUN wget ${RSTUDIO_LINK}
RUN gdebi -n ${RSTUDIO_FILE}
RUN rm -f ${RSTUDIO_FILE}

# overwrite headless .Rprofile
RUN echo "options(shiny.port = 3838)" > /home/${RSESSION_USER}/.Rprofile && \
    echo "options(shiny.host = '0.0.0.0')" >> /home/${RSESSION_USER}/.Rprofile && \
    echo "options(shiny.launch.browser = FALSE)" >> /home/${RSESSION_USER}/.Rprofile && \
    chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.Rprofile

# add custom RStudio theme ("Dracula")
ADD config/rstudio-prefs.json /home/${RSESSION_USER}/.config/rstudio/rstudio-prefs.json
RUN chown -R ${RSESSION_USER}:${RSESSION_USER} /home/${RSESSION_USER}/.config/ && \
    chmod 644 /home/${RSESSION_USER}/.config/rstudio/rstudio-prefs.json

# add PATH to a bash_profile script (workaround so that path is available in rstudio's terminal)
# https://support.rstudio.com/hc/en-us/articles/115010737148-Using-the-RStudio-Terminal#env
# https://docs.rstudio.com/ide/server-pro/1.2.1293-1/r-sessions.html
RUN echo "export PATH=${PATH}" >> /home/${RSESSION_USER}/.bash_profile && chmod +x /home/${RSESSION_USER}/.bash_profile

# set PATH for all users
RUN echo "PATH=${PATH}" >> /etc/R/Renviron
RUN echo "PATH=${PATH}" >> /etc/environment

# entrypoint
ENTRYPOINT rstudio-server start && tail -f /dev/null

# docker GPU not working with docker-compose
# docker run --rm --gpus all -p 8787:8787 -v ~/R:/home/user/volume rdsc_gpu
# debug: docker run --rm --gpus all -p 8787:8787 -e PASSWORD=password rdsc_gpu
