# 01 — Zsh

> Oh My Zsh + a custom prompt, smart navigation, and quality-of-life plugins. Everything is guarded so the config loads safely on machines missing any tool.

## Setup

```bash
bash scripts/01_zsh.sh          # install dependencies
cp dotfiles/zshrc ~/.zshrc      # apply config
exec zsh                        # reload
```

Reference config: [`dotfiles/zshrc`](./dotfiles/zshrc)

---

## What changed from vanilla zsh

### Oh My Zsh — no theme

```zsh
ZSH_THEME=""
```

Oh My Zsh is used only for its plugin infrastructure and helpers (like `add-zsh-hook`). No theme is loaded because the prompt is defined entirely from scratch below. Loading a theme would override the custom PS1 anyway.

---

### Custom two-line prompt

```
05-30 14:23:01  8s
hostname  setup  (myenv)  [main✓]  ➜
```

| Element | When shown | Color |
|---------|-----------|-------|
| Timestamp | always | yellow |
| Elapsed time | command took > 2s | grey |
| Hostname | always | cyan |
| cwd (1 level) | always | green |
| Conda env | env active | magenta |
| Git branch + status | inside a git repo | yellow / green / red |
| Arrow `➜` / `✗` | exit code 0 / non-zero | blue / red |

The elapsed timer uses `preexec`/`precmd` hooks — no external tools required.

---

### Conda — portable, prompt-silent

Two problems with the default conda init block:

1. It hard-codes an absolute path, breaking when the config moves to a new machine.
2. It prepends `(base)` to the prompt in a way that conflicts with a custom PS1.

Fix: a `_init_conda` function searches common install locations (miniconda3, anaconda3, opt/ variants, /opt/ system-wide) and calls the shell hook only when found. `CONDA_CHANGEPS1=false` suppresses conda's own prompt modification — the custom `_conda_env` function renders the active env instead.

---

### eza — better `ls`

```zsh
alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first --git'
```

`ll` shows git status per-file inline. Both aliases are wrapped in a `command -v eza` check — system `ls` is used silently if eza isn't installed.

---

### zoxide — frecency `cd`

```zsh
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"
```

`z <partial>` jumps to the most frequently/recently visited matching directory. Replaces `cd` for anything beyond one level deep. No-op if zoxide isn't installed.

---

### Plugin integrations — fzf, syntax highlighting, autosuggestions

All three are sourced conditionally from the Homebrew prefix so the config doesn't error on machines without them.

| Plugin | Keybind / behavior |
|--------|-------------------|
| `zsh-syntax-highlighting` | commands colour red/green as you type |
| `zsh-autosuggestions` | ghost-text from history — `→` to accept |
| `fzf` | `Ctrl+R` history search, `Ctrl+T` file picker |

---

## Linux notes

On Ubuntu, plugins are cloned to `~/.zsh/` by the install script (no Homebrew). Update the three source lines in `~/.zshrc` to:

```zsh
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
# fzf key-bindings path varies by distro — check /usr/share/doc/fzf/examples/
```
