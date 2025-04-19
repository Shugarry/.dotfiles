-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:

config.color_scheme = 'rose-pine'

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_and_split_indices_are_zero_based = true

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

config.font =
	wezterm.font("Mononoki Nerd Font Propo")
config.font_size = 15

config.disable_default_key_bindings = true

config.keys = {

	{ key = "o", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }, },

	{ key = "e", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }, },

	{ key = "Tab", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },

    { key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },

	{ key = "t", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab("DefaultDomain")},

	{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentPane { confirm = true }},

	{ key = "h", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },

	{ key = "j", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },

	{ key = "k", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },

	{ key = "l", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },

	{ key = "h", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },

	{ key = "j", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },

	{ key = "k", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },

	{ key = "l", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },

	{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard")},

	{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard")},

	{ key = "Enter", mods = "ALT", action = wezterm.action.ToggleFullScreen },

    { key = '=', mods = 'CTRL', action = wezterm.action.IncreaseFontSize, },

    { key = '-', mods = 'CTRL', action = wezterm.action.DecreaseFontSize, },

    { key = '0', mods = 'CTRL', action = wezterm.action.ResetFontSize, },

}

config.default_cursor_style = "SteadyBar"
config.animation_fps = 1
config.cursor_blink_rate = 0

-- and finally, return the configuration to wezterm
return config
