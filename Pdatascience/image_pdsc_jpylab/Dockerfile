ARG BASEIMAGE

FROM ${BASEIMAGE}

USER root

# install jupyter lab
RUN pip install \
    jupyterlab \
    jupyterlab-lsp \
    'python-language-server[all]'


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
    rm -rf /tmp/*
RUN rm -rf ~/.cache/pip/*
RUN apt-get clean && apt-get autoclean && apt-get autoremove -y

########################

USER ${PYTHON_USER}

# run jupyter lab from users home directory
# --allow-root flag unfortunatelly required to get enry working with docker-compose
ENTRYPOINT cd /home/${PYTHON_USER} && \
    jupyter lab --no-browser --ip=0.0.0.0
