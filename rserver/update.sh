#!/bin/bash

printf "\nUpdate docker-base_image-light\n"
cd docker-base_image-light/
git pull
./build_base_image.sh
cd ..

printf "\nBuild rstudio_server\n"
git pull
cd server_base_image/
chmod +x build_rserver_base.sh
./build_rserver_base.sh
