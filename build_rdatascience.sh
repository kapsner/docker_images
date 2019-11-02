#!/bin/bash

printf "\nBuild r_datascience\n"
docker build -f Dockerfile -t r_datascience .
