ARG BASEIMAGE

# GPU: pdsc_gpu_base:latest
# else: pdsc_base_img:latest

FROM ${BASEIMAGE}

SHELL ["/bin/bash", "-c"]

ENV PYTHON_USER=${USER}

########################
USER ${PYTHON_USER}

########################
# install some more tools
# RUN conda install -y \
#     -c conda-forge \
#     gdcm \
#     swig
# swig for GDCM

########################
# install datascience packages
ADD ./config/requirements_python.txt /home/${PYTHON_USER}/
RUN source activate base && \
    uv pip install --system -r /home/${PYTHON_USER}/requirements_python.txt

########################
# clear caches
RUN conda clean -ya
USER root

# update path
ENV PATH=/home/${PYTHON_USER}/.local/bin:${PATH}

########################

RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    rm -rf /root/.cache/uv/* && \
    rm -rf /home/${USER}/.cache/uv/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
