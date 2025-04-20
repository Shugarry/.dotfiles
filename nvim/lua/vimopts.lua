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
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move text up in visual mode' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move text up in visual mode' })

vim.keymap.set("n", "J", "mzJ`z") -- Stay in middle while moving through file
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = 'Paste selection into void' })

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = 'Yank selection into clipboard' })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = 'Yank line into clipboard' }) 

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = 'Delete into void' })

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format) -- use later

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Search and replace' }) -- search and replace
