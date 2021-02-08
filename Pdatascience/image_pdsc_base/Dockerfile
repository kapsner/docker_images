ARG BASEIMAGE

# GPU: gpu_base:latest
# else: pdsc_base_img:latest

FROM ${BASEIMAGE}

# set python user here
ENV PYTHON_USER=${USER}

########################
USER ${PYTHON_USER}

# create and activate conda env
SHELL ["conda", "run", "-n", "base", "/bin/bash", "-c"]

RUN conda install -y python==${PYVERSION} && \
    conda clean -ya

########################

# install some (python) prerequisites
RUN conda install -y \
    git \
    mkl \
    mkl-include \
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
    conda-build \
    cmake \
    ffmpeg \
    gcc_linux-64 \
    gxx_linux-64 \
    gfortran_linux-64 \
    imagemagick \
    libclang \
    libffi \
    libboost \
    make \
    openmpi \
    swig
# swig for GDCM
# libboost for lightgbm

########################
USER root
# install python3-gdcm
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgdcm-tools

USER ${PYTHON_USER}
RUN cd /home/${PYTHON_USER} && \
    git clone https://github.com/malaterre/GDCM
RUN cd /home/${PYTHON_USER}/GDCM && \
    mkdir build
USER root
RUN cd /home/${PYTHON_USER}/GDCM/build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS=-fPIC -DCMAKE_CXX_FLAGS=-fPIC \
    -DGDCM_BUILD_SHARED_LIBS:BOOL=ON \
    -DGDCM_WRAP_PYTHON=ON PYTHON_EXECUTABLE=$(which python) \
    PYTHON_INCLUDE_DIR=/home/${PYTHON_USER}/miniconda/lib/python3.8/site-packages \
    GDCM_BUILD_SHARED_LIBS=ON GDCM_USE_VTK=ON /home/${PYTHON_USER}/GDCM/ && \
    cmake --build . --target install
RUN cp /usr/local/lib/gdcm.py /home/${PYTHON_USER}/miniconda/lib/python3.8/site-packages/.
RUN cp /usr/local/lib/gdcmswig.py /home/${PYTHON_USER}/miniconda/lib/python3.8/site-packages/.
RUN cp /usr/local/lib/_gdcmswig.so /home/${PYTHON_USER}/miniconda/lib/python3.8/site-packages/.
RUN cp /usr/local/lib/libgdcm* /home/${PYTHON_USER}/miniconda/lib/python3.8/site-packages/.
RUN ldconfig

RUN rm -rf /home/${PYTHON_USER}/GDCM
USER ${PYTHON_USER}

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
