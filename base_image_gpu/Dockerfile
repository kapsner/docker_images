FROM gpu_base_img:latest

#########################
ARG CUDA=11.0
ARG CUDNN=8.0.4.30-1
ARG CUDNN_MAJOR_VERSION=8
ARG LIB_DIR_PREFIX=x86_64
ARG LIBNVINFER=7.1.3-1
ARG LIBNVINFER_MAJOR_VERSION=7
# https://www.tensorflow.org/install/gpu
# Install TensorRT. Requires that libcudnn7 is installed above.
RUN apt-get update && apt-get install -y --no-install-recommends \
    libnvinfer${LIBNVINFER_MAJOR_VERSION}=${LIBNVINFER}+cuda${CUDA} \
    libnvinfer-dev=${LIBNVINFER}+cuda${CUDA} \
    libnvinfer-plugin-dev=${LIBNVINFER}+cuda${CUDA} \
    libnvinfer-plugin${LIBNVINFER_MAJOR_VERSION}=${LIBNVINFER}+cuda${CUDA} && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

########################
# update environment variables 
ENV CUDA_HOME=/usr/local/cuda
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CUDA_HOME}/lib64
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
ENV PATH=${CUDA_HOME}/bin:${PATH}
ENV OPENCL_LIBRARIES=/usr/local/cuda/lib64
ENV OPENCL_INCLUDE_DIR=/usr/local/cuda/include
########################

# update-alternatives
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python${PYVERSION} 2

RUN update-alternatives --config python3

RUN yes | pip install \
    --upgrade pip

# install python prerequisites
RUN yes | pip install \
    --upgrade numpy>=1.19.2
RUN yes | pip install \
    --upgrade setuptools \
    wheel

# install/update latest cmake (> 3.12 required for compiling of latest xgboost)
RUN yes | pip install \
    --upgrade cmake

########################
# xgboost installation will work only with g++/gcc version <= 8
RUN apt-get update && apt-get install -y --no-install-recommends \
    g++-8 \
    gcc-8 \
    gfortran-8
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN ln -sf /usr/bin/gcc-8 /usr/bin/gcc && \
    ln -sf /usr/bin/g++-8 /usr/bin/g++ && \
    ln -sf /usr/bin/gfortran-8 /usr/bin/gfortran

#########################
# install prerequisites for lightgbm
RUN apt-get update && apt-get install -y --no-install-recommends \
    ocl-icd-opencl-dev
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/OpenCL/vendors && \
    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd

# https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/user-guide.html#dockerfiles
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility
