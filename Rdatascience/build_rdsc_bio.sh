#!/bin/bash

./build_rdsc.sh

docker build -f image_rdsc_bio/Dockerfile -t rdsc_bio .
