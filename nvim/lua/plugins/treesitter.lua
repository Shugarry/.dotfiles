return { -- TREESITTER
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {"cmake", "make", "c", "lua", "vim", "vimdoc", "markdown", "markdown_inline", "bash" },
			autoinstall = true,
			sync_install = false,
			highlight = { enable = true },
			additional_vim_regex_highlighitng = false,
			indent = { enable = true },
		})
	end,
}
