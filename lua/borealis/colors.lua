local M = {}
local colors = {
    dark = {
        fg = "#abb2bf", -- # Main foreground (Light Slate Gray)
        fg1 = "#ebdbb2", -- # Secondary foreground, variables
        bg0 = "#272727", -- # Main background (Dark Gray)
        bg1 = "#262626", -- # Menus and popups (Charcoal)
        bg2 = "#3b3f4c", -- # Statusline background (Midnight Blue)
        bg3 = "#2b303b", -- # nvim tree, terminal and telescope background (Dark Slate Gray)
        black = "#252525",
        blue = "#61afef", -- # Functions and Titles
        cyan = "#5fafb9", -- # Builtin functions, fields
        dark_blue = "#2C4F77", -- # Search, Diff file, text, info, selections, tags
        dark_cyan = "#1b6a73", -- # Builtin functions, fields
        dark_grey = "#5c6370", -- # Comments
        dark_green = "#2B3D28", -- # Git diff add background, substitutions
        dark_purple = "#854897", -- # Special highlighting
        dark_red = "#E45876", -- # Special, Gid diff delete background, errors, exceptions
        dark_yellow = "#FFA066", -- # Constants, imports, booleans
        grey = "#5c6370",
        green = "#96E072", -- # Strings, texts, diff changes
        light_grey = "#808b98",
        orange = "#FF8E3B", -- # Warnings, diagnostic warnings
        purple = "#c74ded", -- # Statements and Keywords
        red = "#e86671", -- # Identifiers, LSP variables, Todos, Numbers
        yellow = "#FFE66D" -- # Operators, RegEx, questions
    },
    light = {
        fg = "#383a42", -- Main foreground
        fg1 = "#383a42", -- Secondary foreground, variables
        bg0 = "#fafafa", -- Main background
        bg1 = "#f0f0f0", -- Menus and popups
        bg2 = "#e6e6e6", -- Statusline background
        bg3 = "#dcdcdc", -- nvim tree, terminal and telescope background
        black = "#101012",
        blue = "#4078f2",
        cyan = "#0184bc",
        dark_blue = "#879ebf",
        dark_cyan = "#2b5d63",
        dark_grey = "#5c6370",
        dark_green = "#93b0a1",
        dark_purple = "#79428a",
        dark_red = "#833b3b",
        dark_yellow = "#7c5c20",
        grey = "#a0a1a7",
        green = "#50a14f",
        light_grey = "#818387",
        orange = "#c18401",
        purple = "#a626a4",
        red = "#e45649",
        yellow = "#986801"
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
