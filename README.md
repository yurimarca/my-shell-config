# Cosmic Ray: Universal Shell

**A portable, "batteries-included" shell environment for Data & AI/ML Engineers.**

This repository contains a unified configuration for **Zsh** and **Bash**. It is designed to be distro-agnostic—working identically on Pop!_OS, Fedora, Ubuntu, or remote cloud servers.

## 📦 What's Included?

* **⚡ Automated Installer:** A single script installs **Oh My Zsh**, **Spaceship Theme**, and **Nerd Fonts**.
* **🐍 Modern Python:** Uses **[uv](https://github.com/astral-sh/uv)** for blazing fast Python version management and package resolution.
* **🧠 Smart Activation:** Automatically activates `.venv` environments when you `cd` into a project folder.
* **🎨 Starship Prompt:** A custom, high-contrast "Powerline" style prompt.
* **🔧 AI Tooling:** Pre-configured aliases for Python, Jupyter, Docker, and NVIDIA GPU monitoring.

---

## 🚀 Installation

### 1. Clone
```bash
git clone git@github.com:yurimarca/my-shell-config.git ~/dotfiles
````

### 2\. Run Installer

```bash
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

### 3\. ⚠️ Configure Font

Set your terminal font to **FiraCode Nerd Font** to see icons correctly.

-----

## ⚡ Workflow: Using `uv`

This setup replaces Conda/Pip with `uv`.

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
