ARG BASEIMAGE

FROM ${BASEIMAGE}

USER root

# Define Path variable here
ENV PATH

USER ${USER}

# add gemini-cli
# https://github.com/google-gemini/gemini-cli?tab=readme-ov-file#install-with-anaconda-for-restricted-environments
RUN conda update -n base -c defaults conda
RUN conda create -y -n gemini_env -c conda-forge nodejs && \
    source activate gemini_env && \
    npm install -g npm@11.11.0 && \
    npm install -g @google/gemini-cli@latest

# add temp-folder for projects and add user-settings
ENV SETTINGS_BASE_URL=https://raw.githubusercontent.com/kapsner/scripts-n-configs/refs/heads/main
RUN cd /home/${USER}/ && mkdir gemini_temp && cd gemini_temp && \
    curl -o settings.json.bu \
    ${SETTINGS_BASE_URL}/configs/settings/gemini-settings.json && \
    chown -R ${USER}:${USER} settings.json.bu


# add deepagents cli
# https://docs.langchain.com/oss/python/deepagents/cli/overview
RUN source activate base && \
    uv tool install deepagents-cli

########################

USER root
# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    rm -rf /root/.cache/uv/* && \
    rm -rf /home/${USER}/.cache/uv/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
ENV PATH=/home/${USER}/.local/bin:${PATH}
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
