local actions = require "telescope.actions"

---Telescope action helper to open single or multiple files
---@param bufnr integer Telescope prompt buffer number
local function telescope_open_single_or_multi(bufnr)
	local actions_state = require("telescope.actions.state")
	local single_selection = actions_state.get_selected_entry()
	local multi_selection = actions_state.get_current_picker(bufnr):get_multi_selection()
	if not vim.tbl_isempty(multi_selection) then
		actions.close(bufnr)
		for _, file in pairs(multi_selection) do
			if file.path ~= nil then
				vim.cmd(string.format("edit %s", file.path))
			end
		end
		vim.cmd(string.format("edit %s", single_selection.path))
	else
		actions.select_default(bufnr)
	end
end

return {
	'nvim-telescope/telescope.nvim',
	event = 'VimEnter',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		},
		{ 'nvim-telescope/telescope-ui-select.nvim' },
		{ 'nvim-tree/nvim-web-devicons', enabled = true },
		{ "nvim-telescope/telescope-file-browser.nvim", },
	},
	config = function()
		require('telescope').setup {
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						width = { padding = 0 },
						height = { padding = 0 },
						preview_width = 0.5,
					}
				},
				sorting_strategy = "ascending",
				file_ignore_patterns = {
					"%.git/",     -- ignore .git directory
					"node_modules/",
					"%.lock",     -- lock files like package-lock.json
					"%.log$",     -- log files
					"__pycache__/",
					"%.o$",       -- object files
					"%.out$",       -- executables
				},
				mappings = {
					["i"] = {
						["<CR>"] = telescope_open_single_or_multi,
						["<Tab>"] = actions.toggle_selection
					},
					["n"] = {
						["<CR>"] = telescope_open_single_or_multi,
						["<Tab>"] = actions.toggle_selection
					}
				}
			},
			extensions = {
				['ui-select'] = {
					require('telescope.themes').get_dropdown(),
				},

				file_browser = {
					hijack_netrw = true,
				}
			},
		}
		pcall(require('telescope').load_extension, 'fzf')
		pcall(require('telescope').load_extension, 'ui-select')

		local builtin = require 'telescope.builtin'
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
		vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
		vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[F]ind [S]elect Telescope' })
		vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
		vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
		vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
		vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR><ESC>", { desc = "[F]ile [B]rowser"})
		vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

		vim.keymap.set('n', '<leader>/', function()
			builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
				winblend = 10,
				previewer = false,
			})
		end, { desc = '[/] Fuzzily search in current buffer' })

		vim.keymap.set('n', '<leader>f/', function()
			builtin.live_grep {
				grep_open_files = true,
				prompt_title = 'Live Grep in Open Files',
			}
		end, { desc = '[S]earch [/] in Open Files' })

		vim.keymap.set('n', '<leader>fn', function()
			builtin.find_files { cwd = vim.fn.stdpath 'config' }
		end, { desc = '[S]earch [N]eovim files' })
	end,
}
