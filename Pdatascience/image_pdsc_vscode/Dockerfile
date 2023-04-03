ARG BASEIMAGE

FROM ${BASEIMAGE}

# https://code.visualstudio.com/blogs/2022/07/07/vscode-server
# https://coder.com/docs/code-server/latest/install

ENV DOCKER_USER=$USER

USER ${PYTHON_USER}

# install code server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# install extensions
RUN code-server --install-extension 'grapecity.gc-excelviewer' && \
    code-server --install-extension 'ms-python.python' &&\
    code-server --install-extension 'ms-python.vscode-pylance'

RUN conda clean -ya
USER root

########################
# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################

WORKDIR /home/${PYTHON_USER}
USER ${PYTHON_USER}

ENTRYPOINT code-server \
    --disable-telemetry \
    --disable-update-check \
    --bind-addr 0.0.0.0:$PORT
