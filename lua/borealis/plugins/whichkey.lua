local M = {}
local c = require("borealis.colors").select_colors()

M.highlights = {
  WhichKey = { fg = c.red },
  WhichKeyDesc = { fg = c.blue },
  WhichKeyGroup = { fg = c.orange },
  WhichKeySeparator = { fg = c.green },
}

return M
