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

					mappings = {
						["M"] = function (state)
							local node = state.tree:get_node()
							if node then
								state.clipboard = state.clipboard or {}
								local id = node:get_id()
								local data = state.clipboard[id]
								if data and data.action == "mark" then
									state.clipboard[id] = nil
								else
									state.clipboard[id] = { action = "mark", node = node }
								end
								require("neo-tree.ui.renderer").redraw(state)
							end
						end,
						["O"] = function (state)
							local clipboard = state.clipboard or {}
							for id, data in pairs(clipboard) do
								if data.action == "mark" then
									require("neo-tree.utils").open_file(state, id)
								end
							end
							require("neo-tree.ui.renderer").redraw(state)
						end
					}
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
				},
			})
		end,
	}
