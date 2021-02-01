FROM pdsc_gpu_base:latest

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
