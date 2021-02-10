ARG BASEIMAGE

FROM ${BASEIMAGE}

USER ${PYTHON_USER}

# install jupyter lab
RUN yes | pip install \
    jupyterlab \
    jupyterlab-lsp \
    'python-language-server[all]'

RUN conda clean -ya
USER root

# Add configfiles
ENV CFG_PATH=/home/${PYTHON_USER}/.jupyter/lab/user-settings/@jupyterlab/apputils-extension/
RUN mkdir -p ${CFG_PATH}
COPY ./config/jupyterlab/themes.jupyterlab-settings ${CFG_PATH}

ENV CFG_PATH=/home/${PYTHON_USER}/.jupyter/lab/user-settings/@krassowski/jupyterlab-lsp/
RUN mkdir -p ${CFG_PATH}
COPY ./config/jupyterlab/plugin.jupyterlab-settings ${CFG_PATH}

# fix permissions
RUN chown -R ${PYTHON_USER}:${PYTHON_USER} /home/${PYTHON_USER}/.jupyter/

ENV JP_LSP_VIRTUAL_DIR=/home/${PYTHON_USER}/.virtual_documents/

########################
# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################

# fix permissions in home folder
RUN chown -R ${PYTHON_USER}:${PYTHON_USER} /home/${PYTHON_USER}/.local

USER ${PYTHON_USER}

# run jupyter lab from users home directory
# --allow-root flag unfortunatelly required to get enry working with docker-compose
ENTRYPOINT cd /home/${PYTHON_USER} && \
    jupyter lab --no-browser --ip=0.0.0.0
