#!/bin/bash

set -e  # Exit on error

DOTFILES_DIR="$HOME/.dotfiles"

echo "Setting up symlinks from $DOTFILES_DIR..."

# Neovim
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# i3
ln -sf "$DOTFILES_DIR/i3" "$HOME/.config/i3"

# Wezterm
ln -sf "$DOTFILES_DIR/wezterm/.wezterm.lua" "$HOME/.wezterm.lua"

# Zsh
ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/zsh/.zsh" "$HOME/.zsh"

# Fonts
cp -r "$DOTFILES_DIR/fonts/*" "$HOME/.fonts"

echo "Dotfiles symlinks created successfully!"
