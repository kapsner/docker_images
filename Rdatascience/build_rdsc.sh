#!/bin/bash

function rdsc_base {
    cd ../base_image
    ./build_base_image.sh
    cd ../Rdatascience

    printf "\nBuild rdsc_base image\n"
    docker build --build-arg BASEIMAGE=base_image:latest -f image_rdsc_base/Dockerfile -t rdsc_base .

    printf "\nBuild rdsc_headless image\n"
    docker build -f image_rdsc_headless/Dockerfile -t rdsc_headless .

}

function rdsc_quarto_hl {
    printf "\nBuild rdsc_quarto_headless image\n"
    docker build --build-arg BASEIMAGE=rdsc_headless:latest -f image_rdsc_quarto_headless/Dockerfile -t rdsc_quarto_hl .
}

function rdsc_rstudio {
    printf "\nBuild rdsc_rstudio image\n"
    docker build --build-arg BASEIMAGE=rdsc_headless:latest -f image_rdsc_rstudio/Dockerfile -t rdsc_rstudio .
}

function rdsc_bio {
    printf "\nBuild rdsc_bio image\n"
    docker build -f image_rdsc_bio/Dockerfile -t rdsc_bio .
}

function rdsc_rad {
    printf "\nBuild rdsc_rad image\n"
    docker build -f image_rdsc_rad/Dockerfile -t rdsc_rad .
}



### Parsing command line arguments:
usage="$(basename "$0")
_Flag: --quarto install rdsc_quarto_hl"
_Flag: --rstudio install rdsc_rstudio"
_Flag: --bio install rdsc_bio"
_Flag: --vision install rdsc_rad"

RSTUDIO=false
BIO=false
RAD=false

while [[ $# -gt 0 ]]
do
    key="$1"
    echo $key

    case $key in
        -r|--rstudio)
            RSTUDIO=true
            printf "\nCreating rstudio image"
            shift # past argument
        ;;

        -b|--bio)
            BIO=true
            printf "\nCreating bioinformatics image"
            shift # past argument
        ;;

        -v|--vision)
            RAD=true
            printf "\nCreating vision image"
            shift # past argument
        ;;

        *)    # unknown option
            echo -e "unknow parameter: $key"
            echo -e "$usage"
            exit 1
        ;;
    esac
done

# start building
rdsc_base

if $RSTUDIO || $BIO || $RAD; then
    rdsc_rstudio
    if $BIO; then
        rdsc_bio
    fi
    if $RAD; then
        rdsc_rad
    fi
else
    rdsc_quarto_hl
fi
