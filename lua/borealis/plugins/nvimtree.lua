local M = {}
local cfg = vim.g.borealis_config
local c = require('borealis.colors').select_colors()
local colors = require('borealis.colors').colors

M.highlights = {
  NvimTreeNormal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg1 },
  NvimTreeVertSplit = { fg = c.bg1, bg = cfg.transparent and c.none or c.bg1 },
  NvimTreeEndOfBuffer = { fg = cfg.ending_tildes and c.bg2 or c.bg1, bg = cfg.transparent and c.none or c.bg1 },
  NvimTreeRootFolder = { fg = c.orange, fmt = "bold" },
  NvimTreeGitDirty = colors.Yellow,
  NvimTreeGitNew = colors.Green,
  NvimTreeGitDeleted = colors.Red,
  NvimTreeSpecialFile = { fg = c.yellow, fmt = "underline" },
  NvimTreeIndentMarker = colors.Fg,
  NvimTreeImageFile = { fg = c.dark_purple },
  NvimTreeSymlink = colors.Purple,
  NvimTreeFolderName = colors.Blue,
}

return M