#######################
### Final image
#######################
FROM pdsc_base:latest

# set python user here
ENV PYTHON_USER="user" 

# set frontend stuff
ENV DEBIAN_FRONTEND=noninteractive

# Install packages

RUN yes | pip install -f \
    https://h2o-release.s3.amazonaws.com/h2o/latest_stable_Py.html h2o

RUN yes | pip install \
    lightgbm

RUN yes | pip install \
    tensorflow

RUN yes | pip install \
    xgboost

USER ${PYTHON_USER}

ENTRYPOINT tail -f /dev/null
