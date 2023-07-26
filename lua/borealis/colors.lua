local M = {}
local colors = {
    dark = {
        fg = "#abb2bf",                   -- # Main foreground (Light Slate Gray)
        bg0 = "#272727",                  -- # Main background (Dark Gray)
        bg1 = "#262626",                  -- # Menus and popups (Charcoal)
        bg2 = "#3b3f4c",                  -- # Statusline background (Midnight Blue)
        bg3 = "#2b303b",                  -- # nvim tree, terminal and telescope background (Dark Slate Gray)
        -- Standard colors
        black = "#252525",
		blue = "#61afef",
		cyan = "#56b6c2",
        grey = "#5c6370",
		green = "#98c379",
        light_grey = "#808b98",
		orange = "#d19a66",
        purple = "#c678dd",
		red = "#e86671",
		yellow = "#e5c07b",
        -- LSP Treesitter
        builtin = "#7FB4CA",              -- # Builtin functions (Light Steel Blue)
        comments = "#5c6370",             -- # Comments (Slate Gray)
        constants = "#FFA066",            -- # Constants, imports, booleans (Salmon)
        diagnostic_error = "#E82424",     -- # Diagnostic errors (Red)
        diagnostic_hint = "#638594",      -- # Hints or suggestions (Cadet Blue)
        diagnostic_info = "#5A9589",      -- # Information (Sea Green)
        diagnostic_warn = "#FF8E3B",      -- # Warnings (Orange)
        diff_add = "#6D946A",             -- # Additions in diff (Medium Sea Green)
        diff_add_bg = "#2B3D28",          -- # Additions in diff background (Dark Green)
        diff_change = "#DAA561",          -- # Changes in diff (Sandy Brown)
        diff_change_bg = "#49453C",       -- # Changes in diff background (Dark Olive Green)
        diff_delete = "#C24043",          -- # Deletions in diff (Indian Red)
        diff_delete_bg = "#432C2B",       -- # Deletions in diff background (Dark Brown)
        diff_file = "#252735",            -- # Diff file (Very Dark Blue)
        diff_line = "#252635",            -- # Diff line (Very Dark Violet)
        diff_text = "#2c5372",            -- # Diff text (Dark Slate Blue)
        exceptions = "#FF4D62",           -- # Exceptions highlighting (Coral)
        fields = "#2aa198",               -- # Fields (Cyan)
        functions = "#7E8CD8",            -- # Functions and Titles (Light Blue)
        identifier = "#E5B284",           -- # Variables (Gold-ish)
        info = "#61a0ef",                 -- # Info like Directories in nvim tree (Sky Blue)
        number = "#D27A89",               -- # Numbers (Rosy Brown)
        operators = "#FFC76D",            -- # Operators, RegEx (Light Gold)
        questions = "#FFD88D",            -- # Questions highlighting (Pale Gold)
        search = "#2C4F77",               -- # Search highlight (Dark Blue)
        selections = "#4387CF",           -- # Alternate blue for contrast (Steel Blue)
        signals = "#D22C27",              -- # Alternate red for contrast (Firebrick)
        special = "#E45876",              -- # Special highlighting (Indian Red)
        statements = "#9577BB",           -- # Statements and Keywords (Medium Purple)
        strings = "#98AB6C",              -- # Strings (Olive Green)
        structures = "#7A8F9F",           -- # Structure highlighting (Cadet Blue)
        substitute = "#86E072",           -- # Substitute highlighting (Yellow Green)
        tags = "#7F94CA",                 -- # Tags highlighting (Steel Blue)
        text = "#98c379",                 -- # Text highlighting (Green)
        todo = "#e86671",                 -- # Todo highlighting (Red)
        types = "#7A8B9F",                -- # Types (Cadet Blue)
        variables = "#DCD6BA"             -- # Variables (Beige)
    },
    light = {
        fg = "#383a42",                   -- # Main foreground (Black)
        bg0 = "#fafafa",                  -- # Main background (White)
        bg1 = "#f0f0f0",                  -- # Menus and popups (Light Gray)
        bg2 = "#e0e0e0",                  -- # Statusline background (Silver)
        bg3 = "#d0d0d0",                  -- # nvim tree, terminal and telescope background (Gainsboro)
        -- Standard colors
        black = "#101012",
        blue = "#3e67c7",
        cyan = "#239999",
        grey = "#a0a1a7",
        green = "#67c763",
        light_grey = "#c0c0c0",
        orange = "#d19965",
        purple = "#9967c7",
        red = "#c76767",
        yellow = "#c7c767",
        -- LSP Treesitter
        builtin = "#3967c7",              -- # Builtin functions (Dark Blue)
        comments = "#7f8c8d",             -- # Comments (Gray)
        constants = "#ff9247",            -- # Constants, imports, booleans (Dark Orange)
        diagnostic_error = "#E82424",     -- # Diagnostic errors (Red)
        diagnostic_hint = "#6d8c94",      -- # Hints or suggestions (Dark Cyan)
        diagnostic_info = "#468595",      -- # Information (Dark Blue)
        diagnostic_warn = "#FF9E3B",      -- # Warnings (Orange)
        diff_add = "#7d946a",             -- # Additions in diff (Olive Green)
        diff_add_bg = "#d6edd8",          -- # Additions in diff background (Light Green)
        diff_change = "#bfa561",          -- # Changes in diff (Khaki)
        diff_change_bg = "#e5e2c6",       -- # Changes in diff background (Light Khaki)
        diff_delete = "#d94743",          -- # Deletions in diff (Dark Red)
        diff_delete_bg = "#f2d6d6",       -- # Deletions in diff background (Light Red)
        diff_file = "#252735",            -- # Diff file (Dark Violet)
        diff_line = "#252635",            -- # Diff line (Very Dark Blue)
        diff_text = "#2c5372",            -- # Diff text (Dark Blue)
        exceptions = "#FF4D62",           -- # Exceptions highlighting (Red)
        fields = "#2a9999",               -- # Fields (Dark Cyan)
        functions = "#677e9c",            -- # Functions and Titles (Dark Blue)
        identifier = "#c78447",           -- # Variables (Dark Orange)
        info = "#5f67c7",                 -- # Info like Directories in nvim tree (Dark Blue)
        number = "#9c678e",               -- # Numbers (Dark Purple)
        operators = "#c7a447",            -- # Operators, RegEx (Dark Yellow)
        questions = "#c7a747",            -- # Questions highlighting (Dark Yellow)
        search = "#2D4F67",               -- # Search highlight (Dark Blue)
        selections = "#7f8f9f",           -- # Alternate blue for contrast (Dark Gray)
        signals = "#d22c27",              -- # Alternate red for contrast (Firebrick)
        special = "#c74767",              -- # Special highlighting (Dark Red)
        statements = "#7f6c9c",           -- # Statements and Keywords (Dark Purple)
        strings = "#6c8c67",              -- # Strings (Dark Green)
        structures = "#6f8b8f",           -- # Structure highlighting (Dark Cyan)
        substitute = "#72e086",           -- # Substitute highlighting (Medium Green)
        tags = "#6f7fca",                 -- # Tags highlighting (Dark Blue)
        text = "#678c67",                 -- # Text highlighting (Dark Green)
        todo = "#c76767",                 -- # Todo highlighting (Red)
        types = "#6f7f8f",                -- # Types (Dark Cyan)
        variables = "#bab6ad"             -- # Variables (Beige)
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
