local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.audible_bell = 'Disabled'

config.color_scheme = 'tokyonight_storm'

config.font = wezterm.font('OperatorMono Nerd Font', { weight = 400 })
config.font_size = 20
config.font_rules = {
    {
        intensity = 'Bold',
        italic = true,
        font = wezterm.font('OperatorMono Nerd Font', { weight = 600, style = 'Italic' })
    },
    {
        intensity = 'Bold',
        italic = false,
        font = wezterm.font('OperatorMono Nerd Font', { weight = 600 })
    }
}

config.hide_tab_bar_if_only_one_tab = true

config.line_height = 1.25

config.window_background_opacity = 0.95
config.window_decorations = "RESIZE"
config.window_padding = {
    left = 8,
    right = 8,
    top = 8,
    bottom = 8,
}

-- OS Specific
config.macos_window_background_blur = 32


return config
