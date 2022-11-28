local M = {}
local colors = require('borealis.palette').colors

M.highlights = {
  luaTSField = colors.Cyan,
  luaTSMethod = colors.Blue,
  luaTSConstructor = colors.Blue,
  luaStatement = colors.Purple,
  luaTSInclude = colors.Blue,
  luaTSConstant = colors.Cyan,
  luaTSConstMacro = colors.Purple,
  luaTSOperator = colors.Purple,
}

return M
