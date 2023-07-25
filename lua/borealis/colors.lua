local M = {}
local colors = {
    dark = {
        black = "#252525",
        bg0 = "#272727", -- # Main background
        bg1 = "#262626", -- # Menus and popups
        bg2 = "#3b3f4c", -- # Statusline background
        bg3 = "#2b303b", -- # nvim tree, terminal and telescope background
        fg = "#D5CED9", -- # Main foreground
        purple = "#c678dd",
        green = "#96E072",
        orange = "#f39c12",
        blue = "#61afef",
        yellow = "#FFE66D",
        cyan = "#00e8c6",
        red = "#ee5d43",
        grey = "#5c6370",
        light_grey = "#848b98",
        dark_cyan = "#2b6f77",
        dark_red = "#993939",
        dark_yellow = "#93691d",
        dark_purple = "#8a3fa0",
        dark_green = "#7cb75f",
        diff_add = "#31392b",
        diff_delete = "#382b2c",
        diff_change = "#1c3448",
        diff_text = "#2c5372",
        strings = "#98BB6C",
        comments = "#5c6370"
    },
    light = {
        black = "#101012",
        bg0 = "#fafafa",
        bg1 = "#f0f0f0",
        bg2 = "#e0e0e0",
        bg3 = "#d0d0d0",
        fg = "#383a42",
        purple = "#a626a4",
        green = "#50a14f",
        orange = "#c18401",
        blue = "#4078f2",
        yellow = "#986801",
        cyan = "#0184bc",
        red = "#e45649",
        grey = "#a0a1a7",
        light_grey = "#818387",
        dark_cyan = "#2b5d63",
        dark_red = "#833b3b",
        dark_yellow = "#7c5c20",
        dark_purple = "#79428a",
        dark_green = "#4a6c3a",
        diff_add = "#e2fbe4",
        diff_delete = "#fce2e5",
        diff_change = "#e2ecfb",
        diff_text = "#cad3e0",
        strings = "#a0a1a7",
        comments = "#a0a1a7"
    }
}

function M.terminal_color()
    vim.g.terminal_color_0 = M.select_colors().bg0
    vim.g.terminal_color_1 = M.select_colors().red
    vim.g.terminal_color_2 = M.select_colors().green
    vim.g.terminal_color_3 = M.select_colors().yellow
    vim.g.terminal_color_4 = M.select_colors().blue
    vim.g.terminal_color_5 = M.select_colors().purple
    vim.g.terminal_color_6 = M.select_colors().cyan
    vim.g.terminal_color_7 = M.select_colors().fg
    vim.g.terminal_color_8 = M.select_colors().grey
    vim.g.terminal_color_9 = M.select_colors().red
    vim.g.terminal_color_10 = M.select_colors().green
    vim.g.terminal_color_11 = M.select_colors().yellow
    vim.g.terminal_color_12 = M.select_colors().blue
    vim.g.terminal_color_13 = M.select_colors().purple
    vim.g.terminal_color_14 = M.select_colors().cyan
    vim.g.terminal_color_15 = M.select_colors().fg
end

function M.select_colors()
    local selected = {none = "none"}
    selected = vim.tbl_extend("force", selected,
                              colors[vim.g.borealis_config.style])
    return selected
end

return M
