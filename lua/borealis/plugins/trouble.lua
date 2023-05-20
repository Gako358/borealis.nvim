local M = {}
local c = require("borealis.colors").select_colors()

M.highlights = {
  TroubleText = { fg = c.green },
  TroubleCount = { fg = c.purple, bg = c.bg2 },
  TroubleNormal = { fg = c.fg, bg = c.bg2 },
}

return M
