#!/bin/bash

printf "\nBuild r_datascience\n"
docker build -f Dockerfile -t rdsc_base .
#docker build -f rdc_gpu/Dockerfile -t rdsc_gpu .
#docker build -f rdc_bio/Dockerfile -t rdsc_bio .
