ARG BASEIMAGE

# GPU: gpu_base:latest
# else: pdsc_base_img:latest

FROM ${BASEIMAGE}

# set python user here
ENV PYTHON_USER=${USER}

RUN apt-get update && apt-get install -y --no-install-recommends \
    libgdcm-tools

# install python3-gdcm
RUN git clone https://github.com/malaterre/GDCM
RUN cd GDCM && \
    mkdir build
RUN cd GDCM/build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS=-fPIC -DCMAKE_CXX_FLAGS=-fPIC \
    -DGDCM_BUILD_SHARED_LIBS:BOOL=ON \
    -DGDCM_WRAP_PYTHON=ON PYTHON_EXECUTABLE=/usr/local/bin/python3 \
    PYTHON_INCLUDE_DIR=/usr/local/lib/python3/dist-packages/ \
    GDCM_BUILD_SHARED_LIBS=ON GDCM_USE_VTK=ON /GDCM/ && \
    cmake --build . --target install

RUN cp /usr/local/lib/gdcm.py /usr/lib/python3/dist-packages/.
RUN cp /usr/local/lib/gdcmswig.py /usr/lib/python3/dist-packages/.
RUN cp /usr/local/lib/_gdcmswig.so /usr/lib/python3/dist-packages/.
RUN cp /usr/local/lib/libgdcm* /usr/lib/python3/dist-packages/.
RUN ldconfig

RUN rm -rf GDCM

# install scikit-build from source (for SimpleITK)
RUN yes | pip install scikit-build

# install datascience packages
ADD ./config/requirements*.txt /home/${PYTHON_USER}/
RUN yes | pip install -r /home/${PYTHON_USER}/requirements_base.txt
#RUN yes | pip install -r /home/${PYTHON_USER}/requirements_nlp.txt
RUN yes | pip install -r /home/${PYTHON_USER}/requirements.txt

ENV PATH=/home/${PYTHON_USER}/.local/bin:${PATH}

########################
# clear caches
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*
RUN rm -rf ~/.cache/pip/*
RUN apt-get clean && apt-get autoclean && apt-get autoremove -y

########################
