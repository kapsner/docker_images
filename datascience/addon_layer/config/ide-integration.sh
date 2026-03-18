#!/bin/bash

VSCODE_DIR="/home/$USER/.vscode-server"
POSITRON_DIR="/home/$USER/.positron-server"

if [[ -d "$VSCODE_DIR" || -d "$POSITRON_DIR" ]]; then
    # Check specifically which directory was found (optional, but helpful)
    echo "--- SUCCESS: At least one required server directory was found. ---"
    if [ -d "$VSCODE_DIR" ]; then
        INSTALL_EXEC="code"
        IDE_NAME="VSCODE"
    fi
    if [ -d "$POSITRON_DIR" ]; then
        INSTALL_EXEC="positron"
        IDE_NAME="POSITRON"
    fi      
else
    return 0
fi

INSTALLED_EXTENSIONS=$($INSTALL_EXEC --list-extensions 2>/dev/null)

# add nanocoder
if command -v nanocoder &> /dev/null; then
    EXTENSION="nanocollective.nanocoder-vscode"
    if ! echo "${INSTALLED_EXTENSIONS}" | grep -q "^${EXTENSION}$"; then
        echo "[$IDE_NAME-SYNC] Missing: ${EXTENSION}. Installing..."
        $INSTALL_EXEC --install-extension "$(npm root -g)/@nanocollective/nanocoder/assets/nanocoder-vscode.vsix" 2>/dev/null
    fi
    # run `exec $SHELL` after install to enable proper connection
fi

# add gemini
if command -v gemini &> /dev/null; then
    EXTENSION="google.gemini-cli-vscode-ide-companion"
    if ! echo "${INSTALLED_EXTENSIONS}" | grep -q "^${EXTENSION}$"; then
        echo "[$IDE_NAME-SYNC] Missing: ${EXTENSION}. Installing..."
        $INSTALL_EXEC --install-extension "$EXTENSION" 2>/dev/null
    fi
    # run `exec $SHELL` after install to enable proper connection
fi

# # add claude
# if command -v claude &> /dev/null; then
#     EXTENSION="Anthropic.claude-code"
#     if ! echo "${INSTALLED_EXTENSIONS}" | grep -q "^${EXTENSION}$"; then
#         echo "[$IDE_NAME-SYNC] Missing: ${EXTENSION}. Installing..."
#         $INSTALL_EXEC --install-extension "$EXTENSION" 2>/dev/null
#     fi
#     # run `exec $SHELL` after install to enable proper connection
# fi

# Use 'return' instead of 'exit' so that running this script doesn't terminate the shell.
return 0
