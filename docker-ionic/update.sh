#!/bin/bash

printf "\nUpdate docker-base_image\n"
cd docker-base_image/
git pull
chmod +x build_base_image.sh
./build_base_image.sh 
cd ..

printf "\nUpdate ionic\n"
git pull
chmod +x build_ionic.sh  
./build_ionic.sh 
