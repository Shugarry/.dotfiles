return { -- UI CONFIG
	{ -- CURSORLINE (WORD HIGHLIGHTING)
		"ya2s/nvim-cursorline",
		lazy = false,
		config = function()
			require("nvim-cursorline").setup({
				cursorline = {
					enable = true,
					timeout = 1000,
					number = false,
				},
				cursorword = {
					enable = true,
					min_length = 3,
					hl = { underline = true },
				},
			})
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VimEnter",
		opts = {
			delay = 0,
			icons = {
				mappings = true,
				keys = vim.g.have_nerd_font and {} or {
					Up = "<Up> ",
					Down = "<Down> ",
					Left = "<Left> ",
					Right = "<Right> ",
					C = "<C-…> ",
					M = "<M-…> ",
					D = "<D-…> ",
					S = "<S-…> ",
					CR = "<CR> ",
					Esc = "<Esc> ",
					ScrollWheelDown = "<ScrollWheelDown> ",
					ScrollWheelUp = "<ScrollWheelUp> ",
					NL = "<NL> ",
					BS = "<BS> ",
					Space = "<Space> ",
					Tab = "<Tab> ",
					F1 = "<F1>",
					F2 = "<F2>",
					F3 = "<F3>",
					F4 = "<F4>",
					F5 = "<F5>",
					F6 = "<F6>",
					F7 = "<F7>",
					F8 = "<F8>",
					F9 = "<F9>",
					F10 = "<F10>",
					F11 = "<F11>",
					F12 = "<F12>",
				},
			},

			spec = {
				{ "<leader>f", group = "Telescope" },
				{ "<leader>s", group = "[S]essions" },
			},
		},
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
					char = "▎",
					smart_indent_cap = true,
				},
				scope = {
					enabled = true,
					show_start = true,
					show_end = true,
					highlight = { "Function", "Label" },
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
		end,
	},
	{ -- BARBAR (TAB INTEGRATION)
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
		config = function()
			require("barbar").setup({
				preset = "slanted",
				tabpages = true,
				animation = false,
				clickable = true,
				auto_hide = false,
				insert_at_end = true,
			})
		end,
	},
	{ -- COMMENT HIGHLIGHTING
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{ -- COMMENT MULTIPLE LINES (<leader>gc to comment)
		"numToStr/Comment.nvim",
		config = function()
			require('Comment').setup()
		end
	},
	{ -- MULTIPLE CURSORS
		'mg979/vim-visual-multi'
	},
	{ -- UNDO TREE
		'mbbill/undotree'
	},
	{ -- GIT CONFLICT
		'akinsho/git-conflict.nvim',
		version = "*",
		config = true
	}
}
