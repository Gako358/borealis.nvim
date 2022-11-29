local M = {}
local cfg = vim.g.borealis_config
local c = require("borealis.colors").select_colors()

local diagnostics_error_color = c.red
local diagnostics_hint_color = c.purple
local diagnostics_warn_color = c.yellow
local diagnostics_info_color = c.cyan

M.highlights = {
  LspCxxHlGroupEnumConstant = { fg = c.orange },
  LspCxxHlGroupMemberVariable = { fg = c.orange },
  LspCxxHlGroupNamespace = { fg = c.blue },
  LspCxxHlSkippedRegion = { fg = c.grey },
  LspCxxHlSkippedRegionBeginEnd = { fg = c.red },

  DiagnosticError = { fg = c.red },
  DiagnosticHint = { fg = c.purple },
  DiagnosticInfo = { fg = c.cyan },
  DiagnosticWarn = { fg = c.yellow },

  DiagnosticVirtualTextError = { bg = c.none, fg = diagnostics_error_color },
  DiagnosticVirtualTextWarn = { bg = c.none, fg = diagnostics_warn_color },
  DiagnosticVirtualTextInfo = { bg = c.none, fg = diagnostics_info_color },
  DiagnosticVirtualTextHint = { bg = c.none, fg = diagnostics_hint_color },

  DiagnosticUnderlineError = { fmt = "underline", sp = c.red },
  DiagnosticUnderlineHint = { fmt = "underline", sp = c.purple },
  DiagnosticUnderlineInfo = { fmt = "underline", sp = c.blue },
  DiagnosticUnderlineWarn = { fmt = "underline", sp = c.yellow },

  LspReferenceText = { bg = c.bg2 },
  LspReferenceWrite = { bg = c.bg2 },
  LspReferenceRead = { bg = c.bg2 },

  LspCodeLens = { fg = c.grey, fmt = cfg.code_style.comments },
  LspCodeLensSeparator = { fg = c.grey },
}

M.highlights.LspDiagnosticsDefaultError = M.highlights.DiagnosticError
M.highlights.LspDiagnosticsDefaultHint = M.highlights.DiagnosticHint
M.highlights.LspDiagnosticsDefaultInformation = M.highlights.DiagnosticInfo
M.highlights.LspDiagnosticsDefaultWarning = M.highlights.DiagnosticWarn
M.highlights.LspDiagnosticsUnderlineError = M.highlights.DiagnosticUnderlineError
M.highlights.LspDiagnosticsUnderlineHint = M.highlights.DiagnosticUnderlineHint
M.highlights.LspDiagnosticsUnderlineInformation = M.highlights.DiagnosticUnderlineInfo
M.highlights.LspDiagnosticsUnderlineWarning = M.highlights.DiagnosticUnderlineWarn
M.highlights.LspDiagnosticsVirtualTextError = M.highlights.DiagnosticVirtualTextError
M.highlights.LspDiagnosticsVirtualTextWarning = M.highlights.DiagnosticVirtualTextWarn
M.highlights.LspDiagnosticsVirtualTextInformation = M.highlights.DiagnosticVirtualTextInfo
M.highlights.LspDiagnosticsVirtualTextHint = M.highlights.DiagnosticVirtualTextHint

return M
