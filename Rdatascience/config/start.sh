#!/bin/bash

printf "\nStarting RStudio server\n\n"
rstudio-server start

printf "\e]8;;https://0.0.0.0:8787\e\\https://0.0.0.0:8787\e]8;;\e\\n"

tail -f /dev/null 
