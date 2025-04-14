return { -- UI CONFIG (MAKE NVIM LOOK NICE)
	{ -- LUALINE (STATUSLINE)
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			'lewis6991/gitsigns.nvim'
		},
		lazy = false,
		config = function()
			require('lualine').setup({
				theme = 'gruvbox-material',
			})
		end
	},
	{ -- CURSORLINE (WORD HIGHLIGHTING)
		'ya2s/nvim-cursorline',
		lazy = false,
		config = function()
			require('nvim-cursorline').setup {
				cursorline = {
					enable = true,
					timeout = 1000,
					number = false,
				},
				cursorword = {
					enable = true,
					min_length = 3,
					hl = { underline = true },
				}
			}
		end
	},
	{ -- WHICH-KEY (UI FOR SHORTCUTS)
		"folke/which-key.nvim",
		lazy = false,
		opts = {},
		config = function()
			local wk = require("which-key")
			wk.setup({
				plugins = { spelling = { enabled = false } },
				disable = { filetypes = { "TelescopePrompt", "neo-tree" } }
			})
		end
	},
	{ -- INDENT-BLANKLINE (INDENTATION GUIDELINES)
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
		config = function()
			require("ibl").setup({
				indent = {
					char = "│",
					smart_indent_cap = true,
				},
				scope = {
					enabled = true,
					show_start = true,
					show_end = true,
					highlight = {"Function", "Label"},
				},
				exclude = {
					filetypes = {
						"help",
						"dashboard",
						"lazy",
						"mason",
						"NvimTree",
						"neo-tree",
						"Trouble",
					},
					buftypes = {
						"terminal",
						"nofile",
						"quickfix",
						"prompt",
					},
				},
			})
		end
	},
	{ -- BARBAR (TAB INTEGRATION)
		'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim',
			'nvim-tree/nvim-web-devicons',
		},
		opts = {},
		config = function()
			require('barbar').setup({
				preset = 'slanted',
				tabpages = true,
				animation = false,
				clickable = true,
				auto_hide = false,
				insert_at_end = true,
			})
		end
	}
}
