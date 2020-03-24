#!/bin/bash

printf "\nBuild rdsc_base image\n"
source image_rdsc_base/build_rdsc_base.sh

printf "\nBuild rdsc_headless image\n"
source image_rdsc_headless/build_rdsc_headless.sh

printf "\nBuild rdsc_rstudio image\n"
source image_rdsc_rstudio/build_rdsc_rstudio.sh
