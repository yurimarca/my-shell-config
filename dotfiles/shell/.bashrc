# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# 1. Load Universal Aliases
if [ -f "$HOME/.aliases" ]; then
    . "$HOME/.aliases"
fi

# 2. Starship Prompt (If installed)
if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi

# 3. Path Additions (Standard)
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
