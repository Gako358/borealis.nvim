local M = {}
local c = require("borealis.colors").select_colors()

M.highlights = {
    NvimTreeNormal = {fg = c.fg, bg = c.bg3},
    NvimTreeVertSplit = {fg = c.bg1, bg = c.bg3},
    NvimTreeEndOfBuffer = {fg = c.bg1, bg = c.bg3},
    NvimTreeRootFolder = {fg = c.orange, fmt = "bold"},
    NvimTreeGitDirty = {fg = c.yellow},
    NvimTreeGitNew = {fg = c.green},
    NvimTreeGitDeleted = {fg = c.red},
    NvimTreeSpecialFile = {fg = c.yellow, fmt = "underline"},
    NvimTreeIndentMarker = {fg = c.fg},
    NvimTreeImageFile = {fg = c.dark_purple},
    NvimTreeSymlink = {fg = c.purple},
    NvimTreeFolderName = {fg = c.blue}
}

return M
