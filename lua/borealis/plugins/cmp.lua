local c = require('borealis.colors')
local cfg = vim.g.borealis_config
local colors = require("borealis.theme")

local M = {}

M.cmp = {
  CmpItemAbbr = colors.Fg,
  CmpItemAbbrDeprecated = { fg = c.light_grey, fmt = "strikethrough" },
  CmpItemAbbrMatch = colors.Cyan,
  CmpItemAbbrMatchFuzzy = { fg = c.cyan, fmt = "underline" },
  CmpItemMenu = colors.LightGrey,
  CmpItemKind = { fg = c.purple, fmt = cfg.cmp_itemkind_reverse and "reverse" },
}

return M
