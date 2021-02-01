FROM rdsc_rstudio:latest
#FROM rdsc_headless:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-yaml \ 
    python3-venv

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

# switch back
USER root

# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /home/${RSTUDIO_USER}/.cache/pip/* && \
    apt-get clean && apt-get autoclean && apt-get autoremove
