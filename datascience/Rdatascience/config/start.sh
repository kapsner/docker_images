#!/bin/bash

source /config_env.sh

printf "\nStarting RStudio server\n\n"
rstudio-server start

printf "\e]8;;http://0.0.0.0:8787\e\\http://0.0.0.0:8787\e]8;;\e\\n"

tail -f /dev/null 
