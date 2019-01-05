#!/bin/bash
cd /r_base_image
chmod +x build_r_base_image.sh
/bin/bash build_r_base_image.sh
cd ..
docker build -f Dockerfile -t r_datascience .
