# multistage image here

FROM pdsc_gpu_build:latest as pdsc_build

FROM base_image_gpu:latest

# delete installed miniconda env
RUN rm -rf /home/${PYTHON_USER}/miniconda

# copy miniconda from build-stage with compiled libraries
COPY --from=pdsc_build /home/${PYTHON_USER}/miniconda /home/${PYTHON_USER}

########################
# install nvtop :)
RUN apt-get update && apt-get install -y --no-install-recommends \
    nvtop
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

########################
# clear caches
RUN conda clean -ya
USER root

RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
