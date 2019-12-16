#!/bin/bash

printf "\nClone docker-base_image-light\n"
git clone https://github.com/kapsner/docker-base_image-light.git

printf "\nBuild docker-base_image-light\n"
cd docker-base_image-light/
chmod +x build_base_image.sh
./build_base_image.sh
cd ..

printf "\nBuild rstudio_server\n"
cd server_base_image/
chmod +x build_rserver_base.sh
./build_rserver_base.sh
