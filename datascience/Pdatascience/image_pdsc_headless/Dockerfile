#######################
### Final image
#######################
FROM pdsc_base:latest

########################
# build libraries from source
USER ${PYTHON_USER}    

########################
# install other datascience libraries
RUN yes | pip install -r /home/${PYTHON_USER}/requirements_datascience.txt

########################
RUN conda clean -ya
USER root

ADD ./config/pycodestyle /home/${PYTHON_USER}/.config/pycodestyle
RUN chown -R ${PYTHON_USER}:${PYTHON_USER} /home/${PYTHON_USER}/.config/

########################

# install sudo here, required for cifs-utils and mounting network drives
RUN apt-get update && apt-get install -y --no-install-recommends \
    cifs-utils \
    sudo
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# set ubuntu passowrd here
RUN echo ${USER}:password | chpasswd 
RUN echo ${USER} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USER} && \
    chmod 0440 /etc/sudoers.d/${USER}

# add PATH to a bash_profile script (workaround so that path is available in positron's terminal)
RUN echo "export PATH=${PATH}" >> /home/${PYTHON_USER}/.bash_profile && \
    chmod +x /home/${PYTHON_USER}/.bash_profile && \
    chown -R ${PYTHON_USER}:${PYTHON_USER} /home/${PYTHON_USER}/.bash_profile
    
########################

RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
