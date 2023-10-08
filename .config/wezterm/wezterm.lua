local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

-- font
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 15

-- window
config.window_background_opacity = 0.85
local mux = wezterm.mux
wezterm.on("gui-startup", function()
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():toggle_fullscreen()
end)

-- tab bar
config.hide_tab_bar_if_only_one_tab = true

-- key assignments
config.leader = {
    key = "k",
    mods = "CTRL",
    timeout_milliseconds = 1000,
}
config.keys = {
    {
        key = "f",
        mods = "LEADER",
        action = act.ToggleFullScreen,
    },
    {
        key = "c",
        mods = "LEADER",
        action = act.ActivateCopyMode,
    },
    {
        key = "Backspace",
        mods = "CTRL",
        action = act.SendKey {
            key = "w",
            mods = "CTRL",
        }
    },
    {
        key = ' ',
        mods = "LEADER",
        action = act.QuickSelect,
    }
}

return config
