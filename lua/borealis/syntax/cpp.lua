local M = {}
local c = require('borealis.colors')
local colors = require('borealis.palette').colors

M.highlights = {
  cppStatement = { fg = c.purple, fmt = "bold" },
  cppTSInclude = colors.Blue,
  cppTSConstant = colors.Cyan,
  cppTSConstMacro = colors.Purple,
  cppTSOperator = colors.Purple,
}

return M
