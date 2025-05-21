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
	config.default_prog = { "/bin/bash", "-l" }
elseif os:find("linux") then
	config.default_prog = { "/usr/bin/bash", "-l" }
end

config.default_cwd = "~/projects/" --FUNKTIONIERT NICHT
config.font = wezterm.font("JetBrains Mono", { weight = "ExtraBlack" })

-- Set colorscheme
config.color_scheme = "Tokyo Night (Gogh)"

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
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false
config.status_update_interval = 1000
wezterm.on("update-status", function(window, pane)
	local basename = function(s)
		return string.gsub(s, "(.*[/\\])(.*)", "%2")
	end

	-- Current working directory
	local cwd = pane:get_current_working_dir()
	if cwd then
		if type(cwd) == "userdata" then
			cwd = basename(cwd.file_path)
		else
			cwd = basename(cwd)
		end
	else
		cwd = ""
	end

	-- Current command
	local cmd = pane:get_foreground_process_name()
	cmd = cmd and basename(cmd) or ""

	-- Time
	local time = wezterm.strftime("%H:%M")

	-- Right status
	window:set_right_status(wezterm.format({
		{ Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
		{ Text = " | " },
		{ Foreground = { Color = "#e0af68" } },
		{ Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
		"ResetAttributes",
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.md_clock .. "  " .. time },
		{ Text = "  " },
	}))
end)

-- Return the configuration to wezterm
return config

