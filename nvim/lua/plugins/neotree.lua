return
	{ --NEOTREE
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v3.x',
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		lazy = false,
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				window = {
					position = "current",
				},
				filesystem = {
					filtered_items = {
						visible = false, -- show hidden files if true
						hide_dotfiles = true,
						hide_gitignored = true,
						hide_by_name = {
							"node_modules",
							"package-lock.json",
							".DS_Store",
						},
						hide_by_pattern = {
							"*.log",
							"*.o",
							"*.out",
							"__pycache__",
						},
					},
				}
			})
		end,
	}
