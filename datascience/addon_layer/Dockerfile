ARG BASEIMAGE

FROM ${BASEIMAGE}

USER root

ADD addon_layer/.env /home/${USER}/.nodeenv
ARG NVM_VERSION
ENV NVM_VERSION=$NVM_VERSION

ARG NODE_VERSION
ENV NODE_VERSION=$NODE_VERSION

# Define Path variable here
ENV PATH=${PATH}

########################
# add nvm/node/npm for gemini

# https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-in-docker
ENV NVM_DIR=/home/${USER}/.nvm \
    OPT_USER_DIR=/opt/${USER}
# update path variable
ENV PATH=${NVM_DIR}/versions/node/v${NODE_VERSION}/bin:${PATH}
RUN mkdir -p ${NVM_DIR} && \
    chown -R ${USER}:${USER} ${NVM_DIR} && \
    mkdir -p ${OPT_USER_DIR} && \
    chown -R ${USER}:${USER} ${OPT_USER_DIR}
RUN cd /home/${USER}/ && \
    echo "export NVM_DIR=${NVM_DIR}" >> .termrc && \
    echo 'source $NVM_DIR/nvm.sh' >> .termrc

USER ${USER}
# Download and install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash

# add gemini-cli
RUN cd ${OPT_USER_DIR} && \
    git clone https://github.com/google-gemini/gemini-cli.git

RUN cd ${OPT_USER_DIR}/gemini-cli && \
    source ${NVM_DIR}/nvm.sh && \
    npm install

# add temp-folder for projects
RUN cd /home/${USER}/ && mkdir gemini_temp

USER root
RUN cd ${OPT_USER_DIR}/gemini-cli && \
    cp bundle/gemini.js /usr/local/bin/gemini.js && \
    chmod +x /usr/local/bin/gemini.js && \
    chown ${USER}:${USER} /usr/local/bin/gemini.js && \
    echo "alias gemini='/usr/local/bin/gemini.js'" >> /home/${USER}/.bash_aliases && \
    rm -rf ${OPT_USER_DIR}/gemini-cli

########################
# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
# add PATH to a bash_profile script (workaround so that path is available in positron's terminal)
# to make this working, this must be sourced during container-start
RUN echo "export PATH=${PATH}" > /home/${USER}/.bash_profile && \
    chmod +x /home/${USER}/.bash_profile && \
    chown -R ${USER}:${USER} /home/${USER}/.bash_profile

########################
# same entrypoint as positron headless
WORKDIR /home/${USER}

USER ${USER}

# entrypoint
SHELL ["/bin/bash", "-c"]
ENTRYPOINT ["/start.sh"]
