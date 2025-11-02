#!/bin/bash

# Setup script for sparse checkout of only the context directory
# Run this after adding the submodule to only checkout context files

set -e

SUBMODULE_PATH="${1:-.cursor/rules}"

echo "Setting up sparse checkout for context directory only..."
echo "Submodule path: $SUBMODULE_PATH"

# Check if the submodule directory exists and is a git repository
if [ ! -d "$SUBMODULE_PATH" ]; then
    echo "Error: Submodule directory '$SUBMODULE_PATH' does not exist."
    echo "Make sure you've added the submodule first:"
    echo "  git submodule add https://github.com/yourusername/core_prompts.git $SUBMODULE_PATH"
    exit 1
fi

if [ ! -d "$SUBMODULE_PATH/.git" ]; then
    echo "Error: '$SUBMODULE_PATH' is not a git repository."
    echo "Make sure this is a properly initialized submodule."
    exit 1
fi

# Navigate to the submodule directory
cd "$SUBMODULE_PATH"

# Enable sparse checkout
git config core.sparseCheckout true

# Configure to only checkout context directory
echo "context/*" > .git/info/sparse-checkout

# Checkout the sparse content
git checkout

echo "Sparse checkout configured successfully!"
echo "Only files in the context/ directory are now checked out."
echo ""
echo "To update the submodule in the future:"
echo "  git submodule update --remote $SUBMODULE_PATH"
