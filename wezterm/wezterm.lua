local wezterm = require("wezterm")
local config = wezterm.config_builder()
local sessionizer = wezterm.plugin.require "https://github.com/mikkasendke/sessionizer.wezterm"
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")
local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').main

-- SESSIONIZER

local my_schema = {
	options = {
		title = "Projects",
		prompt = "Select project: ",
	},

	sessionizer.FdSearch {
		wezterm.home_dir,
		exclude = { ".local" },
	},
	processing = sessionizer.for_each_entry(function(entry)
		entry.label = entry.label:gsub(wezterm.home_dir, "~")
	end)
}

-- RESURRECT WORKSPACE

resurrect.state_manager.change_state_save_dir(os.getenv("HOME") .. "/.dotfiles/wezterm/resurrect/")

wezterm.on("resurrect.error", function(err)
	wezterm.log_error("ERROR!")
	wezterm.gui.gui_windows()[1]:toast_notification("resurrect", err, nil, 3000)
end)

-- TERMINAL CONFIG
config.color_scheme = "rose-pine"
config.colors = {
	background = "black",
	selection_bg = '#c4a7e7',
	selection_fg = '#191724',
	tab_bar = {
		background = '#191724',
		active_tab = {
			bg_color = '#26233a',
			fg_color = '#eb6f92',
			intensity = 'Normal',
			underline = 'Single',
			italic = true,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = '#1f1d2e',
			fg_color = '#908caa',
			intensity = 'Normal',
			underline = 'None',
			italic = false,
			strikethrough = false,
		},
		inactive_tab_hover = {
			bg_color = '#2a2837',
			fg_color = '#c4a7e7',
			intensity = 'Normal',
			underline = 'None',
			italic = true,
			strikethrough = false,
		},
		new_tab = {
			bg_color = '#191724', -- Base
			fg_color = '#c4a7e7', -- Subtle
		},
		new_tab_hover = {
			bg_color = '#c4a7e7',
			fg_color = '#191724', -- Text
			italic = false,
		},
	},
}

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.window_decorations = "NONE" -- "TITLE | RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.inactive_pane_hsb = {
	saturation = 0.35,
	brightness = 0.7,
}

config.window_background_opacity = 0.85

config.font = wezterm.font("Mononoki Nerd Font Propo")
config.font_size = 15

config.disable_default_key_bindings = true
config.max_fps = 60

config.animation_fps = 1
config.default_cursor_style = "SteadyBar"
config.cursor_blink_rate = 0

-- KEYBINDS

config.keys = {

	{ key = "o", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

	{ key = "e", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	{ key = "Tab", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },

	{ key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },

	{ key = "t", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab("DefaultDomain") },

	{ key = "1", mods = "ALT", action = wezterm.action.ActivateTab(0) },
	{ key = "2", mods = "ALT", action = wezterm.action.ActivateTab(1) },
	{ key = "3", mods = "ALT", action = wezterm.action.ActivateTab(2) },
	{ key = "4", mods = "ALT", action = wezterm.action.ActivateTab(3) },
	{ key = "5", mods = "ALT", action = wezterm.action.ActivateTab(4) },
	{ key = "6", mods = "ALT", action = wezterm.action.ActivateTab(5) },
	{ key = "7", mods = "ALT", action = wezterm.action.ActivateTab(6) },
	{ key = "8", mods = "ALT", action = wezterm.action.ActivateTab(7) },
	{ key = "9", mods = "ALT", action = wezterm.action.ActivateTab(8) },
	{ key = "0", mods = "ALT", action = wezterm.action.ActivateTab(9) },

	{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = true }) },

	{ key = "h", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },

	{ key = "j", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },

	{ key = "k", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },

	{ key = "l", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },

	{ key = "h", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },

	{ key = "j", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },

	{ key = "k", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },

	{ key = "l", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },

	{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },

	{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },

	{ key = "Enter", mods = "ALT", action = wezterm.action.ToggleFullScreen },

	{ key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },

	{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },

	{ key = "0", mods = "CTRL", action = wezterm.action.ResetFontSize },

	{ key = "f", mods = "CTRL", action = sessionizer.show(my_schema) },

	{
		key = "s",
		mods = "ALT",
		action = wezterm.action_callback(function(win, pane)
			resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
			resurrect.window_state.save_window_action()
		end),
	},
	{
		key = "r",
		mods = "ALT",
		action = wezterm.action_callback(function(win, pane)
			resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id, label)
				local type = string.match(id, "^([^/]+)") -- match before '/'
				id = string.match(id, "([^/]+)$") -- match after '/'
				id = string.match(id, "(.+)%..+$") -- remove file extention
				local opts = {
					relative = true,
					restore_text = true,
					on_pane_restore = resurrect.tab_state.default_on_pane_restore,
				}
				if type == "workspace" then
					local state = resurrect.state_manager.load_state(id, "workspace")
					resurrect.workspace_state.restore_workspace(state, opts)
				elseif type == "window" then
					local state = resurrect.state_manager.load_state(id, "window")
					resurrect.window_state.restore_window(pane:window(), state, opts)
				elseif type == "tab" then
					local state = resurrect.state_manager.load_state(id, "tab")
					resurrect.tab_state.restore_tab(pane:tab(), state, opts)
				end
			end)
		end),
	},
	{
		key = "d",
		mods = "ALT",
		action = wezterm.action_callback(function(win, pane)
			resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id)
				resurrect.state_manager.delete_state(id)
			end,
				{
					title = "Delete State",
					description = "Select State to Delete and press Enter = accept, Esc = cancel, / = filter",
					fuzzy_description = "Search State to Delete: ",
					is_fuzzy = true,
				})
		end),
	},
}

return config
