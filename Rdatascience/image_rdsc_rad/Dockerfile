FROM rdsc_rstudio:latest


# switch user (let everything in .virtualenv/r-reticulate be installed by the user)
# we can use pip here, since we added the virtualenv to the beginning of our PATH variable
USER ${RSESSION_USER}

# install additional python packages
RUN yes | pip install \
    dicom2nifti

RUN yes | pip install \
    imgaug

RUN yes | pip install \
    nibabel

RUN yes | pip install \
    opencv-python

RUN yes | pip install \
    pydicom 

RUN yes | pip install \
    requests

RUN yes | pip install \
    scikit-image \ 
    SimpleITK

########################
# clear caches
RUN conda clean -ya
USER root

RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*
RUN rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/*
RUN conda clean -ya
RUN apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
