#!/bin/bash

# Positron Extension Synchronization Script
# ------------------------------------------------------------------
# This script compares installed Positron extensions against a predefined
# list and automatically installs any missing extensions.
# It is designed to be sourced from a shell configuration file (like .bashrc).

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
    "ms-pyright.pyright"
    "ms-python.debugpy"
    "quarto.quarto"
    "charliermarsh.ruff"
  )

# --- 2. Check for the 'positron' command ---
# If Positron isn't installed or not in PATH, skip the check.
if ! command -v positron &> /dev/null; then
    echo "[POSITRON-SYNC] 'positron' command not found. Skipping extension synchronization."
    # Use 'return' to exit cleanly if sourced in .bashrc
    return 0
fi

echo "[POSITRON-SYNC] Starting Positron Extension check..."

# --- 3. Get currently installed extensions ---
# Use a variable to hold the list for quick lookups.
INSTALLED_EXTENSIONS=$(positron --list-extensions 2>/dev/null)
INSTALL_COUNT=0

# --- 4. Iterate and Install Missing Extensions ---
for EXTENSION in "${DESIRED_EXTENSIONS[@]}"; do
    # Check if the desired extension is in the installed list.
    # We use '^...$' with grep to ensure an exact match for the full identifier.
    if ! echo "${INSTALLED_EXTENSIONS}" | grep -q "^${EXTENSION}$"; then
        echo "[POSITRON-SYNC] Missing: ${EXTENSION}. Installing..."
        
        # Install the extension.
        # We redirect stderr (2) to /dev/null to suppress verbose success messages from 'positron'.
        positron --install-extension "${EXTENSION}" 2>/dev/null
        
        if [ $? -eq 0 ]; then
            echo "[POSITRON-SYNC]   [SUCCESS] Installed ${EXTENSION}."
            INSTALL_COUNT=$((INSTALL_COUNT + 1))
        else
            echo "[POSITRON-SYNC]   [ERROR] Failed to install ${EXTENSION}. (Check Positron installation/permissions)"
        fi
    fi
done

# --- 5. Uninstall Unnecessary Extensions ---
echo "[POSITRON-SYNC] Checking for unnecessary extensions to uninstall..."

# Re-fetch the installed list as an array for safe iteration
# Temporarily change IFS (Internal Field Separator) to newline for reading the list safely
IFS=$'\n' INSTALLED_EXTENSIONS_TWO=($(positron --list-extensions 2>/dev/null | grep -v '^Extensions installed on'))
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
        echo "[POSITRON-SYNC] Unnecessary: ${INSTALLED_EXT}. Uninstalling..."
        positron --uninstall-extension "${INSTALLED_EXT}" 2>/dev/null
        
        if [ $? -eq 0 ]; then
            echo "[POSITRON-SYNC]   [SUCCESS] Uninstalled ${INSTALLED_EXT}."
            UNINSTALL_COUNT=$((UNINSTALL_COUNT + 1))
        else
            echo "[POSITRON-SYNC]   [ERROR] Failed to uninstall ${INSTALLED_EXT}. (Check Positron permissions)"
        fi
    fi
done

if [ ${UNINSTALL_COUNT} -eq 0 ]; then
    echo "[POSITRON-SYNC] No unnecessary extensions found."
fi

# --- 6. Summary ---
if [ ${INSTALL_COUNT} -eq 0 ]; then
    echo "[POSITRON-SYNC] All desired extensions are already installed. Complete."
else
    echo "[POSITRON-SYNC] Finished. Total new extensions installed: ${INSTALL_COUNT}."
fi

# Use 'return' instead of 'exit' so that running this script doesn't terminate the shell.
return 0
