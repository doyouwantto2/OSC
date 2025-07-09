local wezterm = require("wezterm")
local config = {}
local act = wezterm.action

config.color_scheme = "rebecca"
config.window_background_opacity = 0.8
config.warn_about_missing_glyphs = false
config.enable_wayland = true

config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false

local colors = {
	rosewater = "#f4dbd6",
	flamingo = "#f0c6c6",
	pink = "#f5bde6",
	mauve = "#c6a0f6",
	red = "#ed8796",
	maroon = "#ee99a0",
	peach = "#f5a97f",
	yellow = "#eed49f",
	green = "#a6da95",
	teal = "#8bd5ca",
	sky = "#91d7e3",
	sapphire = "#7dc4e4",
	blue = "#8aadf4",
	lavender = "#b7bdf8",
	text = "#cad3f5",
	subtext1 = "#b8c0e0",
	subtext0 = "#a5adcb",
	overlay2 = "#939ab7",
	overlay1 = "#8087a2",
	overlay0 = "#6e738d",
	surface2 = "#5b6078",
	surface1 = "#494d64",
	surface0 = "#363a4f",
	base = "#24273a",
	mantle = "#1e2030",
	crust = "#181926",
}

config.colors = {
	tab_bar = {
		background = colors.mantle,

		active_tab = {
			bg_color = colors.surface0,
			fg_color = colors.text,
			intensity = "Bold",
			underline = "None",
			italic = false,
			strikethrough = false,
		},

		inactive_tab = {
			bg_color = colors.base,
			fg_color = colors.subtext0,
		},

		inactive_tab_hover = {
			bg_color = colors.surface1,
			fg_color = colors.text,
			italic = true,
		},

		new_tab = {
			bg_color = colors.mantle,
			fg_color = colors.subtext1,
		},

		new_tab_hover = {
			bg_color = colors.surface1,
			fg_color = colors.text,
		},
	},
}

config.window_frame = {
	active_titlebar_bg = colors.mantle,
	inactive_titlebar_bg = colors.base,
	font_size = 12.0,
}

local resizeGap = 3

config.leader = { key = "w", mods = "ALT", timeout_milliseconds = 1000 }
config.keys = {
	{
		mods = "LEADER",
		key = "a",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	{
		mods = "LEADER",
		key = "d",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	{
		mods = "LEADER",
		key = "Space",
		action = act.PaneSelect({
			mode = "SwapWithActive",
		}),
	},

	{
		key = "h",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Left"),
	},

	{
		key = "l",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Right"),
	},

	{
		key = "k",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Up"),
	},

	{
		key = "j",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Down"),
	},

	{
		key = "LeftArrow",
		mods = "CTRL",
		action = act.AdjustPaneSize({ "Left", resizeGap }),
	},

	{
		key = "DownArrow",
		mods = "CTRL",
		action = act.AdjustPaneSize({ "Down", resizeGap }),
	},

	{
		key = "UpArrow",
		mods = "CTRL",
		action = act.AdjustPaneSize({ "Up", resizeGap }),
	},

	{
		key = "RightArrow",
		mods = "CTRL",
		action = act.AdjustPaneSize({ "Right", resizeGap }),
	},
}

config.enable_tab_bar = false

return config
