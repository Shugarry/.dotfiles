#!/bin/bash

# Error handling
set -euo pipefail

echo "Dotfiles installation starting"

# Vars
DOTFILES_DIR="$HOME/.dotfiles"

# Neovim
link_with_backup "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# i3
link_with_backup "$DOTFILES_DIR/i3" "$HOME/.config/i3"

# Wezterm
link_with_backup "$DOTFILES_DIR/wezterm/.wezterm.lua" "$HOME/.wezterm.lua"

# Zsh
link_with_backup "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
link_with_backup "$DOTFILES_DIR/zsh/.zsh" "$HOME/.zsh"

echo "Dotfiles installation complete!"
