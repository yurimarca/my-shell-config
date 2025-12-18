#!/bin/bash

# --- 1. Dynamic Variables ---
# Gets the directory where THIS script is stored, regardless of where you run it from
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OMZ_DIR="$HOME/.oh-my-zsh"
ZSH_CUSTOM="${ZSH_CUSTOM:-$OMZ_DIR/custom}"
FONT_DIR="$HOME/.local/share/fonts"

# Colors for pretty output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}--- 🚀 Starting Project Cosmic Ray Setup (Universal) ---${NC}"
echo -e "${BLUE}📂 Source Directory: $DOTFILES_DIR${NC}"

# --- 2. Intelligent OS Detection & Dependency Install ---
echo -e "${YELLOW}🔍 Checking system dependencies...${NC}"

install_deps_apt() {
    echo "📦 Detected APT (Debian/Ubuntu/Pop!_OS)..."
    sudo apt update
    sudo apt install -y zsh curl git unzip fontconfig autojump
}

install_deps_dnf() {
    echo "📦 Detected DNF (Fedora/RHEL/CentOS)..."
    sudo dnf check-update
    # Fedora often needs 'util-linux-user' for chsh and 'autojump-zsh' specific package
    sudo dnf install -y zsh curl git unzip fontconfig autojump-zsh util-linux-user
}

if command -v apt &> /dev/null; then
    install_deps_apt
elif command -v dnf &> /dev/null; then
    install_deps_dnf
else
    echo -e "${RED}❌ Unsupported Package Manager. Please install zsh, curl, git, unzip, and autojump manually.${NC}"
fi

# --- 3. Install Oh My Zsh (Self-Healing) ---
if [ ! -f "$OMZ_DIR/oh-my-zsh.sh" ]; then
    echo -e "${YELLOW}⚡ Installing Oh My Zsh...${NC}"
    rm -rf "$OMZ_DIR" # Clean up potentially broken installs
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo -e "${GREEN}✅ Oh My Zsh already installed.${NC}"
fi

# --- 4. Install Tools (Starship & uv) ---
# Starship
if ! command -v starship &> /dev/null; then
    echo -e "${YELLOW}🚀 Installing Starship...${NC}"
    curl -sS https://starship.rs/install.sh | sh -s -- -y
else
    echo -e "${GREEN}✅ Starship already installed.${NC}"
fi

# uv (Python Manager)
if ! command -v uv &> /dev/null; then
    echo -e "${YELLOW}🐍 Installing uv...${NC}"
    curl -LsSf https://astral.sh/uv/install.sh | sh
else
    echo -e "${GREEN}✅ uv already installed.${NC}"
fi

# --- 5. Install Themes & Plugins ---
echo -e "${YELLOW}🎨 Fetching plugins & themes...${NC}"

# Spaceship Theme (Fallback)
if [ ! -d "$ZSH_CUSTOM/themes/spaceship-prompt" ]; then
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ln -sf "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
fi

# Autosuggestions
[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] && \
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Syntax Highlighting
[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# --- 6. Install Nerd Fonts (FiraCode) ---
if [ ! -f "$FONT_DIR/FiraCodeNerdFont-Regular.ttf" ]; then
    echo -e "${YELLOW}🅰️  Downloading FiraCode Nerd Font...${NC}"
    mkdir -p "$FONT_DIR"
    curl -fLo "/tmp/FiraCode.zip" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip"
    unzip -o -q "/tmp/FiraCode.zip" -d "$FONT_DIR"
    rm "/tmp/FiraCode.zip"
    echo "🔄 Updating font cache..."
    fc-cache -f -v > /dev/null
else
    echo -e "${GREEN}✅ Fonts already installed.${NC}"
fi

# --- 7. AUTO-FIX: Patch the Source .zshrc ---
# We fix the file in your repo BEFORE linking it, to solve the "Path at bottom" bug.
ZSHRC_FILE="$DOTFILES_DIR/shell/.zshrc"

if grep -q "export PATH.*HOME/bin" "$ZSHRC_FILE"; then
    # Check if PATH export is NOT in the first 5 lines
    if ! head -n 5 "$ZSHRC_FILE" | grep -q "export PATH"; then
        echo -e "${YELLOW}🔧 Patching .zshrc: Moving PATH to the top...${NC}"
        # Create a temp file with PATH at the top, followed by the file content WITHOUT the PATH line
        echo 'export PATH="$HOME/bin:$HOME/.local/bin:$PATH"' > "$ZSHRC_FILE.tmp"
        grep -v 'export PATH="$HOME/bin:$HOME/.local/bin:$PATH"' "$ZSHRC_FILE" >> "$ZSHRC_FILE.tmp"
        mv "$ZSHRC_FILE.tmp" "$ZSHRC_FILE"
    fi
else
    # If PATH is missing entirely, append it to the top
    echo -e "${YELLOW}🔧 Patching .zshrc: Adding missing PATH...${NC}"
    echo 'export PATH="$HOME/bin:$HOME/.local/bin:$PATH"' | cat - "$ZSHRC_FILE" > temp && mv temp "$ZSHRC_FILE"
fi

# --- 8. Link Config Files ---
echo -e "${YELLOW}🔗 Linking configuration files...${NC}"
rm -f "$HOME/.zshrc" "$HOME/.aliases" "$HOME/.bashrc" "$HOME/.config/starship.toml"

ln -sf "$DOTFILES_DIR/shell/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/shell/.aliases" "$HOME/.aliases"
ln -sf "$DOTFILES_DIR/shell/.bashrc" "$HOME/.bashrc"

mkdir -p "$HOME/.config"
ln -sf "$DOTFILES_DIR/shell/starship.toml" "$HOME/.config/starship.toml"

echo -e "${GREEN}✨ Setup Complete! ✨${NC}"
echo -e "👉 1. Set Font: 'FiraCode Nerd Font' in your terminal settings."
echo -e "👉 2. Switch Shell: Run ${YELLOW}chsh -s \$(which zsh)${NC}"
echo -e "👉 3. Restart: Log out and back in."
