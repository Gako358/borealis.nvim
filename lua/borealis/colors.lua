local M = {}
local colors = {
    dark = {
        fg = "#abb2bf",                 -- # Main foreground (Light Slate Gray)
        fg1 = "#DCD6BA",                -- # Secondary foreground, variables
        bg0 = "#272727",                -- # Main background (Dark Gray)
        bg1 = "#262626",                -- # Menus and popups (Charcoal)
        bg2 = "#3b3f4c",                -- # Statusline background (Midnight Blue)
        bg3 = "#2b303b",                -- # nvim tree, terminal and telescope background (Dark Slate Gray)
        bright_blue = "#61a0ef",        -- # Info, selections, folders
        bright_green = "#6D946A",       -- # Changes in Diff
        bright_red = "#C24043",         -- # Deletions in diff
        bright_yellow = "#FFE66D",      -- # Types, structures
        brown = "#D27A89",              -- # Numbers
        black = "#252525",
		blue = "#61afef",               -- # Functions and Titles
        cyan = "#2aa198",               -- # Fields
        dark_blue = "#2C4F77",          -- # Search highlight
        dark_blue2 = "#252735",         -- # Diff file
        dark_blue3 = "#2c5372",         -- # Diff text
        dark_brown = "#49453C",         -- # Git diff changes background
        dark_brown2 = "#432C2B",        -- # Git diff delete background
        dark_grey = "#5c6370",          -- # Comments
        dark_green = "#2B3D28",         -- # Git diff add background
        dark_red = "#E45876",           -- # Special highlighting
		dark_yellow = "#FFA066",        -- # Constants, imports, booleans
        grey = "#5c6370",
		green = "#98c379",              -- # Strings, texts
        light_blue = "#7F94CA",         -- # Tags highlighting
        light_cyan = "#00e8c6",         -- # Builtin functions
        light_grey = "#808b98",
        light_green = "#86E072",        -- # Substitute highlighting
        light_red = "#E82424",          -- # Diagnostic errors
        light_red2 = "#FF4D62",         -- # Exceptions highlighting
        orange = "#FF8E3B",             -- # Warnings, diagnostic warnings
        purple = "#c678dd",             -- # Statements and Keywords
		red = "#e86671",                -- # Identifiers, LSP variables, Todos
        yellow = "#ffc76d"              -- # Operators, RegEx, questions
    },
    light = {
        fg = "#545454",                 -- Main foreground
        fg1 = "#232323",                -- Secondary foreground, variables
        bg0 = "#dcdcdc",                -- Main background
        bg1 = "#ebebeb",                -- Menus and popups
        bg2 = "#c6c6c6",                -- Statusline background
        bg3 = "#d0d0d0",                -- nvim tree, terminal and telescope background
        bright_blue = "#9ebfff",        -- Info, selections, folders
        bright_green = "#92b892",       -- Changes in Diff
        bright_red = "#db8f8f",         -- Deletions in diff
        bright_yellow = "#ffdda3",      -- Types, structures
        brown = "#dbb1b1",              -- Numbers
        black = "#d7d7d7",
        blue = "#9ebfff",               -- Functions and Titles
        cyan = "#9edcd7",               -- Fields
        dark_blue = "#879ebf",          -- Search highlight
        dark_blue2 = "#878d9b",         -- Diff file
        dark_blue3 = "#8795b0",         -- Diff text
        dark_brown = "#b8b5b0",         -- Git diff changes background
        dark_brown2 = "#b3a9a4",        -- Git diff delete background
        dark_grey = "#a3a6b3",          -- Comments
        dark_green = "#93b0a1",         -- Git diff add background
        dark_red = "#e69db3",           -- Special highlighting
        dark_yellow = "#ffd29e",        -- Constants, imports, booleans
        grey = "#a3a6b3",
        green = "#b8daae",              -- Strings, texts
        light_blue = "#aec6f3",         -- Tags highlighting
        light_cyan = "#a8fff0",         -- Builtin functions
        light_grey = "#b3bfc4",
        light_green = "#bdf3b8",        -- Substitute highlighting
        light_red = "#f68e8e",          -- Diagnostic errors
        light_red2 = "#ff9e9e",         -- Exceptions highlighting
        orange = "#ffbf8e",             -- Warnings, diagnostic warnings
        purple = "#dcbfff",             -- Statements and Keywords
        red = "#f3a7a7",                -- Identifiers, LSP variables, Todos
        yellow = "#ffe4a1"              -- Operators, RegEx, questions
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
