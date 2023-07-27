local M = {}
local colors = {
    dark = {
        fg = "#abb2bf",                 -- # Main foreground (Light Slate Gray)
        fg1 = "#ebdbb2",                -- # Secondary foreground, variables
        bg0 = "#272727",                -- # Main background (Dark Gray)
        bg1 = "#262626",                -- # Menus and popups (Charcoal)
        bg2 = "#3b3f4c",                -- # Statusline background (Midnight Blue)
        bg3 = "#2b303b",                -- # nvim tree, terminal and telescope background (Dark Slate Gray)
        black = "#252525",
		blue = "#61afef",               -- # Functions and Titles
        cyan = "#5fafb9",               -- # Builtin functions, fields
        dark_blue = "#2C4F77",          -- # Search, Diff file, text, info, selections, tags
        dark_cyan = "#1b6a73",          -- # Builtin functions, fields
        dark_grey = "#5c6370",          -- # Comments
        dark_green = "#2B3D28",         -- # Git diff add background, substitutions
        dark_purple = "#854897",        -- # Special highlighting
        dark_red = "#E45876",           -- # Special, Gid diff delete background, errors, exceptions
		dark_yellow = "#FFA066",        -- # Constants, imports, booleans
        grey = "#5c6370",
		green = "#98c379",              -- # Strings, texts, diff changes
        light_grey = "#808b98",
        orange = "#FF8E3B",             -- # Warnings, diagnostic warnings
        purple = "#c678dd",             -- # Statements and Keywords
		red = "#e86671",                -- # Identifiers, LSP variables, Todos, Numbers
        yellow = "#ffc76d"              -- # Operators, RegEx, questions
    },
    light = {
        fg = "#545454",                 -- Main foreground
        fg1 = "#232323",                -- Secondary foreground, variables
        bg0 = "#dcdcdc",                -- Main background
        bg1 = "#ebebeb",                -- Menus and popups
        bg2 = "#c6c6c6",                -- Statusline background
        bg3 = "#d0d0d0",                -- nvim tree, terminal and telescope background
        black = "#d7d7d7",
        blue = "#9ebfff",
        cyan = "#a8fff0",
        dark_blue = "#879ebf",
        dark_cyan = "#a3a6b3",
        dark_grey = "#a3a6b3",
        dark_green = "#93b0a1",
        dark_purple = "#dcbfff",
        dark_red = "#e69db3",
        dark_yellow = "#ffd29e",
        grey = "#a3a6b3",
        green = "#b8daae",
        light_grey = "#b3bfc4",
        orange = "#ffbf8e",
        purple = "#dcbfff",
        red = "#f3a7a7",
        yellow = "#ffe4a1"
    },
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
