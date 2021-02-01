#######################
### Final image
#######################
FROM pdsc_base:latest

# Install packages
RUN yes | pip install -f \
    https://h2o-release.s3.amazonaws.com/h2o/latest_stable_Py.html h2o

RUN yes | pip install \
    lightgbm

RUN yes | pip install \
    tensorflow

RUN yes | pip install \
    xgboost

ADD ./config/pycodestyle /home/${PYTHON_USER}/.config/pycodestyle
RUN chown -R ${PYTHON_USER}:${PYTHON_USER} /home/${PYTHON_USER}/.config/

USER ${PYTHON_USER}

ENTRYPOINT tail -f /dev/null
