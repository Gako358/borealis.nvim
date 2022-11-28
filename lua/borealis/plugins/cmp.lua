local M = {}
local c = require('borealis.colors').select_colors()
local colors = require('borealis.colors').colors
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
