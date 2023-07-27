local M = {}
local c = require("borealis.colors").select_colors()

M.highlights = {
  LightspeedGreyWash = { fg = c.grey },
  LightspeedLabel = { fg = c.purple, fmt = "bold,underline" },
  LightspeedLabelDistant = { fg = c.green, fmt = "bold,underline" },
  LightspeedLabelDistantOverlapped = { fg = c.dark_green, fmt = "underline" },
  LightspeedLabelOverlapped = { fg = c.purple, fmt = "underline" },
  LightspeedMaskedChar = { fg = c.orange },
  LightspeedOneCharMatch = { bg = c.purple, fg = c.fg, fmt = "bold" },
  LightspeedPendingOpArea = { bg = c.purple, fg = c.fg },
  LightspeedShortcut = { bg = c.purple, fg = c.fg, fmt = "bold,underline" },
  LightspeedUnlabeledMatch = { fg = c.blue, fmt = "bold" },
  LightspeedUniqueChar = { fg = c.blue, fmt = "bold" },
}

return M
