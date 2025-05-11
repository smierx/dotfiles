-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.default_prog = {"powershell.exe","-NoLogo"}
config.default_cwd = "~/projects/"--FUNKTIONIERT NICHT
config.font = wezterm.font 'JetBrains Mono'


config.window_frame = {
    -- The font used in the tab bar.
    -- Roboto Bold is the default; this font is bundled
    -- with wezterm.
    -- Whatever font is selected here, it will have the
    -- main font setting appended to it to pick up any
    -- fallback fonts you may have used there.
    font = wezterm.font { family = 'Roboto', weight = 'Bold' },
  
    -- The size of the font in the tab bar.
    -- Default to 10.0 on Windows but 12.0 on other systems
    font_size = 11.0,
  
    -- The overall background color of the tab bar when
    -- the window is focused
    active_titlebar_bg = '#333333',
  
    -- The overall background color of the tab bar when
    -- the window is not focused
    inactive_titlebar_bg = '#333333',
  }
  
  config.colors = {
    tab_bar = {
      -- The color of the inactive tab bar edge/divider
      inactive_tab_edge = '#575757',
    },
  }

  config.colors = {
    tab_bar = {
      -- The color of the strip that goes along the top of the window
      -- (does not apply when fancy tab bar is in use)
      background = '#0b0022',
  
      -- The active tab is the one that has focus in the window
      active_tab = {
        -- The color of the background area for the tab
        bg_color = '#2b2042',
        -- The color of the text for the tab
        fg_color = '#c0c0c0',
  
        -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
        -- label shown for this tab.
        -- The default is "Normal"
        intensity = 'Normal',
  
        -- Specify whether you want "None", "Single" or "Double" underline for
        -- label shown for this tab.
        -- The default is "None"
        underline = 'None',
  
        -- Specify whether you want the text to be italic (true) or not (false)
        -- for this tab.  The default is false.
        italic = false,
  
        -- Specify whether you want the text to be rendered with strikethrough (true)
        -- or not for this tab.  The default is false.
        strikethrough = false,
      },
  
      -- Inactive tabs are the tabs that do not have focus
      inactive_tab = {
        bg_color = '#1b1032',
        fg_color = '#808080',
  
        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `inactive_tab`.
      },
  
      -- You can configure some alternate styling when the mouse pointer
      -- moves over inactive tabs
      inactive_tab_hover = {
        bg_color = '#3b3052',
        fg_color = '#909090',
        italic = true,
  
        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `inactive_tab_hover`.
      },
  
      -- The new tab button that let you create new tabs
      new_tab = {
        bg_color = '#1b1032',
        fg_color = '#808080',
  
        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `new_tab`.
      },
  
      -- You can configure some alternate styling when the mouse pointer
      -- moves over the new tab button
      new_tab_hover = {
        bg_color = '#3b3052',
        fg_color = '#909090',
        italic = true,
  
        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `new_tab_hover`.
      },
    },
  }

  config.inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.8,
  }
-- For example, changing the color scheme:
config.color_scheme = 'Batman'
--config.window_background_image = 'C:/Users/miche/WEZBGIMG.png'--TODO FORMAT KOMISCH
config.window_background_image_hsb = {
    -- Darken the background image by reducing it to 1/3rd
    brightness = 0.3,
  
    -- You can adjust the hue by scaling its value.
    -- a multiplier of 1.0 leaves the value unchanged.
    hue = 1.0,
  
    -- You can adjust the saturation also.
    saturation = 1.0,
  }
  -- and finally, return the configuration to wezterm

  config.launch_menu = {
    {
        label = 'PowerShell',
        args = { 'powershell.exe', '-NoLogo' },
    },
    {
      -- TODO: Ich will hier alle Alpine Linux WSLs in einem Ordner finden und auflisten.
      -- Optional label to show in the launcher. If omitted, a label
      -- is derived from the `args`
      label = 'Bash',
      -- The argument array to spawn.  If omitted the default program
      -- will be used as described in the documentation above
      args = { 'bash', '-l' },
  
      -- You can specify an alternative current working directory;
      -- if you don't specify one then a default based on the OSC 7
      -- escape sequence will be used (see the Shell Integration
      -- docs), falling back to the home directory.
      -- cwd = "/some/path"
  
      -- You can override environment variables just for this command
      -- by setting this here.  It has the same semantics as the main
      -- set_environment_variables configuration option described above
      -- set_environment_variables = { FOO = "bar" },
    },
  }


  return config
