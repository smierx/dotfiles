-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- Betriebssystem erkennen
local os = wezterm.target_triple

if os:find("windows") then
	config.default_prog = { "powershell.exe", "-NoLogo" }
elseif os:find("apple") then
	config.default_prog = { "/bin/zsh", "-l" }
elseif os:find("linux") then
	config.default_prog = { "/usr/bin/bash", "-l" }
end

config.default_cwd = "~/projects/" --FUNKTIONIERT NICHT
config.font = wezterm.font("GohuFont uni14 Nerd Font Mono", { weight = "Regular" })

-- Set colorscheme
--config.color_scheme = "Horizon Dark (Gogh)"

config.colors = {
	foreground = "#C0C0C0",
	background = "#121212",

	cursor_bg = "#00FF5F", -- kräftiges Grün
	cursor_border = "#00FF5F",
	cursor_fg = "#002B1E",

	selection_bg = "#333333",
	selection_fg = "#FFFFFF",

	ansi = {
		"#1A1A1A",
		"#2A2A2A",
		"#3A3A3A",
		"#4A4A4A",
		"#5A5A5A",
		"#6A6A6A",
		"#7A7A7A",
		"#8A8A8A",
	},
	brights = {
		"#2A2A2A",
		"#3A3A3A",
		"#4A4A4A",
		"#5A5A5A",
		"#6A6A6A",
		"#7A7A7A",
		"#8A8A8A",
		"#FFFFFF",
	},

	tab_bar = {
		background = "#121212",
		active_tab = {
			bg_color = "#1A1A1A",
			fg_color = "#FFFFFF",
		},
		inactive_tab = {
			bg_color = "#002B1E",
			fg_color = "#777777",
		},
		new_tab = {
			bg_color = "#002B1E",
			fg_color = "#444444",
		},
	},
}
-- Font settings
config.font_size = 16

-- Window setting/ appearance
config.window_decorations = "RESIZE"
config.enable_tab_bar = true
-- config.window_background_opacity = 0.85
-- config.macos_window_background_blur = 10

-- config.window_frame = {
-- 	font = wezterm.font({ family = "0xProto Nerd Font" }),
-- 	font_size = 20,
-- }

config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "0.0cell",
	bottom = "0.5cell",
}

config.initial_rows = 42
config.initial_cols = 124

config.enable_scroll_bar = true
config.scrollback_lines = 5000
config.default_workspace = "main"

-- Dim inactive panes
config.inactive_pane_hsb = {
	saturation = 0.24,
	brightness = 0.5,
}
local wezterm = require("wezterm")
local act = wezterm.action

config.keys = {
	-- paste from the clipboard
	{ key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
}
-- Tab bar
-- config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.status_update_interval = 1000

-- Return the configuration to wezterm
return config
