local M = {}
local c = require("borealis.colors").select_colors()

M.highlights = {
  luaTSField = { fg = c.cyan },
  luaTSMethod = { fg = c.blue },
  luaTSConstructor = { fg = c.blue },
  luaStatement = { fg = c.purple, fmt = "bold" },
  luaTSInclude = { fg = c.blue },
  luaTSConstant = { fg = c.cyan },
  luaTSConstMacro = { fg = c.purple },
  luaTSOperator = { fg = c.purple },
}

return M
