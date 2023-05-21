local M = {}
local c = require("borealis.colors").select_colors()

M.highlights = {
    TroubleText = {fg = c.fg2},
    TroubleCount = {fg = c.purple, bg = c.bg1},
    TroubleNormal = {fg = c.fg, bg = c.bg1}
}

return M
