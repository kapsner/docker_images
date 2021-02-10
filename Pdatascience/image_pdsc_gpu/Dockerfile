# multistage image here

FROM pdsc_gpu_base:latest

########################
USER ${PYTHON_USER}

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
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
# personalize image
ADD ./config/pycodestyle /home/${PYTHON_USER}/.config/pycodestyle
RUN chown -R ${PYTHON_USER}:${PYTHON_USER} /home/${PYTHON_USER}/.config/

# fix permissions in home folder
RUN chown -R ${PYTHON_USER}:${PYTHON_USER} /home/${PYTHON_USER}/.local

########################

USER ${PYTHON_USER}

ENV TF_FORCE_GPU_ALLOW_GROWTH=true

ENTRYPOINT tail -f /dev/null

# docker run --rm --gpus all pdsc_gpu
