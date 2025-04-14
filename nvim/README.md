**Config works for linux, and probably MACos (? perchance)**

- Might want to backup, or delete previous config files before adding my config so nothing gets messed with

```console
# For file backup (recommended)
mv ~/.config/nvim{,.bak}

# For file removal (also recommended)
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

- To use, copy following line into terminal:

```console
git clone https://github.com/Shugarry/nvim_config.git ~/.config/nvim
```

- Also, you probably don't want my git files and README so you can delete them:

```console
rm -rf ~/.config/nvim/.git ~/.config/nvim/README.md
```

***!!! Warnings !!!***

- You need to have rg (ripgrep) for telescope to function correctly

[Download Here](https://github.com/BurntSushi/ripgrep)

- You also need Lua and Luarocks (In most systems, Lua is installed by default, not Luarocks though)

[Lua](https://www.lua.org/download.html)

[Luarocks](https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Unix)

**Some of my keybinds (Use :Tutor command to learn vim commands):**

- ctrl-ww to switch tabs

- Space-T to toggle transparency

- Space-ff for finding files in computer with rg

- Space-fg for finding code inside file contents

- Ctrl-Right & Ctrl-left for switching between buffers / tabs

- Ctrl-Down to close a buffer / tab
