FROM pdsc_gpu_base:latest

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
