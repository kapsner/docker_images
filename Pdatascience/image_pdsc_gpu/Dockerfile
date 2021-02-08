FROM pdsc_gpu_base:latest

########################
# build libraries from source
USER ${PYTHON_USER}

RUN conda install -y \
    -c conda-forge \
    ocl-icd-system

# build lightgbm GPU python package from source
RUN cd /home/${PYTHON_USER} && \
    git clone --recursive https://github.com/microsoft/LightGBM && \
    mkdir -p /home/${PYTHON_USER}/LightGBM/build

RUN cd /home/${PYTHON_USER}/LightGBM/build && \
    cmake -DUSE_GPU=1 .. &&\
    make -j$(nproc)
RUN cd home/${PYTHON_USER}/LightGBM/python-package && \
    python setup.py install --precompile
RUN rm -rf /home/${PYTHON_USER}/LightGBM

# build xgboost GPU python package from source
RUN cd /home/${PYTHON_USER} && \
    git clone --recursive https://github.com/dmlc/xgboost && \
    mkdir -p /home/${PYTHON_USER}/xgboost/build
USER root
RUN cd /home/${PYTHON_USER}/xgboost/build && \
    cmake .. -DUSE_CUDA=ON && \
    make install -j$(nproc)
USER ${PYTHON_USER}
RUN cd home/${PYTHON_USER}/xgboost/python-package && \
    python setup.py install
USER root
RUN rm -rf /home/${PYTHON_USER}/xgboost
RUN conda clean -ya
USER ${PYTHON_USER}

# build torch / torchvision from source
# install some dependencies for pytorch
RUN conda install -y \
    cffi \
    dataclasses \
    future \
    ninja \
    six \
    typing_extensions

# magma-cuda must match cuda version
RUN conda install -y -c \
    pytorch \
    magma-cuda110

# build pytorch GPU package from source
RUN cd /home/${PYTHON_USER} && \
    git clone https://github.com/pytorch/pytorch
RUN cd /home/${PYTHON_USER}/pytorch && \
    git checkout v1.7.1 && \
    git submodule sync && \
    git submodule update --init --recursive
RUN cd /home/${PYTHON_USER}/pytorch && \
    CMAKE_PREFIX_PATH="$(dirname $(which conda))/../" \
    python setup.py install --cmake
RUN rm -rf /home/${PYTHON_USER}/pytorch

# build torchvision from source
RUN cd /home/${PYTHON_USER} && \
    git clone --recursive https://github.com/pytorch/vision
RUN cd /home/${PYTHON_USER}/vision && \
    python setup.py install
RUN rm -rf /home/${PYTHON_USER}/vision

# precompiled
# RUN conda install -y \
#     -c pytorch \
#     pytorch \
#     torchvision \
#     cudatoolkit=11.0

########################
# install other datascience libraries
RUN yes | pip install -r /home/${PYTHON_USER}/requirements_datascience.txt

########################
# install other GPU learning libraries
# (currently don't need them)
# RUN yes | pip install -f \
#     https://h2o-release.s3.amazonaws.com/h2o/latest_stable_Py.html h2o

# RUN yes | pip install \
#     tensorflow-gpu

########################
# clear caches
RUN conda clean -ya
USER root

RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*
RUN rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/*
RUN conda clean -ya
RUN apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
# personalize image
ADD ./config/pycodestyle /home/${PYTHON_USER}/.config/pycodestyle
RUN chown -R ${PYTHON_USER}:${PYTHON_USER} /home/${PYTHON_USER}/.config/

########################

USER ${PYTHON_USER}

ENV TF_FORCE_GPU_ALLOW_GROWTH=true

ENTRYPOINT tail -f /dev/null

# docker run --rm --gpus all pdsc_gpu
