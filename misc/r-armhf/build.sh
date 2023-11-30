#!/bin/bash

printf "\nBuild base_armhf image\n"
docker build -f Dockerfile -t base_armhf .
