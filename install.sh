#!/bin/bash

# Claude Code Design Logo System Installer
# Version: 1.0.0
# Usage: curl -fsSL https://raw.githubusercontent.com/nasrulhazim/claude-design-logo/main/install.sh | bash

set -e

echo "Installing Claude Code Design Logo System"
echo "==========================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Detect installation method
if [ -d ".git" ] && [ -f "design-logo.md" ]; then
    INSTALL_MODE="local"
    REPO_DIR="$(pwd)"
    echo -e "${BLUE}Installing from local repository${NC}"
else
    INSTALL_MODE="remote"
    REPO_URL="https://raw.githubusercontent.com/nasrulhazim/claude-design-logo/main"
    echo -e "${BLUE}Installing from remote repository${NC}"
fi

echo ""

# Check if ~/.claude directory exists
if [ ! -d ~/.claude ]; then
    echo -e "${YELLOW}Creating ~/.claude directory...${NC}"
    mkdir -p ~/.claude
fi

# Check if ~/.claude/commands directory exists
if [ ! -d ~/.claude/commands ]; then
    echo -e "${YELLOW}Creating ~/.claude/commands directory...${NC}"
    mkdir -p ~/.claude/commands
fi

# Function to install file from local or remote
install_file() {
    local source_file=$1
    local dest_file=$2
    local file_desc=$3

    if [ -f "$dest_file" ]; then
        echo -e "${YELLOW}$file_desc already exists, replacing...${NC}"
    fi

    if [ "$INSTALL_MODE" = "local" ]; then
        cp "$REPO_DIR/$source_file" "$dest_file"
    else
        curl -fsSL "$REPO_URL/$source_file" -o "$dest_file"
    fi

    if [ -f "$dest_file" ]; then
        echo -e "${GREEN}✓${NC} $file_desc installed"
        return 0
    else
        echo -e "${RED}✗${NC} Failed to install $file_desc"
        return 1
    fi
}

echo "Installing files..."
echo ""

# Install files
install_file "design-logo.md" ~/.claude/commands/design-logo.md "Design logo command"

echo ""
echo -e "${GREEN}Claude Code Design Logo System installed successfully!${NC}"
echo ""
echo "Usage:"
echo "   /design-logo              - Start full logo design process"
echo "   /design-logo refine       - Refine an existing logo"
echo "   /design-logo icons        - Generate icon alternatives"
echo ""
echo "Full README:"
if [ "$INSTALL_MODE" = "local" ]; then
echo "   cat $REPO_DIR/README.md"
else
echo "   https://github.com/nasrulhazim/claude-design-logo"
fi
echo ""
echo "You're all set! Try '/design-logo' in any project with Claude Code."
echo ""
