# Machine Setup

> Scripts and guides for setting up a new macOS or Ubuntu machine — reproducible, pitfall-free, and documented once so it never has to be figured out twice. Works for me `karam`. For ideas only. Edit before execution for correct behaviour OR ask an agent to edit! 

Each topic has a guide (`.md`) and an install script (`scripts/`). Dotfiles live in `dotfiles/`.

---

## Index

| # | Topic | What's covered |
|---|-------|---------------|
| 0 | [SSH](./0_ssh.md) | Keys (ed25519), passwordless login, GitHub setup, `~/.ssh/config`, agent, tunnels — the first step |
| 1 | [Zsh](./01_zsh.md) | Oh My Zsh, custom prompt, eza, zoxide, fzf, syntax highlighting, autosuggestions |
| 10 | [AWS](./10_aws.md) | Account model (root vs dev), CLI v2 + SSO, VS Code, IAM/S3/EC2/SageMaker, cost discipline for ML |

---

## Planned

**Foundations**
- **2 · Homebrew / apt** — core package managers, essential CLI tools, casks
- **3 · Git** — global config, aliases, signed commits, credential helpers, `.gitignore` for ML, git-lfs, `git-secrets`
- **5 · Python** — pyenv/conda + `uv`, per-project envs, pip config, ruff/mypy/pre-commit
- **6 · Node.js** — nvm, default version, global packages
- **7 · VS Code** — settings, extensions, keybindings, Remote-SSH
- **8 · macOS** — system preferences, dock, finder, key repeat
- **9 · Docker** — install, daemon config, NVIDIA Container Toolkit (GPU in containers), aliases

**ML practitioner essentials**
- **11 · GPU / CUDA** — drivers, CUDA + cuDNN, `nvidia-smi`, torch GPU check (the #1 "works on cloud, not my box" fix)
- **12 · tmux** — persistent sessions so long training runs survive an SSH disconnect (pairs with chapter 0)
- **13 · Secrets & dotfiles** — `.env` patterns, password manager / `pass`, portable dotfiles via `chezmoi` or bare-git
- **14 · Jupyter** — kernels per-env, `nbstripout` for clean diffs, remote notebooks over the SSH tunnel
- **15 · Experiment tracking** — Weights & Biases / MLflow setup, API keys via the secrets chapter

---

## Structure

```powershell
setup/
  scripts/      install scripts (run these on a fresh machine)
  dotfiles/     reference config files (copy to ~/)
  *.md          guides
```
