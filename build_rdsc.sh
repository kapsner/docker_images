#!/bin/bash

## Get version tag and registry-prefix from .env:
source ./.env

printf "\n\n##################################\n"
printf "Building images with version tag $VERSION_TAG"
printf "\n##################################\n"


printf "\n\nPlease insert your login credentials to registry: $REGISTRY_PREFIX ...\n"
docker login

## Base image:
IMAGE_NAME=rdsc_base_j
printf "\n\n##################################\n"
printf "$IMAGE_NAME"
printf "\n##################################\n"
printf "\nPulling cached $IMAGE_NAME image\n"
# pull latest image for caching:
docker pull $REGISTRY_PREFIX/$IMAGE_NAME
# build new image (latest):
printf "\n\nBuilding $IMAGE_NAME image\n"
docker build --progress=plain -f image_$IMAGE_NAME/Dockerfile -t $REGISTRY_PREFIX/$IMAGE_NAME . 2>&1 | tee ./log_$IMAGE_NAME.log
printf "\n\nPushing $IMAGE_NAME image (latest)\n"
# push new image as new 'latest':
docker push "$REGISTRY_PREFIX/$IMAGE_NAME"
# also tag it with the new tag:
docker tag $REGISTRY_PREFIX/$IMAGE_NAME $REGISTRY_PREFIX/$IMAGE_NAME:$VERSION_TAG
# and also push this (tagged) image:
printf "\n\nPushing $IMAGE_NAME image ($VERSION_TAG)\n"
docker push "$REGISTRY_PREFIX/$IMAGE_NAME:$VERSION_TAG"


## Headless image:
IMAGE_NAME=rdsc_headless_j
printf "\n\n##################################\n"
printf "$IMAGE_NAME"
printf "\n##################################\n"
printf "\nPulling cached $IMAGE_NAME image\n"
# pull latest image for caching:
docker pull $REGISTRY_PREFIX/$IMAGE_NAME
# build new image (latest):
printf "\n\nBuilding $IMAGE_NAME image\n"
docker build --progress=plain -f image_$IMAGE_NAME/Dockerfile -t $REGISTRY_PREFIX/$IMAGE_NAME . 2>&1 | tee ./log_$IMAGE_NAME.log
printf "\n\nPushing $IMAGE_NAME image (latest)\n"
# push new image as new 'latest':
docker push "$REGISTRY_PREFIX/$IMAGE_NAME"
# also tag it with the new tag:
docker tag $REGISTRY_PREFIX/$IMAGE_NAME $REGISTRY_PREFIX/$IMAGE_NAME:$VERSION_TAG
# and also push this (tagged) image:
printf "\n\nPushing $IMAGE_NAME image ($VERSION_TAG)\n"
docker push "$REGISTRY_PREFIX/$IMAGE_NAME:$VERSION_TAG"


## Rstudio image:
IMAGE_NAME=rdsc_rstudio_j
printf "\n\n##################################\n"
printf "$IMAGE_NAME"
printf "\n##################################\n"
printf "\nPulling cached $IMAGE_NAME image\n"
# pull latest image for caching:
docker pull $REGISTRY_PREFIX/$IMAGE_NAME
# build new image (latest):
printf "\n\nBuilding $IMAGE_NAME image\n"
docker build -f image_$IMAGE_NAME/Dockerfile -t $REGISTRY_PREFIX/$IMAGE_NAME --no-cache . 2>&1 | tee ./log_$IMAGE_NAME.log
printf "\n\nPushing $IMAGE_NAME image (latest)\n"
# push new image as new 'latest':
docker push "$REGISTRY_PREFIX/$IMAGE_NAME"
# also tag it with the new tag:
docker tag $REGISTRY_PREFIX/$IMAGE_NAME $REGISTRY_PREFIX/$IMAGE_NAME:$VERSION_TAG
# and also push this (tagged) image:
printf "\n\nPushing $IMAGE_NAME image ($VERSION_TAG)\n"
docker push "$REGISTRY_PREFIX/$IMAGE_NAME:$VERSION_TAG"
