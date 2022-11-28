local M = {}
local c = require('borealis.colors')

M.highlights = {
  -- Selected
  BufferLineIndicatorSelected = { fg = c.blue, bg = c.bg0 },
  BufferLineBufferSelected = { fg = c.fg, bg = c.bg0, fmt = "bold,italic" },
  BufferLineNumbersSelected = { fg = c.fg, bg = c.bg0, fmt = "bold" },
  BufferLineCloseButtonSelected = { fg = c.fg, bg = c.bg0 },
  BufferLineDiagnosticSelected = { fg = c.purple, bg = c.bg0, fmt = "bold" },
  BufferLineHintSelected = { fg = c.fg, bg = c.bg0 },
  BufferlineHintDiagnosticSelected = { fg = c.blue, bg = c.bg0 },
  BufferLineInfoSelected = { fg = c.fg, bg = c.bg0 },
  BufferLineInfoDiagnosticSelected = { fg = c.green, bg = c.bg0 },
  BufferlineWarningSelected = { fg = c.fg, bg = c.bg0 },
  BufferLineWarningDiagnosticSelected = { fg = c.yellow, bg = c.bg0, fmt = "bold" },
  BufferLineErrorSelected = { fg = c.fg, bg = c.bg0 },
  BufferLineErrorDiagnosticSelected = { fg = c.dark_red, bg = c.bg0, fmt = "bold" },
  BufferLineModifiedSelected = { fg = c.green, bg = c.bg0 },
  BufferLineDuplicateSelected = { fg = c.fg, bg = c.bg0 },
  BufferLineSeparatorSelected = { fg = c.grey, bg = c.bg0 },
  -- Visible
  BufferLineBufferVisible = { fg = c.grey, bg = c.bg0 },
  BufferLineNumbersVisible = { fg = c.grey, bg = c.bg0 },
  BufferLineCloseButtonVisible = { fg = c.grey, bg = c.bg0 },
  BufferLineDiagnosticVisible = { fg = c.grey, bg = c.bg0 },
  BufferLineHintVisible = { fg = c.grey, bg = c.bg0 },
  BufferlineHintDiagnosticVisible = { fg = c.blue, bg = c.bg0 },
  BufferLineInfoVisible = { fg = c.grey, bg = c.bg0 },
  BufferLineInfoDiagnosticVisible = { fg = c.green, bg = c.bg0 },
  BufferlineWarningVisible = { fg = c.grey, bg = c.bg0 },
  BufferLineWarningDiagnosticVisible = { fg = c.orange, bg = c.bg0 },
  BufferLineErrorVisible = { fg = c.grey, bg = c.bg0 },
  BufferLineErrorDiagnosticVisible = { fg = c.dark_red, bg = c.bg0 },
  BufferLineModifiedVisible = { fg = c.green, bg = c.bg0 },
  BufferLineDuplicateVisible = { fg = c.grey, bg = c.bg0 },
  BufferLineSeparatorVisible = { fg = c.grey, bg = c.bg0 },
  -- Fill / inactive
  BufferLineBackground = { fg = c.grey, bg = c.bg0 },
  BufferLineNumbers = { fg = c.grey, bg = c.bg0 },
  BufferLineCloseButton = { fg = c.grey, bg = c.bg0 },
  BufferLineDiagnostic = { fg = c.grey, bg = c.bg0 },
  BufferLineHint = { fg = c.grey, bg = c.bg0 },
  BufferlineHintDiagnostic = { fg = c.grey, bg = c.bg0 },
  BufferLineInfo = { fg = c.grey, bg = c.bg0 },
  BufferLineInfoDiagnostic = { fg = c.grey, bg = c.bg0 },
  BufferlineWarning = { fg = c.grey, bg = c.bg0 },
  BufferLineWarningDiagnostic = { fg = c.orange, bg = c.bg0 },
  BufferLineError = { fg = c.grey, bg = c.bg0 },
  BufferLineErrorDiagnostic = { fg = c.dark_red, bg = c.bg0 },
  BufferLineModified = { fg = c.green, bg = c.bg0 },
  BufferLineDuplicate = { fg = c.grey, bg = c.bg0 },
  BufferLineSeparator = { fg = c.grey, bg = c.bg0 },
  BufferLineFill = { fg = c.bg1, bg = c.bg1 },
}

return M
