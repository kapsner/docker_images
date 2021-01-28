FROM pdsc_jpylab_gpu:latest

ARG UID=${UID}
ARG GID=${GID}

USER root 

RUN usermod -u ${UID} ${PYTHON_USER}
RUN groupmod -g ${GID} ${PYTHON_USER}

USER ${PYTHON_USER}
