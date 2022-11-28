local M = {}
local colors = require('borealis.config').colors

M.highlights = {
  cInclude = colors.Blue,
  cStorageClass = colors.Purple,
  cTypedef = colors.Purple,
  cDefine = colors.Cyan,
  cTSInclude = colors.Blue,
  cTSConstant = colors.Cyan,
  cTSConstMacro = colors.Purple,
  cTSOperator = colors.Purple,
}

return M
