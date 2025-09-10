#######################
### Final image
#######################
FROM pdsc_base:latest

########################
# build libraries from source
USER ${PYTHON_USER}

# install torch / torchvision
RUN yes | pip install \
    torch \
    torchvision

########################
# install other datascience libraries
RUN yes | pip install -r /home/${PYTHON_USER}/requirements_datascience.txt

########################
# Install more packages
RUN yes | pip install -f \
    https://h2o-release.s3.amazonaws.com/h2o/latest_stable_Py.html h2o

RUN yes | pip install \
    lightgbm

RUN yes | pip install \
    tensorflow

RUN yes | pip install \
    xgboost

########################
RUN conda clean -ya
USER root

ADD ./config/pycodestyle /home/${PYTHON_USER}/.config/pycodestyle
RUN chown -R ${PYTHON_USER}:${PYTHON_USER} /home/${PYTHON_USER}/.config/

########################

# install sudo here, required for cifs-utils and mounting network drives
RUN apt-get update && apt-get install -y --no-install-recommends \
    cifs-utils \
    sudo \
    openssh-server
RUN apt-get clean && \ 
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# set ubuntu passowrd here
RUN echo ${USER}:password | chpasswd 
RUN echo ${USER} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USER} && \
    chmod 0440 /etc/sudoers.d/${USER}

# setup ssh-server
RUN sed -i -E 's,^#?Port.*$,Port 2375,' /etc/ssh/sshd_config && \
    sh -c "echo '${USER} ALL=(root) NOPASSWD: /usr/sbin/service ssh start' >/etc/sudoers.d/service-ssh-start"

# add PATH to a bash_profile script (workaround so that path is available in positron's terminal)
RUN echo "export PATH=${PATH}" >> /home/${PYTHON_USER}/.bash_profile && chmod +x /home/${PYTHON_USER}/.bash_profile

########################

RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
WORKDIR /home/${PYTHON_USER}

USER ${PYTHON_USER}

SHELL ["/bin/bash", "-c"]
ENTRYPOINT sudo service ssh restart && tail -f /dev/null
