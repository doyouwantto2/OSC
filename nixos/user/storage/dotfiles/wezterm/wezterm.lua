local wezterm = require("wezterm")
local config = {}
local act = wezterm.action

local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config)

config.color_scheme = "rebecca"
config.window_background_opacity = 0.8
config.warn_about_missing_glyphs = false
config.enable_wayland = true

config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false

config.hyperlink_rules = wezterm.default_hyperlink_rules()

table.insert(config.hyperlink_rules, {
	regex = [[\b[tt](\d+)\b]],
	format = "https://example.com/tasks/?t=$1",
})
table.insert(config.hyperlink_rules, {
	regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
	format = "https://www.github.com/$1/$3",
})

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

	split = "#FFFFFF",
}

config.window_frame = {
	active_titlebar_bg = colors.mantle,
	inactive_titlebar_bg = colors.base,
	font_size = 12.0,
}

config.font_size = 10
config.font = wezterm.font("JetBrains Mono", { weight = "Regular", italic = false })

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
		mods = "LEADER",
		key = "t",
		action = act.SpawnTab("CurrentPaneDomain"),
	},

	{
		key = "[",
		mods = "LEADER",
		action = act.ActivateTabRelative(-1),
	},

	{
		key = "]",
		mods = "LEADER",
		action = act.ActivateTabRelative(1),
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

config.enable_tab_bar = true

config.default_prog = { "fish" }

return config
