#######################
### Final image
#######################
FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04

# set python user here
ENV PYTHON_USER="user" 

# set frontend stuff
ENV DEBIAN_FRONTEND=noninteractive

#########################
# https://www.tensorflow.org/install/gpu
# Install TensorRT. Requires that libcudnn7 is installed above.
RUN apt-get update && apt-get install -y --no-install-recommends \
    libnvinfer6 \
    libnvinfer-dev \
    libnvinfer-plugin6
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# update environment variables 
ENV CUDA_HOME=/usr/local/cuda
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CUDA_HOME}/lib64
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
ENV PATH=${CUDA_HOME}/bin:${PATH}
ENV OPENCL_LIBRARIES=/usr/local/cuda/lib64
ENV OPENCL_INCLUDE_DIR=/usr/local/cuda/include

#########################

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils\ 
    build-essential \
    curl \
    cmake \
    git \
    gcc-8 \
    htop \
    libboost-dev \
    libboost-system-dev \
    libboost-filesystem-dev \
    libbz2-dev \
    libcurl4-openssl-dev \
    libssh-dev \
    libssl-dev \
    nano \
    net-tools \
    software-properties-common \
    sudo \
    wget
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add python apt repository for latest python
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.8 \
    python3.8-dev \
    python3-gdcm \ 
    python3-pip \
    python3-yaml \ 
    python3-h5py \ 
    python3.8-venv
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

########################
# define python user
ENV PYTHON_USER="user" 
ENV USER_UID=1000
ENV USER_GID=${USER_UID}

RUN groupadd --gid ${USER_GID} ${PYTHON_USER} && \
    useradd --uid ${USER_UID} --gid ${USER_GID} -m ${PYTHON_USER}
RUN echo ${PYTHON_USER}:password | chpasswd 
RUN echo ${PYTHON_USER} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${PYTHON_USER} && \
    chmod 0440 /etc/sudoers.d/${PYTHON_USER}

# symlink pip3
RUN ln -s /usr/bin/pip3 /usr/bin/pip

# symlink python
RUN ln -s /usr/bin/python3.8 /usr/bin/python

# update-alternatives
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 2

RUN update-alternatives --config python3

RUN yes | pip install \
    --upgrade pip

RUN yes | pip install \
    setuptools \
    wheel

########################
# xgboost installation will work only with g++/gcc version <= 8
RUN apt-get update && apt-get install -y --no-install-recommends \
    g++-8 \
    gcc-8
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN ln -sf /usr/bin/gcc-8 /usr/bin/gcc && \
    ln -sf /usr/bin/g++-8 /usr/bin/g++

# install latest cmake (> 3.12 required for compiling of latest xgboost)
RUN wget -O cmake.tar.gz https://github.com/Kitware/CMake/releases/download/v3.17.3/cmake-3.17.3.tar.gz
RUN tar -zxvf cmake.tar.gz && \
    mv cmake-* cmake/ && \
    cd cmake && \
    ./bootstrap && \
    make && \
    make install
RUN rm -rf cmake && rm -rf cmake.tar.gz

#########################
# install prerequisites for lightgbm
RUN apt-get update && apt-get install -y --no-install-recommends \
    ocl-icd-opencl-dev
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/OpenCL/vendors && \
    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd

#########################
# lightgbm
RUN git clone --recursive https://github.com/microsoft/LightGBM
RUN mkdir -p LightGBM/build && \
    cd LightGBM/build && \
    cmake -DUSE_GPU=1 .. &&\
    make -j$(nproc)
RUN ls -al /usr/lib/
RUN cd LightGBM/python-package && \
    python setup.py install --precompile

# xgboost
# Install xgboost GPU python package
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

# install datascience packages
RUN yes | pip install \
    bokeh

RUN yes | pip install \
    catboost \
    "colorama>=0.3.8" \
    cython

RUN yes | pip install \
    eli5

RUN yes | pip install \
    fasttext \
    future

RUN yes | pip install \
    gensim

RUN yes | pip install \
    imgaug \ 
    ipython

RUN yes | pip install \
    jedi \
    jinja2 \
    jupyter

RUN yes | pip install \
    keras

RUN yes | pip install \
    matplotlib

RUN yes | pip install \
    nltk \
    nose \
    notebook \ 
    numpy

RUN yes | pip install \
    opencv-python

RUN yes | pip install \
    pandas \
    pillow \
    plotly \
    # pocketsphinx \
    psycopg2-binary \ 
    pycuda \ 
    pydicom \ 
    pydub \
    pylint

RUN yes | pip install \
    requests

RUN yes | pip install \
    scikit-image \ 
    scikit-learn \
    scipy \
    scrapy \
    seaborn \
    spacy \
    # SpeechRecognition \ 
    statsmodels \
    sympy

RUN yes | pip install \
    tabulate \
    tensorflow-gpu==2.2.0 \
    torch

USER ${PYTHON_USER}

ENV TF_FORCE_GPU_ALLOW_GROWTH=true

ENTRYPOINT tail -f /dev/null

# docker run --rm --gpus all pdsc_gpu
