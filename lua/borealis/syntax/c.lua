local M = {}
local c = require("borealis.colors").select_colors()

M.highlights = {
  cInclude = { fg = c.blue },
  cStorageClass = { fg = c.purple },
  cTypedef = { fg = c.purple },
  cDefine = { fg = c.cyan },
  cTSInclude = { fg = c.blue },
  cTSConstant = { fg = c.cyan },
  cTSConstMacro = { fg = c.purple },
  cTSOperator = { fg = c.purple },
}

return M
