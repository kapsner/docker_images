#!/bin/bash

printf "\nClone docker-base_image\n" 
git clone https://github.com/kapsner/docker-base_image.git

printf "\nBuild docker-base_image\n"
cd docker-base_image/
chmod +x build_base-image.sh
./build_base_image.sh 
cd ..

printf "\nBuild ionic\n"
chmod +x build_ionic.sh  
./build_ionic.sh 
