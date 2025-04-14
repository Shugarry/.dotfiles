local builtin = require('telescope.builtin')

return {

	-- GENERAL VIM KEYMAPS
	vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]]),
	vim.keymap.set('n', '<C-t>', '<cmd>term<CR>'),

	-- TELESCOPE KEYMAPS
	vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope: Find Files' }),
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope: Live Grep' }),
	vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope: Buffers' }),
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope: Help Tags' }),

	-- NEOTREE KEYMAPS
	vim.keymap.set('n', '<leader>t', '<cmd>Neotree toggle focus position=left<CR>', { desc = 'Neotree: Toggle' }),

	-- BUFFER KEYMAPS
	vim.keymap.set('n', '<C-j>', '<cmd>BufferClose!<CR>', { desc = 'Close buffer', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-k>', '<cmd>BufferRestore<CR>', { desc = 'Restore buffer', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-l>', '<cmd>BufferNext<CR>', { desc = 'Buffer: Next', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-h>', '<cmd>BufferPrev<CR>', { desc = 'Buffer: Previous', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-p>', '<cmd>wincmd w<CR>', { desc = 'Switch window', noremap = true, silent = true }),
	vim.keymap.set('n', '<leader>.', '<cmd>BufferPin<CR>', { noremap = true, silent = true, desc = 'Pin tab' }),
	vim.keymap.set('n', '<C-s>', '<cmd>wa<CR>', { desc = 'Save all files' }),

	-- TRANSPARENT.NVIM KEYMAPS
	vim.keymap.set('n', '<leader>T', '<cmd>TransparentToggle<CR>', { desc = 'Transparency toggle' }),

	-- LSP KEYMAPS
	

	-- GRUG-FAR KEYMAPS
	vim.keymap.set('n', '<leader>gf', '<cmd>GrugFar<CR>', { desc = 'Find and replace' , noremap = true, silent = true }),

}
