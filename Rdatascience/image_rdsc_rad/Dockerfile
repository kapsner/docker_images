FROM rdsc_rstudio:latest


# switch user (let everything in .virtualenv/r-reticulate be installed by the user)
# we can use pip here, since we added the virtualenv to the beginning of our PATH variable
USER ${RSESSION_USER}

# install additional python packages
ADD ./config/requirements_rad.txt /home/${RSESSION_USER}/
RUN yes | pip install -r /home/${RSESSION_USER}/requirements_rad.txt

########################
# clear caches
RUN conda clean -ya
USER root

RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    conda clean -ya && \
    apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
