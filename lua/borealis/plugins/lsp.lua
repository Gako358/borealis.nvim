local c = require('borealis.colors')
local cfg = vim.g.borealis_config
local colors = require("borealis.theme")
local util = require("borealis.util")

local M = {}
  local diagnostics_error_color = cfg.diagnostics.darker and c.dark_red or c.red
  local diagnostics_hint_color = cfg.diagnostics.darker and c.dark_purple or c.purple
  local diagnostics_warn_color = cfg.diagnostics.darker and c.dark_yellow or c.yellow
  local diagnostics_info_color = cfg.diagnostics.darker and c.dark_cyan or c.cyan

M.lsp = {
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

M.lsp.LspDiagnosticsDefaultError = M.lsp.DiagnosticError
M.lsp.LspDiagnosticsDefaultHint = M.lsp.DiagnosticHint
M.lsp.LspDiagnosticsDefaultInformation = M.lsp.DiagnosticInfo
M.lsp.LspDiagnosticsDefaultWarning = M.lsp.DiagnosticWarn
M.lsp.LspDiagnosticsUnderlineError = M.lsp.DiagnosticUnderlineError
M.lsp.LspDiagnosticsUnderlineHint = M.lsp.DiagnosticUnderlineHint
M.lsp.LspDiagnosticsUnderlineInformation = M.lsp.DiagnosticUnderlineInfo
M.lsp.LspDiagnosticsUnderlineWarning = M.lsp.DiagnosticUnderlineWarn
M.lsp.LspDiagnosticsVirtualTextError = M.lsp.DiagnosticVirtualTextError
M.lsp.LspDiagnosticsVirtualTextWarning = M.lsp.DiagnosticVirtualTextWarn
M.lsp.LspDiagnosticsVirtualTextInformation = M.lsp.DiagnosticVirtualTextInfo
M.lsp.LspDiagnosticsVirtualTextHint = M.lsp.DiagnosticVirtualTextHint

return M

