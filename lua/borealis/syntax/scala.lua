local M = {}
local c = require("borealis.colors").select_colors()

M.highlights = {
  scalaNameDefinition = { fg = c.fg },
  scalaInterpolationBoundary = { fg = c.purple },
  scalaInterpolation = { fg = c.purple },
  scalaTypeOperator = { fg = c.red },
  scalaOperator = { fg = c.red },
  scalaKeywordModifier = {fg = c.red, fmt = "bold"},
}

return M
