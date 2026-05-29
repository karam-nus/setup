#!/usr/bin/env bash
# Installs Oh My Zsh and all zsh dependencies.
# Supports macOS (Homebrew) and Ubuntu/Debian (apt).
# After running: cp dotfiles/zshrc ~/.zshrc && exec zsh

set -euo pipefail

OS="$(uname -s)"

# ── Oh My Zsh ──────────────────────────────────────────────────────────────
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "→ Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "✓ Oh My Zsh already installed"
fi

# ── macOS ──────────────────────────────────────────────────────────────────
if [[ "$OS" == "Darwin" ]]; then
    if ! command -v brew &>/dev/null; then
        echo "→ Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    brew install eza zoxide zsh-syntax-highlighting zsh-autosuggestions fzf
    "$(brew --prefix)/opt/fzf/install" --all --no-bash --no-fish

# ── Ubuntu / Debian ────────────────────────────────────────────────────────
elif [[ "$OS" == "Linux" ]]; then
    sudo apt-get update -qq

    # eza — from official eza-community repo
    if ! command -v eza &>/dev/null; then
        sudo apt-get install -y gpg wget
        wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc \
            | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
        echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" \
            | sudo tee /etc/apt/sources.list.d/gierens.list
        sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
        sudo apt-get update -qq && sudo apt-get install -y eza
    fi

    # zoxide
    command -v zoxide &>/dev/null || \
        curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

    # fzf
    sudo apt-get install -y fzf

    # zsh plugins — cloned to ~/.zsh/ (Linux has no Homebrew prefix)
    # The dotfiles/zshrc sources from BREW_PREFIX; on Linux, adjust those
    # source lines to point to ~/.zsh/<plugin>/<plugin>.zsh instead.
    mkdir -p "$HOME/.zsh"
    [[ -d "$HOME/.zsh/zsh-syntax-highlighting" ]] || \
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
            "$HOME/.zsh/zsh-syntax-highlighting"
    [[ -d "$HOME/.zsh/zsh-autosuggestions" ]] || \
        git clone https://github.com/zsh-users/zsh-autosuggestions.git \
            "$HOME/.zsh/zsh-autosuggestions"

else
    echo "Unsupported OS: $OS" && exit 1
fi

echo ""
echo "Done."
echo "  cp dotfiles/zshrc ~/.zshrc"
echo "  exec zsh"
echo ""
echo "Linux users: update plugin source paths in ~/.zshrc — see 01_zsh.md."
