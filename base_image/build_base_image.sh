#!/bin/bash

printf "\nBuild base_image image\n"
docker build --build-arg BASEIMAGE=ubuntu:20.10 -f Dockerfile -t base_image .
