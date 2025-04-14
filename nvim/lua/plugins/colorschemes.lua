return { -- Uncomment the one you would like to use
	{ -- KANAGAWA COLORSCHEME
		"rebelot/kanagawa.nvim",
		priority=1000,
		lazy = false,
		config = function()
			--vim.opt.termguicolors = true
			--require('kanagawa').setup({})
			--vim.cmd.colorscheme("kanagawa-wave")
		end
	},
	{ -- WITCH COLORSCHEME
		"sontungexpt/witch",
		priority = 1000,
		lazy = false,
		config = function(_, opts)
		--	require("witch").setup(opts)
		end,
	},
	{ -- GRUVBOX-MATERIAL COLORSCHEME
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
		--	vim.opt.termguicolors = true
		--	vim.g.gruvbox_material_enable_italic = true
		--	vim.cmd.colorscheme('gruvbox-material')
		end
	},
	{ -- GRUVBOX-FLAT COLORSCHEME
		"eddyekofo94/gruvbox-flat.nvim",
		priority = 1000,
		lazy = false,
		enabled = true,
		config = function()
			--vim.opt.termguicolors = true
			--vim.cmd([[colorscheme gruvbox-flat]])
		end
	},
	{ -- CARET COLORSCHEME
		'projekt0n/caret.nvim',
		priority = 1000,
		lazy = false,
		config = function()
			--vim.opt.termguicolors = true
			--vim.o.background = 'dark'
			--vim.cmd('colorscheme caret')
		end
	},
	{ -- EVERFOREST COLORSCHEME
		'sainnhe/everforest',
		lazy = false,
		priority = 1000,
		config = function()
			--vim.opt.termguicolors = true
			-- vim.g.everforest_enable_italic = true
			-- vim.cmd.colorscheme('everforest')
		end
	},
	{ -- MELANGE COLORSCHEME
		"savq/melange-nvim",
		lazy = false,
		config = function()
			--vim.opt.termguicolors = true
			--vim.cmd.colorscheme 'melange'
		end
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.opt.termguicolors = true
			require("rose-pine").setup({
				variant = "moon"
			})
			vim.cmd.colorscheme("rose-pine")
		end
	}
}
