ARG BASEIMAGE

FROM ${BASEIMAGE}

USER root

# install gdebi here, required to install rstudio
# (gdebi will fail without sudo)
RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-server
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# setup ssh-server
RUN sed -i -E 's,^#?Port.*$,Port 2375,' /etc/ssh/sshd_config && \
    sh -c "echo '${USER} ALL=(root) NOPASSWD: /usr/sbin/service ssh start' >/etc/sudoers.d/service-ssh-start"


########################
# Add script for automated installation of positron extensions
ADD positron_headless/config/positron-extension-sync.sh /home/${USER}/
RUN cd /home/${USER}/ && \
    chmod +x positron-extension-sync.sh && \
    echo "source ~/positron-extension-sync.sh" >> .bashrc


########################
# Add user settings
RUN mkdir -p /home/${USER}/.positron-server/data/Machine/ && \
    chown -R ${USER}:${USER} /home/${USER}/.positron-server
ADD positron_headless/config/settings.json /home/${USER}/.positron-server/data/Machine/
RUN chown -R ${USER}:${USER} /home/${USER}/.positron-server/data/Machine/settings.json


########################
# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################

# add start_new.sh script
ADD positron_headless/config/start_new.sh /
RUN chmod +x /start_new.sh && \
    chown ${USER}:${USER} /start_new.sh

########################

WORKDIR /home/${USER}

USER ${USER}

# entrypoint
SHELL ["/bin/bash", "-c"]
ENTRYPOINT ["/start_new.sh"]
