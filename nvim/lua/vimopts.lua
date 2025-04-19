-- Set keymap leaders
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- User / email vars
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
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- Useful stuff
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.updatetime = 50

-- Remaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move text in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z") -- everything in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]]) -- paste and keep paste buffer

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- yank into clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]]) 

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]]) -- delete into void

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format) -- use later

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- search and replace
