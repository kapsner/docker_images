#!/bin/bash

function pdsc_cpu {
    cd ../base_image
    ./build_base_image.sh
    cd ../Pdatascience

    printf "\nBuild pdsc_base image\n"
    docker build --build-arg BASEIMAGE=base_image:latest -f image_pdsc_base/Dockerfile -t pdsc_base .

    printf "\nBuild pdsc_headless image\n"
    docker build -f image_pdsc_headless/Dockerfile -t $last_layer_from .
}

function pdsc_gpu_build {
    export BUILD_DEVEL_IMG=nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04
    export BUILD_RUNTIME_IMG=nvidia/cuda:12.4.1-cudnn-runtime-ubuntu22.04

    # build basic build image ontop of nvidia/cuda-devel container
    printf "\nBuild base_gpu_build image\n"
    cd ../build_image_gpu
    ./build_base_gpu_build.sh

    printf "\nBuild pdsc_gpu_build image\n"
    docker build -f Dockerfile.py -t pdsc_gpu_build .

    # build final image ontop of nvidia/cuda-runtime container
    # (could happen in parallel to first 2 steps in the future)
    cd ../base_image
    ./build_base_image_gpu.sh

    cd ../Pdatascience/
    printf "\nBuild pdsc_gpu_multistage image\n"
    docker build -f image_pdsc_gpu/Dockerfile.multi -t pdsc_gpu_multistage .

    printf "\nBuild pdsc_gpu_base image\n"
    docker build --build-arg BASEIMAGE=pdsc_gpu_multistage:latest -f image_pdsc_base/Dockerfile -t pdsc_gpu_base .

    printf "\nBuild pdsc_gpu image\n"
    docker build -f image_pdsc_gpu/Dockerfile -t $last_layer_from .
}

function pdsc_gpu_nobuild {
    export BUILD_RUNTIME_IMG=nvidia/cuda:12.4.1-cudnn-runtime-ubuntu22.04

    cd ../base_image
    ./build_base_image_gpu.sh

    cd ../Pdatascience/
    printf "\nBuild pdsc_gpu_nobuild image\n"
    docker build -f image_pdsc_gpu/Dockerfile.nobuild -t pdsc_gpu_nobuild .

    printf "\nBuild pdsc_gpu_base image\n"
    docker build --build-arg BASEIMAGE=pdsc_gpu_nobuild:latest -f image_pdsc_base/Dockerfile -t pdsc_gpu_base .

    printf "\nBuild pdsc_gpu image\n"
    docker build -f image_pdsc_gpu/Dockerfile -t pdsc_gpu .

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

        -v|--vscode)
            VSCODE=true
            shift # past argument
        ;;

        *)    # unknown option
            echo -e "unknow parameter: $key"
            echo -e "$usage"
            exit 1
        ;;
    esac
done


if $GPU; then
    last_layer_from="pdsc_gpu"
    final_img_suffix="gpu"
    if $GBUILD; then
        pdsc_gpu_build
    else
        pdsc_gpu_nobuild
    fi
else
    last_layer_from="pdsc_headless"
    final_img_suffix="cpu"
    pdsc_cpu
fi


if $VSCODE; then
    ide="vscode"
    final_image_name="pdsc_vscode_"$final_img_suffix
    pdsc_final_layer
#else
    # ide="jpylab"
    # final_image_name="pdsc_jpylab_"$final_img_suffix
fi

#pdsc_final_layer
