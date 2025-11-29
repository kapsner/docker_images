# multistage image here

FROM pdsc_gpu_base:latest

SHELL ["/bin/bash", "-c"]

########################
USER ${PYTHON_USER}

# install other datascience libraries
RUN source activate base && \
    uv pip install --system \
    -r /home/${PYTHON_USER}/requirements_datascience.txt

########################
# install other GPU learning libraries
# (currently don't need them)
# RUN source activate basee && uv pip install --system -f \
#     https://h2o-release.s3.amazonaws.com/h2o/latest_stable_Py.html h2o

# RUN source activate basee && uv pip install --system \
#     tensorflow-gpu

########################
# clear caches
RUN conda clean -ya
USER root

########################
# personalize image
ADD ./config/pycodestyle /home/${PYTHON_USER}/.config/pycodestyle
RUN chown -R ${PYTHON_USER}:${PYTHON_USER} /home/${PYTHON_USER}/.config/

########################

RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    rm -rf /root/.cache/uv/* && \
    rm -rf /home/${USER}/.cache/uv/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
