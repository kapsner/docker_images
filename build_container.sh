#!/bin/bash
git clone https://github.com/kapsner/docker-base_image.git
cd docker-base_image
chmod +x build_base_image.sh
/bin/bash build_base_image.sh
cd ../r_base_image
chmod +x build_r_base_image.sh
/bin/bash build_r_base_image.sh
cd ..
docker-compose up --build -d
