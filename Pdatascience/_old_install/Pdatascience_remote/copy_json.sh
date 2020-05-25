#!/bin/bash

RUNTIMEDIR=$(jupyter --runtime-dir)
echo ${RUNTIMEDIR}
cd ${RUNTIMEDIR}
ls -al
cp kernel*.json /home/user/volume/
