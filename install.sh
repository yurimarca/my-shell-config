#!/bin/bash
DOTFILES_DIR="$HOME/dotfiles"
OMZ_DIR="$HOME/.oh-my-zsh"
ZSH_CUSTOM="${ZSH_CUSTOM:-$OMZ_DIR/custom}"
FONT_DIR="$HOME/.local/share/fonts"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}--- Starting Project Cosmic Ray Setup (UV Edition) ---${NC}"

# --- 1. Dependencies ---
echo -e "${YELLOW}Checking dependencies...${NC}"
if ! command -v unzip &> /dev/null; then
    echo "Installing 'unzip'..."
    sudo apt update && sudo apt install unzip -y
fi

# --- 2. Install Oh My Zsh ---
if [ ! -d "$OMZ_DIR" ]; then
    echo -e "${YELLOW}Installing Oh My Zsh...${NC}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo -e "${GREEN}Oh My Zsh already installed.${NC}"
fi

# --- 3. Install uv (The Python Manager) ---
if ! command -v uv &> /dev/null; then
    echo -e "${YELLOW}Installing uv...${NC}"
    curl -LsSf https://astral.sh/uv/install.sh | sh
else
    echo -e "${GREEN}uv already installed.${NC}"
fi

# --- 4. Install Themes & Plugins ---
echo -e "${YELLOW}Fetching plugins & themes...${NC}"
# Spaceship Theme
if [ ! -d "$ZSH_CUSTOM/themes/spaceship-prompt" ]; then
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
fi

# Plugins
[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# --- 5. Install Nerd Fonts (FiraCode) ---
if [ ! -f "$FONT_DIR/FiraCodeNerdFont-Regular.ttf" ]; then
    echo -e "${YELLOW}⬇️  Downloading FiraCode Nerd Font...${NC}"
    mkdir -p "$FONT_DIR"
    curl -fLo "/tmp/FiraCode.zip" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip"
    unzip -o -q "/tmp/FiraCode.zip" -d "$FONT_DIR"
    rm "/tmp/FiraCode.zip"
    echo -e "${YELLOW}🔄 Updating font cache...${NC}"
    fc-cache -f -v > /dev/null
    echo -e "${GREEN}✅ FiraCode installed!${NC}"
else
    echo -e "${GREEN}Fonts already installed.${NC}"
fi

# --- 6. Link Configs ---
echo -e "${YELLOW}Linking config files...${NC}"
ln -sf "$DOTFILES_DIR/shell/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/shell/.aliases" "$HOME/.aliases"
ln -sf "$DOTFILES_DIR/shell/.bashrc" "$HOME/.bashrc"

# Starship Config
mkdir -p "$HOME/.config"
ln -sf "$DOTFILES_DIR/shell/starship.toml" "$HOME/.config/starship.toml"

echo -e "${GREEN}--- Setup Complete! ---${NC}"
echo -e "👉 Action Required: Open your Terminal Preferences and select 'FiraCode Nerd Font' as your font."
echo -e "Then restart your terminal."
