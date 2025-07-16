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
	lazy = false,
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

	end,
}
