-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Require vim options in vimopts file
require("vimopts")

-- Setup lazy.nvim
require("lazy").setup("plugins")

-- Require keymaps in keymaps file
require("keymaps")

-- Neo-Tree Color
vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { fg = "#f6c177", bold = true })
vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg = "#f6c177", bold = true })
vim.api.nvim_set_hl(0, "IblIndent", { fg = "#ffffff" })  -- Regular indentation lines
