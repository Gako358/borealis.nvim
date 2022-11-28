local M = {}
local c = require('borealis.colors')
local colors = require('borealis.config').colors


M.highlights = {
  IndentBlankLineIndent1 = colors.Blue,
  IndentBlankLineIndent2 = colors.Green,
  IndentBlankLineIndent3 = colors.Yellow,
  IndentBlankLineIndent4 = colors.Purple,
  IndentBlankLineIndent5 = colors.Red,
  IndentBlankLineIndent6 = colors.Cyan,
  IndentBlankLineContext = { fg = c.orange, bg = c.bg3, fmt = "bold" },
}

return M
