#!/bin/bash

REGISTRY_PREFIX=joundso
VERSION_TAG=0.0.1

printf "\n\nPlease insert your login credentials to registry: $REGISTRY_PREFIX ...\n"
docker login

printf "joundso:"
IMAGE_NAME=rdsc_base_j
printf "\nBuilding $IMAGE_NAME image\n"
docker build -f image_rdsc_base/Dockerfile -t $REGISTRY_PREFIX/$IMAGE_NAME:$VERSION_TAG .
printf "\nPushing rdsc_base image\n"
# docker tag "$REGISTRY_PREFIX/$IMAGE_NAME$VERSION_TAG" "$REGISTRY_PREFIX/$IMAGE_NAME:$VERSION_TAG"
docker push "$REGISTRY_PREFIX/$IMAGE_NAME:$VERSION_TAG"

# printf "\nBuilding rdsc_headless image\n"
# docker build -f image_rdsc_headless/Dockerfile -t rdsc_headless_j .

# printf "\nBuilding rdsc_rstudio image\n"
# docker build -f image_rdsc_rstudio/Dockerfile -t rdsc_rstudio_j .
