ARG BASEIMAGE

FROM ${BASEIMAGE}


USER root

# install openssh, sudo and cifs-utils here
RUN apt-get update && apt-get install -y --no-install-recommends \
    # ripgrep required for deepagents-cli
    ripgrep
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# Define Path variable here
ENV PATH=${PATH}

USER ${USER}

# add gemini-cli
# https://github.com/google-gemini/gemini-cli?tab=readme-ov-file#install-with-anaconda-for-restricted-environments
RUN conda update -n base -c defaults conda
RUN conda create -y -n gemini_env -c conda-forge nodejs && \
    source activate gemini_env && \
    npm install -g npm@latest && \
    npm install -g @google/gemini-cli@latest

# add temp-folder for projects and add user-settings
ENV SETTINGS_BASE_URL=https://raw.githubusercontent.com/kapsner/scripts-n-configs/refs/heads/main
RUN cd /home/${USER}/ && mkdir gemini_temp && cd gemini_temp && \
    curl -o settings.json.bu \
    ${SETTINGS_BASE_URL}/configs/settings/gemini-settings.json && \
    chown -R ${USER}:${USER} settings.json.bu

# nanocoder: need to run tool with 'NODE_TLS_REJECT_UNAUTHORIZED=0 nanocoder'
# when connecting to locally deployed ollama with self-signed certificate
RUN conda create -y -n nanocoder_env -c conda-forge nodejs && \
    source activate nanocoder_env && \
    npm install -g npm@latest && \
    npm install -g @nanocollective/nanocoder@latest
RUN cd /home/${USER}/ && mkdir -p .config/nanocoder && cd .config/nanocoder && \
    curl -o agents.config.json \
    ${SETTINGS_BASE_URL}/configs/settings/nanocoder-agents.config.json && \
    chown -R ${USER}:${USER} agents.config.json

# add deepagents cli
# Ollama: https://docs.langchain.com/oss/python/deepagents/cli/overview
# Envvars to set:
# - export OPENAI_API_KEY=your_api_key (and OPENAI_BASE_URL when using ollama)
# - export GOOGLE_API_KEY=your_api_key
RUN source activate base && \
    uv pip install --system 'deepagents-cli[google-genai,ollama]' mitmproxy certifi

# need to append self-signed certificate to $(python -c "import certifi; certifi.where())"), i.e.
# echo "$(cat ./self-signed-cert.pem)" >> $(python -c "import certifi; print(certifi.where())")
RUN conda create -y -n nanocoder_env -c conda-forge nodejs && \
    source activate nanocoder_env && \
    npm install -g @nanocollective/nanocoder@latest
RUN cd /home/${USER}/ && mkdir -p .deepagents && cd .deepagents && \
    curl -o config.toml \
    ${SETTINGS_BASE_URL}/configs/settings/deepagents-config.toml && \
    chown -R ${USER}:${USER} config.toml

# install claude-code: https://github.com/anthropics/claude-code
# Ollama: https://docs.ollama.com/integrations/claude-code
# Envvars to set:
# - export ANTHROPIC_AUTH_TOKEN=your-ollama/openwebui-api-key
# - export ANTHROPIC_API_KEY=""
# - export ANTHROPIC_BASE_URL=http://localhost:11434
# when using self-deployed server with self-signed certificate:
# NODE_TLS_REJECT_UNAUTHORIZED=0 claude --model gpt-oss:120b
RUN conda create -y -n claude_env -c defaults conda && \
    source activate claude_env && \
    curl -fsSL https://claude.ai/install.sh | bash

ENV CLAUDE_ENV_PATH=$(conda info --json | jq -r '.envs[]' | grep claude_env)
RUN cp -rf --update /home/${USER}/.local/share/claude* $CLAUDE_ENV_PATH/share && \
    rm -rf ~/.local/share/claude*
ENV CLAUDE_VER=$(cd $CLAUDE_ENV_PATH/share/claude/versions && ls -Art | tail -n 1)
RUN ln -s "$CLAUDE_ENV_PATH/share/claude/versions/$CLAUDE_VER" "$CLAUDE_ENV_PATH/bin/claude" && \
    rm -rf ~/.local/bin/claude && \
    ln -s "$CLAUDE_ENV_PATH/bin/claude" ~/.local/bin/claude && \
    mkdir -p $CLAUDE_ENV_PATH/state && \
    cp -rf --update ~/.local/state/claude* $CLAUDE_ENV_PATH/state && \
    rm -rf ~/.local/state/claude*

########################

USER root

ADD addon_layer/config/ide-integration.sh /home/${USER}/
RUN cd /home/${USER}/ && \
    chmod +x ide-integration.sh && \
    chown ${USER}:${USER} ide-integration.sh && \
    echo "source ~/ide-integration.sh" >> .termrc

########################

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
