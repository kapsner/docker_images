#!/bin/bash

function pdsc_cpu {
    cd base_image
    ./build_base_image.sh
    cd ../Pdatascience

    printf "\nBuild pdsc_base image\n"
    docker build --build-arg BASEIMAGE=base_image:latest -f image_pdsc_base/Dockerfile -t pdsc_base .

    printf "\nBuild pdsc_headless_prep image\n"
    docker build -f image_pdsc_headless/Dockerfile -t pdsc_headless_prep .
    cd ..
    printf "\nBuild pdsc_headless image\n"
    docker build \
      --build-arg BASEIMAGE=pdsc_headless_prep:latest \
      -f positron_headless/Dockerfile \
      -t pdsc_headless .
    printf "\nBuild pdsc_headless_plus image\n"
    cd addon_layer
    source prep.sh
    # export envvars
    export $(grep -v '^#' .env | xargs)
    cd ..
    docker build \
      --build-arg BASEIMAGE=pdsc_headless:latest \
      --build-arg NVM_VERSION=$NVM_VERSION \
      --build-arg NODE_VERSION=$NODE_VERSION \
      -f addon_layer/Dockerfile \
      -t pdsc_headless_plus .
}

function pdsc_gpu {
    export BUILD_RUNTIME_IMG=nvidia/cuda:12.8.1-cudnn-runtime-ubuntu24.04

    cd base_image
    ./build_base_image_gpu.sh
    cd ../Pdatascience

    printf "\nBuild pdsc_gpu_nobuild image\n"
    docker build -f image_pdsc_gpu/Dockerfile.nobuild -t pdsc_gpu_nobuild .

    printf "\nBuild pdsc_gpu_base image\n"
    docker build --build-arg BASEIMAGE=pdsc_gpu_nobuild:latest -f image_pdsc_base/Dockerfile -t pdsc_gpu_base .

    printf "\nBuild pdsc_gpu_prep image\n"
    docker build -f image_pdsc_gpu/Dockerfile -t pdsc_gpu_prep .

    cd ..
    printf "\nBuild pdsc_headless_gpu image\n"
    docker build \
      --build-arg BASEIMAGE=pdsc_gpu_prep:latest \
      -f positron_headless/Dockerfile \
      -t pdsc_headless_gpu .
    cd addon_layer
    source prep.sh
    # export envvars
    export $(grep -v '^#' .env | xargs)
    cd ..
    docker build \
      --build-arg BASEIMAGE=pdsc_headless_gpu_plus:latest \
      --build-arg NVM_VERSION=$NVM_VERSION \
      --build-arg NODE_VERSION=$NODE_VERSION \
      -f addon_layer/Dockerfile \
      -t pdsc_headless_plus .
}

function pdsc_gpu_build {
    export BUILD_DEVEL_IMG=nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04
    export BUILD_RUNTIME_IMG=nvidia/cuda:12.4.1-cudnn-runtime-ubuntu22.04

    # build basic build image ontop of nvidia/cuda-devel container
    printf "\nBuild base_gpu_build image\n"
    cd base_image_gpu
    ./build_base_gpu_build.sh

    printf "\nBuild pdsc_gpu_build image\n"
    docker build -f Dockerfile.py -t pdsc_gpu_build .

    # build final image ontop of nvidia/cuda-runtime container
    # (could happen in parallel to first 2 steps in the future)
    cd base_image
    ./build_base_image_gpu.sh

    cd ../Pdatascience/
    printf "\nBuild pdsc_gpu_multistage image\n"
    docker build -f image_pdsc_gpu/Dockerfile.multi -t pdsc_gpu_multistage .

    printf "\nBuild pdsc_gpu_base image\n"
    docker build --build-arg BASEIMAGE=pdsc_gpu_multistage:latest -f image_pdsc_base/Dockerfile -t pdsc_gpu_base .

    printf "\nBuild pdsc_gpu image\n"
    docker build -f image_pdsc_gpu/Dockerfile -t $last_layer_from .
}

function pdsc_final_layer {
    printf "\nBuild $ide image\n"
    docker build --build-arg BASEIMAGE=$last_layer_from:latest -f image_pdsc_$ide/Dockerfile -t $final_image_name .
}

### Parsing command line arguments:
usage="$(basename "$0")
_Flag: --gpu install gpu-version
_Flag: --buildgpu build pytorch from scratch
_Flag: --vscode install vscode instead of juypterlab"

GPU=false
VSCODE=false
GBUILD=false

while [[ $# -gt 0 ]]
do
    key="$1"
    echo $key

    case $key in
        -g|--gpu)
            GPU=true
            printf "\nBuilding GPU image"
            shift # past argument
        ;;

        -b|--buildgpu)
            GBUILD=true
            shift # past argument
        ;;
    esac
done


if $GPU; then
    last_layer_from="pdsc_gpu"
    final_img_suffix="gpu"
    if $GBUILD; then
        pdsc_gpu_build
    else
        pdsc_gpu
    fi
else
    pdsc_cpu
fi
