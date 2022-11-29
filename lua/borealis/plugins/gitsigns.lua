local M = {}
local c = require("borealis.colors").select_colors()

M.highlights = {
  GitSignsAdd = { fg = c.green },
  GitSignsAddLn = { fg = c.green },
  GitSignsAddNr = { fg = c.green },
  GitSignsChange = { fg = c.yellow },
  GitSignsChangeLn = { fg = c.yellow },
  GitSignsChangeNr = { fg = c.yellow },
  GitSignsDelete = { fg = c.red },
  GitSignsDeleteLn = { fg = c.red },
  GitSignsDeleteNr = { fg = c.red },
}

return M
