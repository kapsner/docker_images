ARG BASEIMAGE

# GPU: gpu_base:latest
# else: pdsc_base_img:latest

FROM ${BASEIMAGE}

# set python user here
ENV PYTHON_USER=${USER}

########################
USER ${PYTHON_USER}

# create and activate conda env
RUN conda create --name ml --clone base
SHELL ["conda", "run", "-n", "ml", "/bin/bash", "-c"]

RUN conda install -y python==${PYVERSION} && \
    conda clean -ya

########################

# install some (python) prerequisites
RUN conda install -y \
    git \
    numpy \
    pip \
    pyyaml \
    requests \
    ruamel_yaml \
    setuptools \
    unzip \
    wget \
    wheel

RUN yes | pip install \
    testresources

########################
# install some more tools
RUN conda install -y \
    -c conda-forge \
    ffmpeg \
    gdcm \
    gcc_linux-64 \
    gxx_linux-64 \
    gfortran_linux-64 \
    imagemagick \
    libclang \
    libffi \
    libboost \
    libxml2 \
    libxslt \
    openmpi \
    swig
# swig for GDCM
# libboost for lightgbm

########################
# install scikit-build from source (for SimpleITK)
RUN yes | pip install scikit-build

# install datascience packages
ADD ./config/requirements*.txt /home/${PYTHON_USER}/
RUN yes | pip install -r /home/${PYTHON_USER}/requirements_base.txt
#RUN yes | pip install -r /home/${PYTHON_USER}/requirements_nlp.txt
RUN yes | pip install -r /home/${PYTHON_USER}/requirements.txt

########################
# clear caches
RUN conda clean -ya
USER root

# update path
ENV PATH=/home/${PYTHON_USER}/.local/bin:${PATH}

RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*
RUN rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/*
RUN conda clean -ya
RUN apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
