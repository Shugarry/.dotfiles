return {

	-- GENERAL VIM KEYMAPS
	vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]]),
	vim.keymap.set('n', '<C-t>', '<cmd>term<CR>'),

	-- NEOTREE KEYMAPS
	vim.keymap.set('n', '<leader>t', '<cmd>Neotree toggle focus position=float<CR>', { desc = 'Neotree: Toggle' }),

	-- BUFFER KEYMAPS
	vim.keymap.set('n', '<C-j>', '<cmd>BufferClose!<CR>', { desc = 'Close buffer', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-k>', '<cmd>BufferRestore<CR>', { desc = 'Restore buffer', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-l>', '<cmd>BufferNext<CR>', { desc = 'Buffer: Go Next', noremap = true, silent = true }),
	vim.keymap.set('n', '<A-l>', '<cmd>BufferMoveNext<CR>', { desc = 'Buffer: Move Next', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-h>', '<cmd>BufferPrev<CR>', { desc = 'Buffer: Go Previous', noremap = true, silent = true }),
	vim.keymap.set('n', '<A-h>', '<cmd>BufferMovePrevious<CR>', { desc = 'Buffer: Move Previous', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-p>', '<cmd>wincmd w<CR>', { desc = 'Switch window', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-s>', '<cmd>wa<CR>', { desc = 'Save all files' }),
	vim.keymap.set('n', '<C-1>', '<cmd>BufferGoto 1<CR>', { desc = 'Tab 1', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-2>', '<cmd>BufferGoto 2<CR>', { desc = 'Tab 1', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-3>', '<cmd>BufferGoto 3<CR>', { desc = 'Tab 1', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-4>', '<cmd>BufferGoto 4<CR>', { desc = 'Tab 1', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-5>', '<cmd>BufferGoto 5<CR>', { desc = 'Tab 1', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-6>', '<cmd>BufferGoto 6<CR>', { desc = 'Tab 1', noremap = true, silent = true }),

	-- TRANSPARENT.NVIM KEYMAPS
	vim.keymap.set('n', '<leader>T', '<cmd>TransparentToggle<CR>', { desc = '[T]ransparency toggle' }),

	-- GRUG-FAR KEYMAPS
	vim.keymap.set('n', '<leader>gf', '<cmd>GrugFar<CR>', { desc = '[G]rug[F]ar' , noremap = true, silent = true }),


	-- VIM KEYMAPS
	vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move text up in visual mode' }),
	vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move text up in visual mode' }),

	vim.keymap.set("x", "<", "<gv", { desc = 'Stay in visual mode while indented' }),
	vim.keymap.set("x", ">", ">gv", { desc = 'Stay in visual mode while indented' }),


	vim.keymap.set("n", "J", "mzJ`z"), -- Stay in middle while moving through file
	vim.keymap.set("n", "<C-d>", "<C-d>zz"),
	vim.keymap.set("n", "<C-u>", "<C-u>zz"),
	vim.keymap.set("n", "n", "nzzzv"),
	vim.keymap.set("n", "N", "Nzzzv"),

	vim.keymap.set("x", "<leader>p", [["_dP]], { desc = 'Paste selection into void' }),

	vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = '[Y]ank selection into clipboard' }),
	vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = '[Y]ank line into clipboard' }) ,

	vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = '[D]elete into void' }),

	vim.keymap.set("n", "Q", "<nop>"),

	vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[S]earch and replace' }),
	vim.keymap.set("v", "<leader>s", [[:<C-u>'<,'>s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[S]earch and replace in selection' }),

	vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>'),

	vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' }),
}
