# My Shell Config

**A portable, "batteries-included" shell environment for Data & AI Engineers.**

This repository contains a unified configuration for **Zsh** and **Bash**. It is designed to be distro-agnostic—working identically on Pop!_OS, Fedora, Ubuntu, or remote cloud servers—without interfering with your desktop environment (GNOME/COSMIC).

## 📦 What's Included?

* **⚡ Automated Installer:** A single script installs **Oh My Zsh**, **Spaceship Theme**, plugins, and **Nerd Fonts** automatically.
* **🎨 Starship Prompt:** A custom, high-contrast "Powerline" style prompt configured for Python/Conda workflows.
* **🔧 AI Tooling:** Pre-configured aliases for Python, Jupyter, Docker, and NVIDIA GPU monitoring.
* **⌨️ Universal Aliases:** Logic stored in `.aliases` is shared between Bash and Zsh.

---

## 🚀 Installation

### 1. Clone
```bash
git clone git@github.com:yurimarca/my-shell-config.git ~/dotfiles
```

### 2\. Run Installer

This script will backup your old config, install necessary fonts/plugins, and link the new files.

```bash
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

### 3\. ⚠️ Manual Step: Select Font

The installer adds **FiraCode Nerd Font** to your system, but it cannot force your terminal emulator to use it.

1.  Open your Terminal Preferences (GNOME Terminal, Kitty, Alacritty, etc.).
2.  Locate the **Font** or **Text** section.
3.  Select **"FiraCode Nerd Font"** (or "Regular").
      * *If you skip this, your prompt icons will look like broken squares (□).*
4.  Restart your terminal.

-----

## 📂 Repository Structure

```text
~/dotfiles/
├── shell/
│   ├── .aliases        # Shared command shortcuts
│   ├── .bashrc         # Bash entry point (loads aliases)
│   ├── .zshrc          # Zsh entry point (loads OMZ + Starship)
│   └── starship.toml   # The visual theme configuration
├── install.sh          # Setup script (Fonts, Links, Plugins)
└── README.md
```

-----

## ⚡ Key Aliases

The `.aliases` file is optimized for an AI engineering workflow:

| Alias | Command | Description |
| :--- | :--- | :--- |
| `py` | `python` | Standard Python invocation |
| `juno` | `jupyter notebook` | Launches Jupyter |
| `gpu` | `watch -n 1 nvidia-smi` | Real-time GPU monitoring for training |
| `zshconfig` | `nano ~/.zshrc` | Quickly edit shell config |
| `reload` | `source ~/.zshrc` | Reload configuration changes |

-----
