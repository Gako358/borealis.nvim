local M = {}
local cfg = vim.g.borealis_config
local util = require("borealis.util")
local c = require('borealis.colors').select_colors()
local colors = require('borealis.colors').colors

local diagnostics_error_color = cfg.diagnostics.darker and c.dark_red or c.red
local diagnostics_hint_color = cfg.diagnostics.darker and c.dark_purple or c.purple
local diagnostics_warn_color = cfg.diagnostics.darker and c.dark_yellow or c.yellow
local diagnostics_info_color = cfg.diagnostics.darker and c.dark_cyan or c.cyan

M.highlights = {
  LspCxxHlGroupEnumConstant = colors.Orange,
  LspCxxHlGroupMemberVariable = colors.Orange,
  LspCxxHlGroupNamespace = colors.Blue,
  LspCxxHlSkippedRegion = colors.Grey,
  LspCxxHlSkippedRegionBeginEnd = colors.Red,

  DiagnosticError = { fg = c.red },
  DiagnosticHint = { fg = c.purple },
  DiagnosticInfo = { fg = c.cyan },
  DiagnosticWarn = { fg = c.yellow },

  DiagnosticVirtualTextError = { bg = cfg.diagnostics.background and util.darken(diagnostics_error_color, 0.1, c.bg0) or
      c.none,
    fg = diagnostics_error_color },
  DiagnosticVirtualTextWarn = { bg = cfg.diagnostics.background and util.darken(diagnostics_warn_color, 0.1, c.bg0) or
      c.none,
    fg = diagnostics_warn_color },
  DiagnosticVirtualTextInfo = { bg = cfg.diagnostics.background and util.darken(diagnostics_info_color, 0.1, c.bg0) or
      c.none,
    fg = diagnostics_info_color },
  DiagnosticVirtualTextHint = { bg = cfg.diagnostics.background and util.darken(diagnostics_hint_color, 0.1, c.bg0) or
      c.none,
    fg = diagnostics_hint_color },

  DiagnosticUnderlineError = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.red },
  DiagnosticUnderlineHint = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.purple },
  DiagnosticUnderlineInfo = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.blue },
  DiagnosticUnderlineWarn = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.yellow },

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
