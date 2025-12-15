# Path to Oh-My-Zsh
export ZSH="$HOME/.oh-my-zsh"

# Theme & Plugins
ZSH_THEME="spaceship" # Fallback if starship fails
plugins=(git zsh-syntax-highlighting zsh-autosuggestions autojump)

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# 1. Load Universal Aliases
if [ -f "$HOME/.aliases" ]; then
    source "$HOME/.aliases"
fi

# 2. UV Setup & Auto-Activation
# Initialize uv completions
if command -v uv &> /dev/null; then
    eval "$(uv generate-shell-completion zsh)"
fi

# Function to auto-activate .venv when entering a directory
autoload -U add-zsh-hook
load-uv-venv() {
    # Check if we are in a directory with a .venv
    if [[ -d .venv ]]; then
        # Check if it's already activated to avoid redundant sourcing
        if [[ "$VIRTUAL_ENV" != "$PWD/.venv" ]]; then
            source .venv/bin/activate
        fi
    # If we aren't in a .venv dir, but a venv is active, deactivate it
    elif [[ -n "$VIRTUAL_ENV" ]]; then
        deactivate
    fi
}
add-zsh-hook chpwd load-uv-venv
load-uv-venv # Run once on startup

# 3. Starship Prompt
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi
