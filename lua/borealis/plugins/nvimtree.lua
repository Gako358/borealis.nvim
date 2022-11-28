local M = {}
local c = require('borealis.colors')
local colors = require('borealis.palette').colors

M.highlights = {
  NvimTreeNormal = { fg = c.fg, bg = c.bg1 },
  NvimTreeVertSplit = { fg = c.bg1, bg = c.bg1 },
  NvimTreeEndOfBuffer = { fg = c.bg1, bg = c.bg1 },
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
