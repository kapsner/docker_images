#!/bin/bash

source /config_env.sh

printf "\nStarting SSH server\n\n"
sudo service ssh restart

tail -f /dev/null 
