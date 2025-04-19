return {
	{ -- GRUVBOX MATERIAL
--		"sainnhe/gruvbox-material",
--		lazy = false,
--		priority = 1000,
--		config = function()
--			vim.g.gruvbox_material_enable_italic = true
--			vim.cmd.colorscheme('gruvbox-material')
--		end
	},
	{ -- ROSE PINE
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
			})
			vim.cmd.colorscheme("rose-pine")
		end
	},
	{ -- TRANSPARENT.NVIM
		"xiyaowong/transparent.nvim",
		config = function()
			vim.g.transparent_enabled = true
			require('transparent').clear_prefix('NeoTree')
		end
	}
}
