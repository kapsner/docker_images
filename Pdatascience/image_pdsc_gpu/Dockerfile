#######################
### GPU image
#######################

FROM pdsc_gpu_base:latest AS gpu_compile_stage

#######################
### Final image
#######################
FROM pdsc_base:latest

# set python user here
ENV PYTHON_USER="user" 

# set frontend stuff
ENV DEBIAN_FRONTEND=noninteractive

#######################
### GPU compiled stuff
#######################

# python
# copy path with previously installed python libs (xgboost, lightgbm)
ENV PY_LIB /usr/lib/python3/dist-packages
COPY --from=gpu_compile_stage ${PY_LIB} ${PY_LIB}

########################
########################
#### add GPU accelerated
#### ML capabilities
########################
########################

# base
# adapted from https://gitlab.com/nvidia/container-images/cuda/-/blob/master/dist/ubuntu18.04/10.2/base/Dockerfile
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2
RUN rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub | apt-key add - && \
    echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list && \
    echo "deb https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list

ENV CUDA_VERSION=10.2.89

ENV CUDA_PKG_VERSION=10-2=$CUDA_VERSION-1

# For libraries in the cuda-compat-* package: https://docs.nvidia.com/cuda/eula/index.html#attachment-a
RUN apt-get update && apt-get install -y --no-install-recommends \
    cuda-cudart-$CUDA_PKG_VERSION \
    cuda-compat-10-2
RUN ln -s cuda-10.2 /usr/local/cuda
RUN rm -rf /var/lib/apt/lists/*

# Required for nvidia-docker v1
RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
    echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

ENV PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/nvidia/lib:/usr/local/nvidia/lib64

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility
ENV NVIDIA_REQUIRE_CUDA="cuda>=10.2 brand=tesla,driver>=384,driver<385 brand=tesla,driver>=396,driver<397 brand=tesla,driver>=410,driver<411 brand=tesla,driver>=418,driver<419"

########################
# runtime
# adapted from https://gitlab.com/nvidia/container-images/cuda/blob/master/dist/ubuntu18.04/10.2/runtime/Dockerfile
ENV NCCL_VERSION=2.5.6
ENV LIBCUBLAS_VERSION=10.2.2.89-1

RUN apt-get update && apt-get install -y --no-install-recommends \
    cuda-libraries-$CUDA_PKG_VERSION \
    cuda-nvtx-$CUDA_PKG_VERSION \
    libcublas10=${LIBCUBLAS_VERSION} \
    libnccl2=$NCCL_VERSION-1+cuda10.2 && \
    apt-mark hold libnccl2
RUN rm -rf /var/lib/apt/lists/*

# update environment variables 
ENV CUDA_HOME=/usr/local/cuda
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CUDA_HOME}/lib64
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
ENV PATH=${CUDA_HOME}/bin:${PATH}
ENV OPENCL_LIBRARIES=/usr/local/cuda/lib64
ENV OPENCL_INCLUDE_DIR=/usr/local/cuda/include

# install prerequisites for lightgbm
RUN apt-get update && apt-get install -y --no-install-recommends \
    ocl-icd-opencl-dev
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/OpenCL/vendors && \
    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd


# install packages
RUN yes | pip install \
    h2o4gpu

RUN yes | pip install \
    tensorflow-gpu

RUN yes | pip install \
    pycuda

USER ${PYTHON_USER}

ENTRYPOINT tail -f /dev/null
