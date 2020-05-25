#!/bin/bash

printf "\nUpdate docker-base_image\n"
cd docker-base_image/
git pull
chmod +x build_base_image.sh
./build_base_image.sh 
cd ..

printf "\nUpdate docker-Pdatascience p_base_image\n"
cd docker-Pdatascience/
git pull
cd p_base_image  
chmod +x build_p_base_image.sh  
./build_p_base_image.sh  
cd ../../

printf "\nBuild pdatascience\n"
git pull
chmod +x build_pdatascience.sh
./build_pdatascience.sh
