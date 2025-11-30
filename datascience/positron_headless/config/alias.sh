#!/bin/bash

# Define the target directory names
POSITRON_DIR="/home/$USER/.positron-server"

if [[ -d "$POSITRON_DIR" ]]; then
    alias code="positron"
else
    return 0
fi
