# Cosmic Ray: Universal Shell

**A portable, "batteries-included" shell environment for Data & AI/ML Engineers.**

This repository contains a unified configuration for **Zsh**. It is designed to be distro-agnostic—working identically on **Ubuntu, Pop!_OS, Debian, Fedora, CentOS, and RHEL**.

## 📦 What's Included?

* **⚡ Universal Installer:** Automatically detects your OS (`apt` or `dnf`) and installs dependencies.
* **🚀 Starship Prompt:** A high-performance, cross-shell prompt (Powerline style).
* **🛠️ Self-Healing:** The installer automatically fixes broken paths and missing plugins.
* **🐍 Modern Python:** Uses **[uv](https://github.com/astral-sh/uv)** for blazing fast Python version management.
* **🧠 Smart Activation:** Automatically activates `.venv` environments when you `cd` into a project folder.
* **🔧 AI Tooling:** Pre-configured aliases for Python, Jupyter, Docker, and NVIDIA GPU monitoring.

---

## 🚀 Installation

### 1. Clone
You can clone this repository anywhere (e.g., `~/Code` or `~/dotfiles`). The installer will automatically detect its location.

```bash
git clone git@github.com:yurimarca/my-shell-config.git ~/dotfiles
cd ~/dotfiles
```

### 2\. Run Installer

```bash
chmod +x install.sh
./install.sh
```

### 3\. Post-Install Setup

After the script finishes:

1.  **Set Font:** Open your terminal preferences and select **FiraCode Nerd Font** (installed automatically).
2.  **Change Shell:** Set Zsh as your default shell:
    ```bash
    chsh -s $(which zsh)
    ```
3.  **Restart:** Log out and log back in to apply all changes.

-----

## ⚡ Workflow: Using `uv`

This setup replaces Conda/Pip with `uv` for instant environment management.

| Task | Command |
| :--- | :--- |
| **New Project** | `uv init` |
| **Add Library** | `uv add pandas` |
| **Run Script** | `uv run script.py` |
| **Install Python** | `uv python install 3.12` |
| **Pin Version** | `uv python pin 3.10` |

### Auto-Activation

If you run `uv venv` in a folder, your shell will automatically detect the `.venv` and activate it when you enter the directory.

-----

## ⚡ Key Aliases

| Alias | Command | Description |
| :--- | :--- | :--- |
| `py` | `python` | Standard Python invocation |
| `juno` | `jupyter notebook` | Launches Jupyter |
| `gpu` | `watch -n 1 nvidia-smi` | Real-time GPU monitoring |
| `zshconfig` | `nano ~/.zshrc` | Edit shell config |
| `reload` | `source ~/.zshrc` | Reload configuration |

-----

## 🔧 Troubleshooting

  * **Prompt symbols looking weird?**
      * Make sure your terminal (GNOME Terminal, VSCode, etc.) is using **FiraCode Nerd Font**.
  * **"Command not found: uv"?**
      * Restart your terminal. The installer fixes your `$PATH`, but it requires a restart to load.
  * **"Oh My Zsh" errors?**
      * Run `./install.sh` again. The new script has a self-healing feature that detects and repairs broken installations.

