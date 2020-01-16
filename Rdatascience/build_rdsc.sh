#!/bin/bash

printf "\nBuild r_datascience\n"
docker build -f Dockerfile -t rdsc_base .
#docker build -f bio/Dockerfile -t rdsc_bio .
