#!/bin/bash

printf "\nBuild r_datascience\n"
docker build -f Dockerfile -t rdc_base .
#docker build -f Dockerfile.gpu -t rdc_gpu .
#docker build -f Dockerfile.bio -t rdc_bio .
