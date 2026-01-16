ARG BASEIMAGE

FROM ${BASEIMAGE}

USER root

# install openssh, sudo and cifs-utils here
RUN apt-get update && apt-get install -y --no-install-recommends \
    cifs-utils \
    sudo \
    openssh-server \
    zsh
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# set ubuntu password here (password required for ssh login)
RUN echo ${USER}:password | chpasswd 
RUN echo "${USER} ALL=(root) NOPASSWD: ALL" > /etc/sudoers.d/${USER} && \
    chmod 0440 /etc/sudoers.d/${USER}

########################
# setup ssh-server
# Generate new Host Keys in the dedicated directory
ENV SSHD_CONFIG_DIR="/home/${USER}/.ssh"
RUN mkdir -p ${SSHD_CONFIG_DIR} && \
    ssh-keygen -q -N "" -t rsa -b 4096 -f ${SSHD_CONFIG_DIR}/ssh_host_rsa_key && \
    ssh-keygen -q -N "" -t ecdsa -f ${SSHD_CONFIG_DIR}/ssh_host_ecdsa_key && \
    ssh-keygen -q -N "" -t ed25519 -f ${SSHD_CONFIG_DIR}/ssh_host_ed25519_key
# copy and modify sshd_config
RUN cp /etc/ssh/sshd_config ${SSHD_CONFIG_DIR}/ && \
    sed -i -E 's,^#?Port.*$,Port 2375,' ${SSHD_CONFIG_DIR}/sshd_config && \
    sed -i -E 's,^#?PasswordAuthentication.*$,PasswordAuthentication yes,' ${SSHD_CONFIG_DIR}/sshd_config && \
    sed -i -E 's,^#?StrictModes.*$,StrictModes no,' ${SSHD_CONFIG_DIR}/sshd_config && \
    echo "AllowUsers ${USER}" >> ${SSHD_CONFIG_DIR}/sshd_config && \
    echo "HostKey ${SSHD_CONFIG_DIR}/ssh_host_rsa_key" >> ${SSHD_CONFIG_DIR}/sshd_config && \
    echo "HostKey ${SSHD_CONFIG_DIR}/ssh_host_ecdsa_key" >> ${SSHD_CONFIG_DIR}/sshd_config && \
    echo "HostKey ${SSHD_CONFIG_DIR}/ssh_host_ed25519_key" >> ${SSHD_CONFIG_DIR}/sshd_config && \
    echo "PidFile ${SSHD_CONFIG_DIR}/sshd.pid" >> ${SSHD_CONFIG_DIR}/sshd_config
# Set ownership for the dedicated non-root SSHD runner
RUN chown -R ${USER} ${SSHD_CONFIG_DIR} && \
    # Set secure permissions on host keys
    chmod 600 ${SSHD_CONFIG_DIR}/* && \
    chmod 644 ${SSHD_CONFIG_DIR}/sshd_config

########################
# add PATH to a bash_profile script (workaround so that path is available in positron's terminal)
# to make this working, this must be sourced during container-start
ENV PATH=${PATH}
RUN echo "export PATH=${PATH}" >> /home/${USER}/.bash_profile && \
    chmod +x /home/${USER}/.bash_profile && \
    chown -R ${USER}:${USER} /home/${USER}/.bash_profile

########################
# Add alias script and script for automated installation of positron extensions
ADD positron_headless/config/alias.sh /home/${USER}/
ADD positron_headless/config/ide-extension-sync.sh /home/${USER}/
RUN cd /home/${USER}/ && \
    chmod +x alias.sh && \
    chmod +x ide-extension-sync.sh && \
    chown ${USER}:${USER} alias.sh && \
    chown ${USER}:${USER} ide-extension-sync.sh && \
    echo "source ~/alias.sh" >> .bashrc && \
    echo "source ~/ide-extension-sync.sh" >> .bashrc && \
    echo "git config --global credential.helper cache" >> .bashrc && \
    chmod +x .bashrc && \
    chown ${USER}:${USER} .bashrc

########################
# write .bash_aliases
RUN cd /home/${USER}/ && \
    echo "alias ll='ls -alF'" >> .bash_aliases && \
    echo "alias up='sudo apt update && sudo apt upgrade'" >> .bash_aliases && \
    chmod +x .bash_aliases && \
    chown ${USER}:${USER} .bash_aliases

########################
# Add user settings
RUN mkdir -p /home/${USER}/.positron-server/data/Machine/ && \
    chown -R ${USER}:${USER} /home/${USER}/.positron-server
ADD positron_headless/config/settings.json /home/${USER}/.positron-server/data/Machine/
RUN chown -R ${USER}:${USER} /home/${USER}/.positron-server/data/Machine/settings.json

# install zsh-mod
USER ${USER}
RUN sh -c "$(curl -fsSL https://install.ohmyz.sh/)"
USER root
RUN cd /home/${USER}/ && \
    wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/refs/heads/master/templates/zshrc.zsh-template && \
    mv zshrc.zsh-template .zshrc && \
    sed -i -E 's,^ZSH_THEME="robbyrussell",ZSH_THEME="agnoster",' ${SSHD_CONFIG_DIR}/sshd_config && \
    chmod 655 .zshrc && \
    chown ${USER}:${USER} .zshrc

########################
# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################

# add start.sh script
ADD positron_headless/config/start.sh /
RUN chmod +x /start.sh && \
    chown ${USER}:${USER} /start.sh

########################

WORKDIR /home/${USER}

USER ${USER}

# entrypoint
SHELL ["/bin/bash", "-c"]
ENTRYPOINT ["/start.sh"]
