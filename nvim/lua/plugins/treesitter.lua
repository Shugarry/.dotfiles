return { -- TREESITTER
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()

		local configs = require("nvim-treesitter.configs")
		configs.setup(
			{
				ensure_installed = { "c", "lua", "vim", "vimdoc" },
				autoinstall = true,
				sync_install = false,
				highlight = { enable = true },
				additional_vim_regex_highlighitng = false,
				indent = { enable = true },
			})
	end
}
