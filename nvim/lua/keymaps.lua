local function get_session_name()
	local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
	if vim.v.shell_error ~= 0 or not git_root or git_root == '' then
		return nil
	end
	local name = vim.fn.fnamemodify(git_root, ":t")
	return name:gsub("^%.+", "")
end

local builtin = require 'telescope.builtin'

return {

	--CHEAT SHEET
	vim.keymap.set('n', '<leader>c', require('nvcheatsheet').toggle, { desc = '[C]heatsheet'}),

	-- TELESCOPE KEYMAPS
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' }),
	vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' }),
	vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' }),
	vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[F]ind [S]elect Telescope' }),
	vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' }),
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' }),
	vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' }),
	vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' }),
	vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' }),
	vim.keymap.set('n', '<leader>fb', ":Telescope file_browser path=%:p:h select_buffer=true<CR><ESC>", { desc = "[F]ile [B]rowser"}),
	vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' }),

	vim.keymap.set('n', '<leader>/', function()
		builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
			winblend = 10,
			previewer = false,
		})
	end, { desc = '[/] Fuzzily search in current buffer' }),

	vim.keymap.set('n', '<leader>f/', function()
		builtin.live_grep {
			grep_open_files = true,
			prompt_title = 'Live Grep in Open Files',
		}
	end, { desc = '[S]earch [/] in Open Files' }),

	vim.keymap.set('n', '<leader>fn', function()
		builtin.find_files { cwd = vim.fn.stdpath 'config' }
	end, { desc = '[F]ind [N]eovim files' }) ,

	-- BUFFER KEYMAPS
	vim.keymap.set('n', '<C-j>', '<cmd>BufferClose!<CR>', { desc = 'Close buffer', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-k>', '<cmd>BufferRestore<CR>', { desc = 'Restore buffer', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-l>', '<cmd>BufferNext<CR>', { desc = 'Buffer: Go Next', noremap = true, silent = true }),
	vim.keymap.set('n', '<A-l>', '<cmd>BufferMoveNext<CR>', { desc = 'Buffer: Move Next', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-h>', '<cmd>BufferPrev<CR>', { desc = 'Buffer: Go Previous', noremap = true, silent = true }),
	vim.keymap.set('n', '<A-h>', '<cmd>BufferMovePrevious<CR>', { desc = 'Buffer: Move Previous', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-p>', '<cmd>wincmd w<CR>', { desc = 'Switch window', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-1>', '<cmd>BufferGoto 1<CR>', { desc = 'Tab 1', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-2>', '<cmd>BufferGoto 2<CR>', { desc = 'Tab 2', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-3>', '<cmd>BufferGoto 3<CR>', { desc = 'Tab 3', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-4>', '<cmd>BufferGoto 4<CR>', { desc = 'Tab 4', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-5>', '<cmd>BufferGoto 5<CR>', { desc = 'Tab 5', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-6>', '<cmd>BufferGoto 6<CR>', { desc = 'Tab 6', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-7>', '<cmd>BufferGoto 7<CR>', { desc = 'Tab 7', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-8>', '<cmd>BufferGoto 8<CR>', { desc = 'Tab 8', noremap = true, silent = true }),
	vim.keymap.set('n', '<C-9>', '<cmd>BufferGoto 9<CR>', { desc = 'Tab 9', noremap = true, silent = true }),

	-- UNDOTREE KEYMAPS
	vim.keymap.set('n', '<leader>ut', '<cmd>UndotreeToggle<CR>', {desc = '[U]ndo[T]ree toggle'}),

	-- TRANSPARENT.NVIM KEYMAPS
	vim.keymap.set('n', '<leader>T', '<cmd>TransparentToggle<CR>', { desc = '[T]ransparency toggle' }),

	-- SESSIONS
	vim.keymap.set("n", "<leader>ss", function()
		local name = get_session_name()
		if name then
			require("mini.sessions").write(name, {
				force = true,
				verbose = true,
			})
		else
			vim.notify("Not in a Git project. Session not saved.", vim.log.levels.WARN)
		end
	end, { desc = "[S]ave session manually" }),
	vim.keymap.set("n", "<leader>sl", function()
		require("mini.sessions").select("read", {
			force = true,
			verbose = true,
		})
	end, { desc = "[L]oad neovim session" }),
	vim.keymap.set("n", "<leader>sd", function()
		require("mini.sessions").select("delete", {
			force = true,
			verbose = true,
		})
	end, { desc = "[D]elete a session" }),

	-- VIM KEYMAPS
	vim.keymap.set('n', '<C-s>', '<cmd>wa<CR>', { desc = 'Save all files' }),
	vim.keymap.set('n', '<C-a>', 'ggVG', { desc = 'Select all', noremap = true, silent = true }),

	vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]]),
	vim.keymap.set('n', '<C-t>', '<cmd>term<CR>'),
	vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move text down in visual mode' }),
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

	vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[S]earch and [R]eplace' }),
	vim.keymap.set("v", "<leader>S", [[:s///g<Left><Left><Left>]], { desc = '[S]earch and [R]eplace in selection' }),

	vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>'),

	vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' }),
}
