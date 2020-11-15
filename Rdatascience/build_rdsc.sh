#!/bin/bash

REGISTRY_PREFIX=joundso
VERSION_TAG=0.0.1.9002

printf "\n\nPlease insert your login credentials to registry: $REGISTRY_PREFIX ...\n"
docker login

printf "joundso:"

## Base image:
IMAGE_NAME=rdsc_base_j
printf "\nBuilding $IMAGE_NAME image\n"
# pull latest image for caching:
docker pull $REGISTRY_PREFIX/$IMAGE_NAME
# build new image (latest):
docker build -f image_$IMAGE_NAME/Dockerfile -t $REGISTRY_PREFIX/$IMAGE_NAME .
printf "\nPushing $IMAGE_NAME image\n"
# push new image as new 'latest':
docker push "$REGISTRY_PREFIX/$IMAGE_NAME"
# also tag it with the new tag:
docker tag $REGISTRY_PREFIX/$IMAGE_NAME $REGISTRY_PREFIX/$IMAGE_NAME:$VERSION_TAG
# and also push this (tagged) image:
docker push "$REGISTRY_PREFIX/$IMAGE_NAME:$VERSION_TAG"


## Headless image:
IMAGE_NAME=rdsc_headless_j
printf "\nBuilding $IMAGE_NAME image\n"
# pull latest image for caching:
docker pull $REGISTRY_PREFIX/$IMAGE_NAME
# build new image (latest):
docker build -f image_$IMAGE_NAME/Dockerfile -t $REGISTRY_PREFIX/$IMAGE_NAME .
printf "\nPushing $IMAGE_NAME image\n"
# push new image as new 'latest':
docker push "$REGISTRY_PREFIX/$IMAGE_NAME"
# also tag it with the new tag:
docker tag $REGISTRY_PREFIX/$IMAGE_NAME $REGISTRY_PREFIX/$IMAGE_NAME:$VERSION_TAG
# and also push this (tagged) image:
docker push "$REGISTRY_PREFIX/$IMAGE_NAME:$VERSION_TAG"

## Rstudio image:
IMAGE_NAME=rdsc_rstudio_j
printf "\nBuilding $IMAGE_NAME image\n"
# pull latest image for caching:
docker pull $REGISTRY_PREFIX/$IMAGE_NAME
# build new image (latest):
docker build -f image_$IMAGE_NAME/Dockerfile -t $REGISTRY_PREFIX/$IMAGE_NAME .
printf "\nPushing $IMAGE_NAME image\n"
# push new image as new 'latest':
docker push "$REGISTRY_PREFIX/$IMAGE_NAME"
# also tag it with the new tag:
docker tag $REGISTRY_PREFIX/$IMAGE_NAME $REGISTRY_PREFIX/$IMAGE_NAME:$VERSION_TAG
# and also push this (tagged) image:
docker push "$REGISTRY_PREFIX/$IMAGE_NAME:$VERSION_TAG"
