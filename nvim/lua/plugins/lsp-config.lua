return {
	{ -- MASON.NVIM
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{ -- MASON LSP-CONFIG
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {"clangd", "lua_ls", "marksman"}
			})
		end
	},
	{ -- NVIM LSP-CONFIG
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.clangd.setup({})
			lspconfig.lua_ls.setup({})
			lspconfig.marksman.setup({})
		end
	}
}
