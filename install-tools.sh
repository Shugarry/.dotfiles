#!/bin/bash
set -euo pipefail

# Create necessary directories
mkdir -p ~/.local/bin ~/.local/share/applications

# Function to clean up temporary files
cleanup() {
  echo "Cleaning up temporary files..."
  rm -rf /tmp/wezterm.AppImage \
         /tmp/nvim.AppImage \
         lua-5.4.7* \
         luarocks-3.9.2* \
         ~/lua-5.4.7 \
         ~/luarocks-3.9.2
}

# Trap interrupts and errors to ensure cleanup
trap cleanup EXIT ERR

# Install WezTerm
echo "Installing WezTerm..."
curl -L -o /tmp/wezterm.AppImage \
  https://github.com/wezterm/wezterm/releases/download/20240203-110809-5046fc22/WezTerm-20240203-110809-5046fc22-Ubuntu20.04.AppImage
chmod +x /tmp/wezterm.AppImage
mv /tmp/wezterm.AppImage ~/.local/bin/wezterm

# Install Neovim (v0.10.3 because its the latest that wget works with but you can install your own as well)
echo "Installing Neovim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim.appimage
mv nvim.appimage $HOME/.local/bin/nvim

# Install ripgrep (if Rust/cargo is installed)
if command -v cargo &> /dev/null; then
  echo "Installing ripgrep..."
  cargo install ripgrep --root ~/.local
else
  echo "Skipping ripgrep: cargo not found. Install Rust first."
fi

# Install Lua
echo "Installing Lua..."
curl -L -R -O https://www.lua.org/ftp/lua-5.4.7.tar.gz
tar zxf lua-5.4.7.tar.gz
cd lua-5.4.7
make all test
make install INSTALL_TOP=~/.local
cd ..

# Install LuaRocks
echo "Installing LuaRocks..."
wget https://luarocks.org/releases/luarocks-3.9.2.tar.gz
tar zxf luarocks-3.9.2.tar.gz
cd luarocks-3.9.2
./configure --prefix=$HOME/.local
make build
make install
cd ..

# Install zoxide
echo "Installing zoxide..."
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Install fzf
echo "Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-update-rc --no-bash --no-zsh --no-fish

source ~/.zshrc

echo "Installation complete!"
echo "The following tools were installed to ~/.local/bin/:"
ls -lh ~/.local/bin/
