local M = {}
local c = require('borealis.colors')

M.highlights = {
  LightspeedGreyWash = { fg = c.grey },
  LightspeedLabel = { fg = c.purple, fmt = "bold" and "underline" },
  LightspeedLabelDistant = { fg = c.green, fmt = "bold" and "underline" },
  LightspeedLabelDistantOverlapped = { fg = c.dark_green, fmt = "underline" },
  LightspeedLabelOverlapped = { fg = c.dark_purple, fmt = "underline" },
  LightspeedMaskedChar = { fg = c.orange },
  LightspeedOneCharMatch = { bg = c.purple, fg = c.fg, fmt = "bold" },
  LightspeedPendingOpArea = { bg = c.purple, fg = c.fg },
  LightspeedShortcut = { bg = c.purple, fg = c.fg, fmt = "bold" and "underline" },
  LightspeedUnlabeledMatch = { fg = c.blue, fmt = "bold" },
  LightspeedUniqueChar = { fg = c.blue, fmt = "bold" },
}

return M
