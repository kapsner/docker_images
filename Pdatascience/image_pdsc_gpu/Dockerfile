FROM gpu_base:latest

# set environment variable to supress user interaction
ENV DEBIAN_FRONTEND=noninteractive

# install required custom system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgdcm-tools \
    python3-h5py
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# install python3-gdcm
RUN git clone https://github.com/malaterre/GDCM
RUN cd GDCM && \
    mkdir build
RUN cd GDCM/build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS=-fPIC -DCMAKE_CXX_FLAGS=-fPIC \
    -DGDCM_BUILD_SHARED_LIBS:BOOL=ON \
    -DGDCM_WRAP_PYTHON=ON PYTHON_EXECUTABLE=/usr/local/bin/python${PYVERSION} \
    PYTHON_INCLUDE_DIR=/usr/local/lib/python${PYVERSION}/dist-packages/ \
    GDCM_BUILD_SHARED_LIBS=ON GDCM_USE_VTK=ON /GDCM/ && \
    cmake --build . --target install

RUN cp /usr/local/lib/gdcm.py /usr/local/lib/python${PYVERSION}/dist-packages/.
RUN cp /usr/local/lib/gdcmswig.py /usr/local/lib/python${PYVERSION}/dist-packages/.
RUN cp /usr/local/lib/_gdcmswig.so /usr/local/lib/python${PYVERSION}/dist-packages/.
RUN cp /usr/local/lib/libgdcm* /usr/local/lib/python${PYVERSION}/dist-packages/.
RUN ldconfig

RUN rm -rf GDCM

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

########################

# update pip
RUN yes | pip install --upgrade pip

# install scikit-build from source (for SimpleITK)
RUN yes | pip install scikit-build

# install datascience packages
ADD ./config/requirements*.txt /home/${PYTHON_USER}/
RUN yes | pip install -r /home/${PYTHON_USER}/requirements_base.txt
#RUN yes | pip install -r /home/${PYTHON_USER}/requirements_nlp.txt
RUN yes | pip install -r /home/${PYTHON_USER}/requirements.txt

# lightgbm
RUN git clone --recursive https://github.com/microsoft/LightGBM
RUN mkdir -p LightGBM/build && \
    cd LightGBM/build && \
    cmake -DUSE_GPU=1 .. &&\
    make -j$(nproc)
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

RUN yes | pip install -f \
    https://h2o-release.s3.amazonaws.com/h2o/latest_stable_Py.html h2o

RUN yes | pip install \
    tensorflow-gpu

ADD ./config/pycodestyle /home/${PYTHON_USER}/.config/pycodestyle
RUN chown -R ${PYTHON_USER}:${PYTHON_USER} /home/${PYTHON_USER}/.config/

USER ${PYTHON_USER}

ENV TF_FORCE_GPU_ALLOW_GROWTH=true

ENTRYPOINT tail -f /dev/null

# docker run --rm --gpus all pdsc_gpu
