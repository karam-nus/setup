# Machine Setup

> Scripts and guides for setting up a new macOS or Ubuntu machine — reproducible, pitfall-free, and documented once so it never has to be figured out twice. Works for me `karam`. For ideas only. Edit before execution for correct behaviour OR ask an agent to edit! 

Each topic has a guide (`.md`) and an install script (`scripts/`). Dotfiles live in `dotfiles/`.

---

## Index

| # | Topic | What's covered |
|---|-------|---------------|
| 1 | [Zsh](./01_zsh.md) | Oh My Zsh, custom prompt, eza, zoxide, fzf, syntax highlighting, autosuggestions |

---

## Planned

| # | Topic |
|---|-------|
| 2 | Homebrew / apt — core package managers and essential CLI tools |
| 3 | Git — global config, aliases, signing commits, credential helpers |
| 4 | SSH — key generation, `~/.ssh/config`, agent forwarding |
| 5 | Python — conda/pyenv, default environment, pip config |
| 6 | Node.js — nvm, default version, global packages |
| 7 | VS Code — settings, extensions, keybindings |
| 8 | macOS — system preferences, dock, finder, key repeat |
| 9 | Docker — install, daemon config, common aliases |

---

## Structure

```powershell
setup/
  scripts/      install scripts (run these on a fresh machine)
  dotfiles/     reference config files (copy to ~/)
  *.md          guides
```
