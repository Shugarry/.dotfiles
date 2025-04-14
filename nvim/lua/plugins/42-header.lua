return {
	"Diogo-ss/42-header.nvim",
	cmd = { "Stdheader" },
	keys = { "<F1>" },
	opts = {
		default_map = true, -- Default mapping <F1> in normal mode.
		auto_update = true, -- Update header when saving.
		user = "frey-gal",
		---Default user.email.
		mail = "frey-gal@student.42barcelona.com",
		git = {
			enabled = false,
			bin = "git",
			user_global = false,
			email_global = false,
		}
	},
	config = function()
		require("42header").setup({})
	end
}
