FROM rdsc_base:latest

# set rsession user here
ENV RSESSION_USER="user" 

ENV DEBIAN_FRONTEND=noninteractives

########################
########################
#### add GPU accelerated
#### ML capabilities
########################
########################

########################
# base
# adapted from https://gitlab.com/nvidia/container-images/cuda/blob/master/dist/ubuntu18.04/10.1/base/Dockerfile
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2
RUN rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub | apt-key add - && \
    echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list && \
    echo "deb https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list

ENV CUDA_VERSION=10.1.243

ENV CUDA_PKG_VERSION=10-1=$CUDA_VERSION-1

# For libraries in the cuda-compat-* package: https://docs.nvidia.com/cuda/eula/index.html#attachment-a
RUN apt-get update && apt-get install -y --no-install-recommends \
    cuda-cudart-$CUDA_PKG_VERSION \
    cuda-compat-10-1
RUN ln -s cuda-10.1 /usr/local/cuda
RUN rm -rf /var/lib/apt/lists/*

# Required for nvidia-docker v1
RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
    echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

ENV PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/nvidia/lib:/usr/local/nvidia/lib64

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility
ENV NVIDIA_REQUIRE_CUDA="cuda>=10.1 brand=tesla,driver>=384,driver<385 brand=tesla,driver>=396,driver<397 brand=tesla,driver>=410,driver<411"

########################
# runtime
# adapted from https://gitlab.com/nvidia/container-images/cuda/blob/master/dist/ubuntu18.04/10.1/runtime/Dockerfile
ENV NCCL_VERSION=2.4.8

RUN apt-get update && apt-get install -y --no-install-recommends \
    cuda-libraries-$CUDA_PKG_VERSION \
    cuda-nvtx-$CUDA_PKG_VERSION \
    libcublas10=10.2.1.243-1 \
    libnccl2=$NCCL_VERSION-1+cuda10.1 && \
    apt-mark hold libnccl2
RUN rm -rf /var/lib/apt/lists/*

########################
# devel
# adapted from https://gitlab.com/nvidia/container-images/cuda/blob/master/dist/ubuntu18.04/10.1/devel/Dockerfile
RUN apt-get update && apt-get install -y --no-install-recommends \
    cuda-nvml-dev-$CUDA_PKG_VERSION \
    cuda-command-line-tools-$CUDA_PKG_VERSION \
    cuda-libraries-dev-$CUDA_PKG_VERSION \
    cuda-minimal-build-$CUDA_PKG_VERSION \
    libnccl-dev=$NCCL_VERSION-1+cuda10.1 \
    libcublas-dev=10.2.1.243-1
RUN rm -rf /var/lib/apt/lists/*

ENV LIBRARY_PATH=/usr/local/cuda/lib64/stubs

########################
# cudnn7
# adapted from https://gitlab.com/nvidia/container-images/cuda/blob/master/dist/ubuntu18.04/10.1/devel/cudnn7/Dockerfile
ENV CUDNN_VERSION=7.6.5.32
RUN apt-get update && apt-get install -y --no-install-recommends \
    libcudnn7=$CUDNN_VERSION-1+cuda10.1 \
    libcudnn7-dev=$CUDNN_VERSION-1+cuda10.1 && \
    apt-mark hold libcudnn7
RUN rm -rf /var/lib/apt/lists/*

#########################
#########################
# update environment variables 
ENV CUDA_HOME=/usr/local/cuda
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CUDA_HOME}/lib64
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
ENV PATH=${CUDA_HOME}/bin:${PATH}
ENV OPENCL_LIBRARIES=/usr/local/cuda/lib64
ENV OPENCL_INCLUDE_DIR=/usr/local/cuda/include

#########################
# install prerequisites for lightgbm
RUN apt-get update && apt-get install -y --no-install-recommends \
    libboost-dev \
    libboost-system-dev \
    libboost-filesystem-dev \
    ocl-icd-opencl-dev
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/OpenCL/vendors && \
    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd

# install latest cmake (> 3.12 required for compiling of latest xgboost)
RUN wget -O cmake.tar.gz https://github.com/Kitware/CMake/releases/download/v3.15.2/cmake-3.15.2.tar.gz
RUN tar -zxvf cmake.tar.gz && \
    mv cmake-* cmake/ && \
    cd cmake && \
    ./bootstrap && \
    make && \
    make install
RUN rm -rf cmake && rm -rf cmake.tar.gz

# compile lightgbm GPU R package
# https://lightgbm.readthedocs.io/en/latest/GPU-Tutorial.html
RUN git clone --recursive --branch stable --depth 1 https://github.com/microsoft/LightGBM
RUN cd LightGBM && \
    sed -i -e 's/use_gpu <- FALSE/use_gpu <- TRUE/g' R-package/src/install.libs.R && \
    Rscript build_r.R

# install xgboost GPU R package
# xgboost branch
ENV XGBOOST_BRANCH=v0.90

# https://hub.docker.com/r/rocker/ml-gpu/dockerfile 
# tag v0.82 is latest GPU-compilable tag with rocker images
RUN git clone --recursive -b ${XGBOOST_BRANCH} https://github.com/dmlc/xgboost
RUN mkdir -p xgboost/build && \
    cd xgboost/build && \
    cmake .. -DUSE_CUDA=ON -DR_LIB=ON -DUSE_NCCL=ON && \
    make install -j$(nproc)

# clean up
RUN rm -rf xgboost
RUN rm -rf LightGBM

### install python versions
# lightgbm
RUN pip install lightgbm --install-option=--gpu

# xgboost
# Install xgboost GPU python package
RUN git clone --recursive -b ${XGBOOST_BRANCH} https://github.com/dmlc/xgboost
RUN mkdir -p xgboost/build && \
    cd xgboost/build && \
    cmake .. -DUSE_CUDA=ON -DUSE_NCCL=ON && \
    make install -j$(nproc)
RUN cd xgboost/python-package && \
    python setup.py install

### Finish GPU installing stuff
# clean up
RUN rm -rf xgboost
RUN rm -rf LightGBM

# install keras/tensorflow
RUN R -q -e "install.packages('keras')"

# switch user
USER ${RSESSION_USER}

# install keras (when pip virtualenv is already installed)
RUN R -q -e "keras::install_keras(tensorflow = 'gpu')"

# switch back
USER root

# evtl add h2o4gpu, gpuR
