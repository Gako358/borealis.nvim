local M = {}
local c = require("borealis.colors").select_colors()

M.highlights = {
    TelescopeBorder = {fg = c.red},
    TelescopePromptBorder = {fg = c.cyan},
    TelescopeResultsBorder = {fg = c.cyan},
    TelescopePreviewBorder = {fg = c.cyan},
    TelescopeMatching = {fg = c.orange, fmt = "bold"},
    TelescopePromptPrefix = {fg = c.green},
    TelescopeSelection = {bg = c.bg1},
    TelescopeSelectionCaret = {fg = c.yellow}
}

return M
