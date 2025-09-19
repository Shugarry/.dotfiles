#!/bin/bash

set -e  # Exit on error

DOTFILES_DIR="$HOME/.dotfiles"

echo "Setting up symlinks from $DOTFILES_DIR..."

# Git
ln -sf "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"

# Neovim
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
mkdir -p "$DOTFILES_DIR/nvim/sessions"

# Wezterm
mkdir -p "$HOME/.config/wezterm"
ln -sf "$DOTFILES_DIR/wezterm/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua"

# Zsh
ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/zsh/.zsh" "$HOME/.zsh"

#Vim
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.vimrc"

#Themes and fonts
ln -sf "$DOTFILES_DIR/.themes $HOME"
ln -sf "$DOTFILES_DIR/.fonts" "$HOME"

#clang-format
ln -sf "$DOTFILES_DIR/.clang-format $HOME"

echo "Dotfiles symlinks created successfully!"
