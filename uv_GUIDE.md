# 🚀 The Cosmic Ray Guide to `uv`

**uv** is an extremely fast Python package installer and resolver, written in Rust. It replaces `pip`, `pip-tools`, `pyenv`, `poetry`, and `virtualenv` with a single binary.

## 📦 1. Installation
(Handled automatically by `install.sh`)
```bash
curl -LsSf [https://astral.sh/uv/install.sh](https://astral.sh/uv/install.sh) | sh
````

## 🛠 2. Managing Projects (The Modern Way)

Instead of manually creating environments, `uv` manages them for you.

### Initialize a Project

Create a new folder and set it up as a Python project:

```bash
mkdir my-ai-project
cd my-ai-project
uv init
```

  * Creates a `pyproject.toml` (for dependencies).
  * Creates a `.python-version` (pins the python version).
  * Creates a `hello.py` template.

### Adding Packages

Install libraries like Pandas or PyTorch. This automatically resolves versions and updates `pyproject.toml`:

```bash
uv add pandas numpy
uv add --dev pytest  # Add development-only dependencies
```

### Running Code

You don't *have* to activate an environment to run code. `uv` handles it efficiently:

```bash
uv run hello.py
```

This command finds the correct Python version, creates a virtual environment (if missing), installs dependencies, and runs the script.

## 🐍 3. Managing Python Versions

`uv` replaces `pyenv` for installing Python versions.

```bash
# Install specific versions
uv python install 3.10 3.11 3.12

# Pin a version for the current project
uv python pin 3.11
```

This creates a `.python-version` file. `uv` commands in this folder will now use Python 3.11 automatically.

## 🔌 4. Automatic Virtualenv Activation

By default, `uv` prefers you use `uv run`. However, if you prefer the classic terminal experience where the environment activates when you `cd` into a folder:

1.  **Create the venv**:

    ```bash
    uv venv
    ```

    This creates a standard `.venv` folder.

2.  **Auto-Activation**:
    Your `.zshrc` has been configured with a hook that detects the `.venv` folder and activates it automatically when you change directories.

      * **Enter folder**: `cd my-project` → `(my-project) ➜ ~`
      * **Leave folder**: `cd ..` → Environment deactivates.
