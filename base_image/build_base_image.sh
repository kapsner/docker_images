#!/bin/bash

printf "\nBuild base_image image\n"
docker build --build-arg BASEIMAGE=ubuntu:24.04 --no-cache -f Dockerfile -t base_image .
