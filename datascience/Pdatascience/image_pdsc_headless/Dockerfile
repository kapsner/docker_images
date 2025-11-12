#######################
### Final image
#######################
FROM pdsc_base:latest

SHELL ["/bin/bash", "-c"]

########################
# build libraries from source
USER ${PYTHON_USER}    

########################
# install other datascience libraries
RUN source activate base && \
    uv pip install --system \
    -r /home/${PYTHON_USER}/requirements_datascience.txt

########################
RUN conda clean -ya
USER root

ADD ./config/pycodestyle /home/${PYTHON_USER}/.config/pycodestyle
RUN chown -R ${PYTHON_USER}:${PYTHON_USER} /home/${PYTHON_USER}/.config/
    
########################

RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    rm -rf /root/.cache/uv/* && \
    rm -rf /home/${USER}/.cache/uv/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
