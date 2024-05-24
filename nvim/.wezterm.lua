local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.audible_bell = 'Disabled'

config.color_scheme = 'tokyonight_storm'

config.font = wezterm.font('OperatorMono Nerd Font', { weight = 400 })
config.font_size = 19
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

config.line_height = 1.25

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
}

return config
