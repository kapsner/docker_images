#!/bin/bash

printf "\nBuild mail-alert image\n"
docker build -f Dockerfile -t mail-alert .
