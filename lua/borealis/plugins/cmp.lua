local M = {}
local c = require('borealis.colors')
local colors = require('borealis.palette').colors
local cfg = vim.g.borealis_config

M.highlights = {
  CmpItemAbbr = colors.Fg,
  CmpItemAbbrDeprecated = { fg = c.light_grey, fmt = "strikethrough" },
  CmpItemAbbrMatch = colors.Cyan,
  CmpItemAbbrMatchFuzzy = { fg = c.cyan, fmt = "underline" },
  CmpItemMenu = colors.LightGrey,
  CmpItemKind = { fg = c.purple, fmt = cfg.cmp_itemkind_reverse and "reverse" },
}

return M
