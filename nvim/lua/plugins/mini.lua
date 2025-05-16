local header_art = 
[[
 ╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮
 │││├┤ │ │╰┐┌╯││││
 ╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴
]]

local function get_session_name()
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 or not git_root or git_root == '' then
    return nil
  end
  local name = vim.fn.fnamemodify(git_root, ":t")
  return name:gsub("^%.+", "")
end

return
	{
		{ -- MINI (Various small helpful plugins)
			"echasnovski/mini.nvim",
			version = "*",
			config = function()
				require("mini.ai").setup({ n_lines = 500 })
				require("mini.surround").setup()
				require("mini.pairs").setup({})
				require("mini.sessions").setup({
					autoread = false,
					autowrite = false,
					directory = os.getenv("HOME") .. '/.dotfiles/nvim/sessions',
					file = '',
					vim.api.nvim_create_autocmd("VimLeavePre", {
						callback = function()
							local name = get_session_name()
							if name then
								require("mini.sessions").write(name, { force = true, verbose = true })
							end
						end,
					})
				})
				local starter = require('mini.starter')
				starter.setup({
					items = {
						starter.sections.sessions(77, true),
						starter.sections.builtin_actions(),
					},
					content_hooks = {
						function(content)
							local blank_content_line = { { type = 'empty', string = '' } }
							local section_coords = starter.content_coords(content, 'section')
							for i = #section_coords, 1, -1 do
								table.insert(content, section_coords[i].line + 1, blank_content_line)
							end
							return content
						end,
						starter.gen_hook.adding_bullet("» "),
						starter.gen_hook.aligning('center', 'center'),
					},
					header = header_art,
					footer = '',
				})
				local statusline = require("mini.statusline")
				statusline.setup({ use_icons = true })
				---@diagnostic disable-next-line: duplicate-set-field
				statusline.section_location = function()
					return "%2l:%-2v"
				end
			end,
		},
	}
