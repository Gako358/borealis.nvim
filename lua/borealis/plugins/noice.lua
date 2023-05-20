local M = {}
local c = require("borealis.colors").select_colors()

M.highlights = {
  NoiceCmdline = { fg = c.fg },
  NoiceCmdlineIconSearch = { fg = c.yellow },
  NoiceCmdlinePopupBorder = { fg = c.blue },
  NoiceCmdlinePopupBorderSearch = { fg = c.yellow },
  NoiceConfirmBorder = { fg = c.blue },
  NoiceMini = { fg = c.fg },
}

return M
