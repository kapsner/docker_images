#!/bin/bash

printf "\nBuild rdsc_bayesian image\n"
docker build -f Dockerfile -t rdsc_bayesian .
