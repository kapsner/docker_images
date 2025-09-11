#!/bin/bash

sudo service ssh restart
source ~/.bash_profile
source activate base
tail -f /dev/null 
