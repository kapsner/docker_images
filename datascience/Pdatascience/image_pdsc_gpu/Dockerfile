ARG BASEIMAGE

# nobuild: pdsc_gpu_nobuild:latest
# build: pdsc_gpu_build:latest

FROM ${BASEIMAGE}

SHELL ["/bin/bash", "-c"]

ENV PYTHON_USER=${USER}
ADD image_pdsc_gpu/.env /home/${RSESSION_USER}/.nvtopenv
ARG NVTOP_VERSION

ENV NVTOP_VERSION=$NVTOP_VERSION

########################
# compile nvtop :) 
# seems as if apt-version only works with nvidia-drivers-460 and cuda 11.0
RUN apt-get update && apt-get install -y --no-install-recommends \
    libncurses5-dev libncursesw5-dev libdrm-dev libsystemd-dev
RUN apt-get clean && \ 
apt-get autoclean && \
rm -rf /var/lib/apt/lists/*
RUN cd /tmp && git clone -b ${NVTOP_VERSION} https://github.com/Syllo/nvtop.git
RUN mkdir -p /tmp/nvtop/build && cd /tmp/nvtop/build && \
    /usr/bin/cmake .. -DNVIDIA_SUPPORT=ON -DAMDGPU_SUPPORT=OFF -DINTEL_SUPPORT=OFF && \
    make && \
    make install

########################
# clear caches
RUN conda clean -ya

RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    rm -rf /root/.cache/uv/* && \
    rm -rf /home/${USER}/.cache/uv/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
