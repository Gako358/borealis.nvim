local M = {}
local c = require("borealis.colors").select_colors()

M.highlights = {
  IndentBlankLineIndent1 = { fg = c.blue },
  IndentBlankLineIndent2 = { fg = c.green },
  IndentBlankLineIndent3 = { fg = c.yellow },
  IndentBlankLineIndent4 = { fg = c.purple },
  IndentBlankLineIndent5 = { fg = c.red },
  IndentBlankLineIndent6 = { fg = c.cyan },
  IndentBlankLineContext = { fg = c.orange, bg = c.bg3, fmt = "bold" },
}

return M
