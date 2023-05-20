local M = {}
local c = require("borealis.colors").select_colors()

M.highlights = {
  LspFloatWinNormal = { bg = c.bg2 },
  LspFloatWinBorder = { fg = c.fg },
  LspSagaBorderTitle = { fg = c.cyan },
  LspSagaHoverBorder = { fg = c.blue },
  LspSagaRenameBorder = { fg = c.green },
  LspSagaDefPreviewBorder = { fg = c.green },
  LspSagaCodeActionBorder = { fg = c.blue },
  LspSagaFinderSelection = { fg = c.bg2 },
  LspSagaCodeActionTitle = { fg = c.blue },
  LspSagaCodeActionContent = { fg = c.purple },
  LspSagaSignatureHelpBorder = { fg = c.red },
  ReferencesCount = { fg = c.purple },
  DefinitionCount = { fg = c.purple },
  DefinitionIcon = { fg = c.blue },
  ReferencesIcon = { fg = c.blue },
  TargetWord = { fg = c.cyan },
}

return M
