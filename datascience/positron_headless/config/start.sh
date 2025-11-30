#!/bin/bash

# start ssh service
/usr/sbin/sshd -f ~/.ssh/sshd_config -E /tmp/sshd.log

source ~/.bash_profile
source activate base
tail -f /dev/null
