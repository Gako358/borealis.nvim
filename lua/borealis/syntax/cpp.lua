local M = {}
local c = require("borealis.colors").select_colors()

M.highlights = {
  cppStatement = { fg = c.purple, fmt = "bold" },
  cppTSInclude = { fg = c.blue },
  cppTSConstant = { fg = c.cyan },
  cppTSConstMacro = { fg = c.purple },
  cppTSOperator = { fg = c.purple },
}

return M
