ARG BASEIMAGE

# GPU: base_image_light_gpu
# else: base_image_light

FROM ${BASEIMAGE}

# install more essential packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    cifs-utils \
    htop \
    locate \
    net-tools
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*


########################
USER ${USER}

RUN yes | pip install \
    testresources

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
