# My Shell Config

**A portable, UI-agnostic shell environment for developers.**

This repository configures **Bash** and **Zsh** with a unified set of aliases and tools. It is designed to work on **any Linux distribution** (Pop!_OS, Fedora, Ubuntu) without conflicting with desktop environments like GNOME or COSMIC.

## 📦 What's Included?
* **Unified Aliases:** Write aliases once in `.aliases`, use them in both Bash and Zsh.
* **AI Tooling:** Shortcuts for Python, Jupyter, and NVIDIA monitoring.
* **Smart Prompt:** Configured for `starship` (cross-shell prompt).

## 🚀 Installation

1. **Clone:**
   ```bash
   git clone git@github.com:yurimarca/my-shell-config.git ~/dotfiles
````

2.  **Run Script:**

    ```bash
    cd ~/dotfiles
    chmod +x install.sh
    ./install.sh
    ```

3.  **Dependencies (Optional but Recommended):**

      * [Starship.rs](https://starship.rs/) (Prompt)
      * [Oh-My-Zsh](https://ohmyz.sh/) (Framework)

## ⚡ Key Aliases

| Command | Action |
| :--- | :--- |
| `py` | `python` |
| `juno` | `jupyter notebook` |
| `gpu` | `watch -n 1 nvidia-smi` |
