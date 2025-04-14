return {
	{ -- TELESCOPE
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local builtin = require('telescope.builtin')
			require('telescope').setup({
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
						"--glob=!**/.git/*"
					}
				},
				pickers = {
					find_files = {
						find_command = {
							"rg", "--files", "--hidden", "--glob", "!**/.git/*"
						}
					},
					live_grep = {
						additional_args = { "--hidden" }
					}
				}
			})
		end
	},

	{ -- TELESCOPE UI SELECT
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			require("telescope").setup {
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {
						}
					}
				}
			}
			require("telescope").load_extension("ui-select")end
	}
}
