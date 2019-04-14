#!/bin/bash

printf "\nBuild r_base_image\n"
cd r_base_image
chmod +x build_r_base_image.sh
./build_r_base_image.sh
cd ..

printf "\nBuild r_datascience\n"
docker build -f Dockerfile -t r_datascience .
