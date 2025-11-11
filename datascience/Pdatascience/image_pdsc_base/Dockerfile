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
RUN conda install -y \
    -c conda-forge \
    gdcm \
    swig
# swig for GDCM

########################
# install scikit-build from source (for SimpleITK)
RUN source activate base && \
    uv pip install --system \
    scikit-build

# install datascience packages
ADD ./config/requirements*.txt /home/${PYTHON_USER}/
RUN source activate base && \
    uv pip install --system \
    -r /home/${PYTHON_USER}/requirements_base.txt
RUN source activate base && \
    uv pip install --system \
    -r /home/${PYTHON_USER}/requirements.txt

########################
# clear caches
RUN conda clean -ya
USER root

# update path
ENV PATH=/home/${PYTHON_USER}/.local/bin:${PATH}

RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
