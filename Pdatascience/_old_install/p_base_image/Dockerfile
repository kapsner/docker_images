FROM base_image:latest

# install ubuntu requirements
RUN apt-get update && apt-get install -y --no-install-recommends python3-yaml python3-h5py

# install pip requirements
RUN yes | pip3 install setuptools wheel

# install jupyter
RUN python3 -m pip install jupyter


# install datascience packages
RUN yes | pip3 install \
    bokeh

RUN yes | pip3 install \
    catboost \
    "colorama>=0.3.8" \
    cython

RUN yes | pip3 install \
    eli5

RUN yes | pip3 install \
    fasttext \
    future

RUN yes | pip3 install \
    gensim

RUN yes | pip3 install -f \
    https://h2o-release.s3.amazonaws.com/h2o/latest_stable_Py.html h2o

RUN yes | pip3 install \
    ipython

RUN yes | pip3 install \
    keras

RUN yes | pip3 install \
    lightgbm

RUN yes | pip3 install \
    matplotlib

RUN yes | pip3 install \
    nltk \
    nose \
    numpy

RUN yes | pip3 install \
    pandas \
    plotly \
    psycopg2-binary

RUN yes | pip3 install \
    requests

RUN yes | pip3 install \
    scikit-learn \
    scipy \
    scrapy \
    seaborn \
    spacy \
    statsmodels \
    sympy

RUN yes | pip3 install \
    tabulate \
    tensorflow 

RUN yes | pip3 install \
    xgboost


# install prerquesites for code highlighting etc
RUN yes | pip3 install yapf autopep8 jupyterthemes ipyparallel pylint
