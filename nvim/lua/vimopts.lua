-- Set keymap leaders
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- User / email vars for 42-header
vim.g.user = "frey-gal"
vim.g.mail = "frey-gal@student.42barcelona.com"

-- Line numbers and mouse support
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.colorcolumn = "80"

-- Indentation
vim.opt.autoindent = true
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.smartindent = true

-- History
vim.opt.history = 1000

-- UI
vim.opt.termguicolors = true

-- Useful stuff
vim.opt.swapfile = false
vim.opt.scrolloff = 10
vim.opt.wrap = false
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.inccommand = 'split'

vim.opt.cursorline = true

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.confirm = true

vim.opt.signcolumn = 'yes'

vim.opt.breakindent = true

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
