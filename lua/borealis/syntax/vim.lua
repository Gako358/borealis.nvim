local M = {}
local c = require("borealis.colors").select_colors()

M.highlights = {
  vimOption = { fg = c.red },
  vimSetEqual = { fg = c.yellow },
  vimMap = { fg = c.purple },
  vimMapModKey = { fg = c.orange },
  vimNotation = { fg = c.red },
  vimMapLhs = { fg = c.fg },
  vimMapRhs = { fg = c.blue },
  vimVar = { fg = c.fg },
  vimCommentTitle = { fg = c.light_grey, fmt = "italic" },
}

return M
