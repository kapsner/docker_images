FROM base_image_gpu:latest

########################
# install nvtop :)
RUN apt-get update && apt-get install -y --no-install-recommends \
    nvtop

#########################
# install prerequisites for lightgbm
RUN apt-get update && apt-get install -y --no-install-recommends \
    ocl-icd-opencl-dev
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/OpenCL/vendors && \
    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd

# make conda see ocl headers and
# install some dependencies for pytorch
USER ${USER}
RUN conda install -y \
    -c conda-forge \
    mkl \
    mkl-include \
    ocl-icd-system \
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

########################
# build libraries from source

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

########################
# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*
RUN rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/*
RUN conda clean -ya
RUN apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
