#!/bin/bash

function rdsc_base {
    cd base_image
    ./build_base_image.sh
    cd ../Rdatascience

    printf "\nBuild rdsc_base image\n"
    docker build --build-arg BASEIMAGE=base_image:latest -f image_rdsc_base/Dockerfile -t rdsc_base .

    printf "\nBuild rdsc_hl_base image\n"
    docker build -f image_rdsc_headless/Dockerfile -t rdsc_hl_base .

}

function rdsc_quarto_hl {
    printf "\nBuild rdsc_hl_quarto image\n"
    cd image_rdsc_quarto_headless
    source prep.sh
    # export envvars
    export $(grep -v '^#' .env | xargs)
    cd ..
    docker build \
      --build-arg BASEIMAGE=rdsc_hl_base:latest \
      --build-arg QUARTO_VERSION=$QUARTO_VERSION \
      --build-arg QUARTO_VSIX_VERSION=$QUARTO_VSIX_VERSION \
      -f image_rdsc_quarto_headless/Dockerfile \
      -t rdsc_hl_quarto .
    cd ..
    printf "\nBuild rdsc_headless image\n"
    docker build \
      --build-arg BASEIMAGE=rdsc_hl_quarto:latest \
      -f positron_headless/Dockerfile \
      -t rdsc_headless .
    printf "\nBuild rdsc_headless_plus image\n"
    cd addon_layer
    source prep.sh
    # export envvars
    export $(grep -v '^#' .env | xargs)
    cd ..
    docker build \
      --build-arg BASEIMAGE=rdsc_headless:latest \
      --build-arg NVM_VERSION=$NVM_VERSION \
      --build-arg NODE_VERSION=$NODE_VERSION \
      -f addon_layer/Dockerfile \
      -t rdsc_headless_plus .
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
_Flag: None install rdsc_quarto_hl
_Flag: --rstudio install rdsc_rstudio
_Flag: --bio install rdsc_bio
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
