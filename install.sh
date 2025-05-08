#!/bin/bash

set -e  # Exit on error

DOTFILES_DIR="$HOME/.dotfiles"

echo "Setting up symlinks from $DOTFILES_DIR..."

# Git
ln -sf "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"

# Neovim
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# Wezterm
ln -sf "$DOTFILES_DIR/wezterm/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua"
mkdir -p "$DOTFILES_DIR/wezterm/resurrect"

# Zsh
ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/zsh/.zsh" "$HOME/.zsh"

# Fonts
cp -r "$DOTFILES_DIR/fonts" "$HOME/.fonts"

#Vim
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.vimrc"

echo "Dotfiles symlinks created successfully!"
