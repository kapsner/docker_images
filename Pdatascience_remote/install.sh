#!/bin/bash

printf "\nClone docker-base_image\n"
git clone https://github.com/kapsner/docker-base_image.git

printf "\nBuild docker-base_image\n"
cd docker-base_image/
chmod +x build_base-image.sh
./build_base_image.sh 
cd ..

printf "\nClone docker-Pdatascience\n"
git clone https://github.com/kapsner/docker-Pdatascience.git

printf "\nBuild docker-Pdatascience p_base_image\n"
cd docker-Pdatascience/
cd p_base_image  
chmod +x build_p_base_image.sh  
./build_p_base_image.sh  
cd ../../

printf "\nBuild docker-Pdatascience_remote\n"
chmod +x build_pdatascience.sh  
./build_pdatascience.sh  
