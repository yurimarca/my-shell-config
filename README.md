# Cosmic Ray: Universal Shell

**A portable, "batteries-included" shell environment for Data & AI/ML Engineers.**

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

### 3\. ⚠️ CRITICAL: Configure Font (Pop\!\_OS)

The installer adds **FiraCode Nerd Font** to your system, but **you must manually select it** in your terminal settings. If you skip this, your prompt will show broken squares (□) instead of icons.

**Instructions for Pop\!\_OS (GNOME Terminal):**

1.  Open your Terminal.
2.  Click the **≡ (Hamburger Menu)** in the top bar → **Preferences** (or right-click the terminal window → Preferences).
3.  In the sidebar, click on your current profile (usually named **"Unnamed"** or "Default").
4.  Go to the **Text** tab.
5.  Check the box **[x] Custom font**.
6.  Click the font name button and search for **"FiraCode Nerd Font"** (or "FiraCode Nerd Font Mono").
7.  Select it and click **Select**.
8.  *Optional:* Restart your terminal to ensure icons render perfectly.

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

## 📝 Recovery

The installer automatically backs up your existing configuration files before overwriting them. Look for a folder named:
`~/dotfiles_backup_YYYYMMDD_HHMMSS`
