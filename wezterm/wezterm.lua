local wezterm = require("wezterm")
local config = wezterm.config_builder()
local sessionizer = wezterm.plugin.require "https://github.com/mikkasendke/sessionizer.wezterm"

-- CONFIG

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

config.color_scheme = "rose-pine"
config.colors = {
	background = "black",
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
	saturation = 0.8,
	brightness = 0.7,
}

config.window_background_opacity = 0.85

config.font = wezterm.font("Mononoki Nerd Font Propo")
config.font_size = 15

config.disable_default_key_bindings = true

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
}

config.default_cursor_style = "SteadyBar"
config.animation_fps = 1
config.cursor_blink_rate = 0

return config
