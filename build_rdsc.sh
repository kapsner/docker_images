#!/bin/bash
set -e 
set -o pipefail

## Get version tag and registry-prefix from .env:
source ./.env
export DOCKER_BUILDKIT=1

## Create a new multi-architecture builder (if you have no one yet):
# docker buildx create --name mybuilder
# docker buildx use mybuilder

## Should the docker building process build without caching? (true/false)
docker_build_no_cache=true

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
printf "\n\nBuilding $REGISTRY_PREFIX/$IMAGE_NAME image (latest):\n"

# --platform linux/amd64,linux/arm64 \
# --progress=plain \
# docker buildx build \
docker build \
    --progress=plain \
    --no-cache=${docker_build_no_cache} \
    --label "org.label-schema.name=joundso/$IMAGE_NAME" \
    --label "org.label-schema.vsc-url=https://github.com/joundso/r_datascience/blob/master/Dockerfiles/$IMAGE_NAME.dockerfile" \
    --label "org.label-schema.vcs-ref=$(git rev-parse HEAD)" \
    --label "org.label-schema.version=$(date -u +'%Y-%m-%dT%H:%M:%SZ')" \
    -f ./Dockerfiles/$IMAGE_NAME.dockerfile \
    -t $REGISTRY_PREFIX/$IMAGE_NAME . 2>&1 | tee ./log_$IMAGE_NAME.log

printf "\n\nPushing $IMAGE_NAME image (latest)\n"
# Push new image as new 'latest':
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
docker build \
    --progress=plain \
    --no-cache=${docker_build_no_cache} \
    --label "org.label-schema.name=joundso/$IMAGE_NAME" \
    --label "org.label-schema.vsc-url=https://github.com/joundso/r_datascience/blob/master/Dockerfiles/$IMAGE_NAME.dockerfile" \
    --label "org.label-schema.vcs-ref=$(git rev-parse HEAD)" \
    --label "org.label-schema.version=$(date -u +'%Y-%m-%dT%H:%M:%SZ')" \
    -f ./Dockerfiles/$IMAGE_NAME.dockerfile \
    -t $REGISTRY_PREFIX/$IMAGE_NAME . 2>&1 | tee ./log_$IMAGE_NAME.log
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
docker build \
    --progress=plain \
    --no-cache=${docker_build_no_cache} \
    --label "org.label-schema.name=joundso/$IMAGE_NAME" \
    --label "org.label-schema.vsc-url=https://github.com/joundso/r_datascience/blob/master/Dockerfiles/$IMAGE_NAME.dockerfile" \
    --label "org.label-schema.vcs-ref=$(git rev-parse HEAD)" \
    --label "org.label-schema.version=$(date -u +'%Y-%m-%dT%H:%M:%SZ')" \
    -f ./Dockerfiles/$IMAGE_NAME.dockerfile \
    -t $REGISTRY_PREFIX/$IMAGE_NAME . 2>&1 | tee ./log_$IMAGE_NAME.log
printf "\n\nPushing $IMAGE_NAME image (latest)\n"
# push new image as new 'latest':
docker push "$REGISTRY_PREFIX/$IMAGE_NAME"
# also tag it with the new tag:
docker tag $REGISTRY_PREFIX/$IMAGE_NAME $REGISTRY_PREFIX/$IMAGE_NAME:$VERSION_TAG
# and also push this (tagged) image:
printf "\n\nPushing $IMAGE_NAME image ($VERSION_TAG)\n"
docker push "$REGISTRY_PREFIX/$IMAGE_NAME:$VERSION_TAG"

## Environment variables:
## Since handing over the environement variables over docker-compose is broken
## see <https://github.com/rstudio/renv/issues/446>.
IMAGE_NAME=rdsc_final_j
printf "\n\n##################################\n"
printf "$IMAGE_NAME"
printf "\n##################################\n"
printf "\nPulling cached $IMAGE_NAME image\n"
# build new image (latest):
printf "\n\nBuilding $IMAGE_NAME image\n"

docker build \
    --progress=plain \
    --no-cache=${docker_build_no_cache} \
    --label "org.label-schema.name=joundso/$IMAGE_NAME" \
    --label "org.label-schema.vsc-url=https://github.com/joundso/r_datascience/blob/master/Dockerfiles/$IMAGE_NAME.dockerfile" \
    --label "org.label-schema.vcs-ref=$(git rev-parse HEAD)" \
    --label "org.label-schema.version=$(date -u +'%Y-%m-%dT%H:%M:%SZ')" \
    --build-arg DISPLAY=${DISPLAY} \
    -f ./Dockerfiles/$IMAGE_NAME.dockerfile \
    -t $REGISTRY_PREFIX/rdsc_rstudio_j . 2>&1 | tee ./log_$IMAGE_NAME.log
docker tag $REGISTRY_PREFIX/rdsc_rstudio_j $REGISTRY_PREFIX/rdsc_rstudio_j:$VERSION_TAG
## Don't push this image! It contains the potential sensitive env vars!

echo 'Hooray :-)'
exit 0
