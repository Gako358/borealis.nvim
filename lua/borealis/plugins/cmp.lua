local M = {}
local c = require("borealis.colors").select_colors()

M.highlights = {
  CmpItemAbbr = { fg = c.fg },
  CmpItemAbbrDeprecated = { fg = c.light_grey, fmt = "strikethrough" },
  CmpItemAbbrMatch = { fg = c.cyan, fmt = "bold" },
  CmpItemAbbrMatchFuzzy = { fg = c.cyan, fmt = "underline" },
  CmpItemMenu = { fg = c.light_grey },
  CmpItemKind = { fg = c.purple },
}

return M
