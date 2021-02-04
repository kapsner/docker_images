#!/bin/bash

./build_rdsc.sh

docker build -f image_rdsc_rad/Dockerfile -t rdsc_rad .
