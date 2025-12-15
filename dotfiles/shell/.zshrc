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

# 2. Conda / Python Setup (Dynamic)
if [ -d "$HOME/miniforge3" ]; then
    __conda_setup="$('$HOME/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then eval "$__conda_setup"; else export PATH="$HOME/miniforge3/bin:$PATH"; fi
    unset __conda_setup
fi

# 3. Starship Prompt
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi
