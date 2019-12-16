#!/bin/bash

printf "\nUpdate docker-base_image\n"
cd docker-base_image/
git pull
chmod +x build_base_image.sh
./build_base_image.sh 
cd ..

printf "\nBuild pdatascience\n"
git pull
chmod +x ./build_pdatascience.sh
./build_pdatascience.sh
