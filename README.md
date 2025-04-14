# Shugarry's Dotfiles

This repository contains my personal dotfiles, tailored to optimize my development workflow.  

## Configurations and apps added:

- Neovim
- zsh
- i3
- Wezterm
- Fonts that I like
- Also adds a bunch of dependencies automatically for the aforementiones apps via the install scripts

## Installation


### Clone the Repository

Clone the repository to your home directory:

```bash
git clone --recursive https://github.com/Shugarry/.dotfiles.git ~/.dotfiles
```

The `--recursive` flag ensures that all submodules are cloned as well.

### Run the Installation Script

Navigate to the `.dotfiles` directory and execute the installation script to copy the configurations:
- (You might need to delete previous configuration files)

```bash
cd ~/.dotfiles
./install.sh
```

### Install Additional Tools

This script installs additional tools and dependencies you might need for the setup to work correctly.
- Includes: ripgrep, zoxide, Lua, luarocks...

```bash
./install-tools.sh
```
