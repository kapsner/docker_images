FROM base_image_gpu:latest

########################
# eventually install miniconda:
# https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

# install/update latest cmake (> 3.12 required for compiling of latest xgboost)
RUN yes | pip install \
    --upgrade cmake

########################
# update environment variables 
ENV CUDA_HOME=/usr/local/cuda
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CUDA_HOME}/lib64
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
ENV PATH=${CUDA_HOME}/bin:${PATH}
ENV OPENCL_LIBRARIES=/usr/local/cuda/lib64
ENV OPENCL_INCLUDE_DIR=/usr/local/cuda/include

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

# install lightgbm GPU python package
RUN git clone --recursive https://github.com/microsoft/LightGBM
RUN mkdir -p LightGBM/build && \
    cd LightGBM/build && \
    cmake -DUSE_GPU=1 .. &&\
    make -j$(nproc)
RUN cd LightGBM/python-package && \
    python setup.py install --precompile

# install xgboost GPU python package
RUN git clone --recursive https://github.com/dmlc/xgboost
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

########################
# install nvtop :)
RUN apt-get update && apt-get install -y --no-install-recommends \
    nvtop
# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*
RUN rm -rf ~/.cache/pip/*
RUN apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
