FROM pdsc_jpylab_gpu:latest

ARG UID=${UID}
ARG GID=${GID}

USER root 

RUN usermod -o -u ${UID} ${PYTHON_USER}
RUN groupmod -o -g ${GID} ${PYTHON_USER}

USER ${PYTHON_USER}
