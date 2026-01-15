#!/bin/bash

# IDE Extension Synchronization Script
# ------------------------------------------------------------------
# This script compares installed IDE extensions against a predefined
# list and automatically installs any missing extensions.
# It is designed to be sourced from a shell configuration file (like .bashrc).

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

# --- 1. Define Desired Extensions ---
# Add your desired extension identifiers here.
DESIRED_EXTENSIONS=(
    "posit.air-vscode"
    "github.vscode-pull-request-github"
    "ms-toolsai.jupyter"
    "ms-toolsai.jupyter-keymap"
    "ms-toolsai.vscode-jupyter-cell-tags"
    "ms-toolsai.vscode-jupyter-slideshow"
    "james-yu.latex-workshop"
    "ms-python.debugpy"
    "ms-python.vscode-python-envs"
    "quarto.quarto"
    "charliermarsh.ruff"
    "meta.pyrefly"
)

# --- 2. Check for the 'IDE' command ---
# If IDE isn't installed or not in PATH, skip the check.
if ! command -v $INSTALL_EXEC &> /dev/null; then
    echo "[$IDE_NAME-SYNC] '$INSTALL_EXEC' command not found. Skipping extension synchronization."
    # Use 'return' to exit cleanly if sourced in .bashrc
    return 0
fi

echo "[$IDE_NAME-SYNC] Starting Extension check..."

# --- 3. Get currently installed extensions ---
# Use a variable to hold the list for quick lookups.
INSTALLED_EXTENSIONS=$($INSTALL_EXEC --list-extensions 2>/dev/null)
INSTALL_COUNT=0

# --- 4. Iterate and Install Missing Extensions ---
for EXTENSION in "${DESIRED_EXTENSIONS[@]}"; do
    # Check if the desired extension is in the installed list.
    # We use '^...$' with grep to ensure an exact match for the full identifier.
    if ! echo "${INSTALLED_EXTENSIONS}" | grep -q "^${EXTENSION}$"; then
        echo "[$IDE_NAME-SYNC] Missing: ${EXTENSION}. Installing..."
        
        # Install the extension.
        # We redirect stderr (2) to /dev/null to suppress verbose success messages from 'IDE'.
        $INSTALL_EXEC --install-extension "${EXTENSION}" 2>/dev/null
        
        if [ $? -eq 0 ]; then
            echo "[$IDE_NAME-SYNC]   [SUCCESS] Installed ${EXTENSION}."
            INSTALL_COUNT=$((INSTALL_COUNT + 1))
        else
            echo "[$IDE_NAME-SYNC]   [ERROR] Failed to install ${EXTENSION}. (Check IDE installation/permissions)"
        fi
    fi
done

# --- 5. Uninstall Unnecessary Extensions ---
echo "[$IDE_NAME-SYNC] Checking for unnecessary extensions to uninstall..."

# Re-fetch the installed list as an array for safe iteration
# Temporarily change IFS (Internal Field Separator) to newline for reading the list safely
IFS=$'\n' INSTALLED_EXTENSIONS_TWO=($($INSTALL_EXEC --list-extensions 2>/dev/null | grep -v '^Extensions installed on'))
UNINSTALL_COUNT=0

for INSTALLED_EXT in "${INSTALLED_EXTENSIONS_TWO[@]}"; do
    IS_DESIRED=0
    
    # Check if the installed extension exists in the DESIRED_EXTENSIONS array
    for DESIRED_EXT in "${DESIRED_EXTENSIONS[@]}"; do
        if [[ "${INSTALLED_EXT}" == "${DESIRED_EXT}" ]]; then
            IS_DESIRED=1
            break
        fi
    done

    # If IS_DESIRED is 0, the extension is unnecessary and should be uninstalled
    if [ ${IS_DESIRED} -eq 0 ]; then
        echo "[$IDE_NAME-SYNC] Unnecessary: ${INSTALLED_EXT}. Uninstalling..."
        $INSTALL_EXEC --uninstall-extension "${INSTALLED_EXT}" 2>/dev/null
        
        if [ $? -eq 0 ]; then
            echo "[$IDE_NAME-SYNC]   [SUCCESS] Uninstalled ${INSTALLED_EXT}."
            UNINSTALL_COUNT=$((UNINSTALL_COUNT + 1))
        else
            echo "[$IDE_NAME-SYNC]   [ERROR] Failed to uninstall ${INSTALLED_EXT}. (Check IDE permissions)"
        fi
    fi
done

if [ ${UNINSTALL_COUNT} -eq 0 ]; then
    echo "[$IDE_NAME-SYNC] No unnecessary extensions found."
fi

# --- 6. Summary ---
if [ ${INSTALL_COUNT} -eq 0 ]; then
    echo "[$IDE_NAME-SYNC] All desired extensions are already installed. Complete."
else
    echo "[$IDE_NAME-SYNC] Finished. Total new extensions installed: ${INSTALL_COUNT}."
fi

# Use 'return' instead of 'exit' so that running this script doesn't terminate the shell.
return 0
