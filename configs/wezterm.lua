local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Spawn a fish shell in login mode
config.default_prog = { 'fish', '-l' }
-- Slightly transparent and blurred background
config.window_background_opacity = 0.9
config.macos_window_background_blur = 30
-- Removes the title bar, leaving only the tab bar. Keeps
-- the ability to resize by dragging the window's edges.
-- On macOS, 'RESIZE|INTEGRATED_BUTTONS' also looks nice if
-- you want to keep the window controls visible and integrate
-- them into the tab bar.
config.window_decorations = 'RESIZE|INTEGRATED_BUTTONS'
-- Sets the font for the window frame (tab bar)
config.window_frame = {
    font = wezterm.font {
        family = "Iosevka Term",
        weight = "Bold"
    },
}
config.color_scheme = "Selenized Dark"
config.font = wezterm.font_with_fallback {
    -- "Berkeley Mono",
    "Iosevka Term",
    "Fira Code"
}
config.font_size = 12.0
config.line_height = 0.9
config.cell_width = 0.9
config.check_for_updates = true
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}
config.enable_tab_bar = true

config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- make username/project paths clickable. this implies paths like the following are for github.
-- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
-- as long as a full url hyperlink regex exists above this it should not match a full url to
-- github or gitlab / bitbucket (i.e. https://gitlab.com/user/project.git is still a whole clickable url)
table.insert(config.hyperlink_rules, {
  regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
  format = 'https://www.github.com/$1/$3',
})

return config
