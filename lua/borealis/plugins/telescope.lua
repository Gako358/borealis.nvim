local c = require('borealis.colors')
local colors = require("borealis.theme")

local M = {}

M.telescope = {
  TelescopeBorder = colors.Red,
  TelescopePromptBorder = colors.Cyan,
  TelescopeResultsBorder = colors.Cyan,
  TelescopePreviewBorder = colors.Cyan,
  TelescopeMatching = { fg = c.orange, fmt = "bold" },
  TelescopePromptPrefix = colors.Green,
  TelescopeSelection = { bg = c.bg2 },
  TelescopeSelectionCaret = colors.Yellow
}

return M
