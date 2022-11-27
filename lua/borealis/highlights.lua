local c = require('borealis.colors')
local cfg = vim.g.borealis_config
local util = require("borealis.util")

local M = {}
local hl = { langs = {}, plugins = {} }

local function vim_highlights(highlights)
  for group_name, group_settings in pairs(highlights) do
    vim.api.nvim_command(string.format("highlight %s guifg=%s guibg=%s guisp=%s gui=%s", group_name,
      group_settings.fg or "none",
      group_settings.bg or "none",
      group_settings.sp or "none",
      group_settings.fmt or "none"))
  end
end

local colors = {
  Fg = { fg = c.fg },
  LightGrey = { fg = c.light_grey },
  Grey = { fg = c.grey },
  Red = { fg = c.red },
  Cyan = { fg = c.cyan },
  Yellow = { fg = c.yellow },
  Orange = { fg = c.orange },
  Green = { fg = c.green },
  Blue = { fg = c.blue },
  Purple = { fg = c.purple }
}
hl.common = {
  Normal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
  Terminal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
  EndOfBuffer = { fg = cfg.ending_tildes and c.bg2 or c.bg0, bg = cfg.transparent and c.none or c.bg0 },
  FoldColumn = { fg = c.fg, bg = cfg.transparent and c.none or c.bg1 },
  Folded = { fg = c.fg, bg = cfg.transparent and c.none or c.bg1 },
  SignColumn = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
  ToolbarLine = { fg = c.fg },
  Cursor = { fmt = "reverse" },
  vCursor = { fmt = "reverse" },
  iCursor = { fmt = "reverse" },
  lCursor = { fmt = "reverse" },
  CursorIM = { fmt = "reverse" },
  CursorColumn = { bg = c.bg1 },
  CursorLine = { bg = c.bg1 },
  ColorColumn = { bg = c.bg1 },
  CursorLineNr = { fg = c.fg },
  LineNr = { fg = c.grey },
  Conceal = { fg = c.grey, bg = c.bg1 },
  DiffAdd = { fg = c.none, bg = c.diff_add },
  DiffChange = { fg = c.none, bg = c.diff_change },
  DiffDelete = { fg = c.none, bg = c.diff_delete },
  DiffText = { fg = c.none, bg = c.diff_text },
  DiffAdded = colors.Green,
  DiffRemoved = colors.Red,
  DiffFile = colors.Cyan,
  DiffIndexLine = colors.Grey,
  Directory = { fg = c.blue },
  ErrorMsg = { fg = c.red, fmt = "bold" },
  WarningMsg = { fg = c.yellow, fmt = "bold" },
  MoreMsg = { fg = c.blue, fmt = "bold" },
  IncSearch = { fg = c.bg0, bg = c.orange },
  Search = { fg = c.bg0, bg = c.yellow },
  Substitute = { fg = c.bg0, bg = c.green },
  MatchParen = { fg = c.none, bg = c.grey },
  NonText = { fg = c.grey },
  Whitespace = { fg = c.grey },
  SpecialKey = { fg = c.grey },
  Pmenu = { fg = c.fg, bg = c.bg1 },
  PmenuSbar = { fg = c.none, bg = c.bg1 },
  PmenuSel = { fg = c.bg0, bg = c.blue },
  WildMenu = { fg = c.bg0, bg = c.blue },
  PmenuThumb = { fg = c.none, bg = c.grey },
  Question = { fg = c.yellow },
  SpellBad = { fg = c.red, fmt = "underline", sp = c.red },
  SpellCap = { fg = c.yellow, fmt = "underline", sp = c.yellow },
  SpellLocal = { fg = c.blue, fmt = "underline", sp = c.blue },
  SpellRare = { fg = c.purple, fmt = "underline", sp = c.purple },
  StatusLine = { fg = c.fg, bg = c.bg2 },
  StatusLineTerm = { fg = c.fg, bg = c.bg2 },
  StatusLineNC = { fg = c.grey, bg = c.bg1 },
  StatusLineTermNC = { fg = c.grey, bg = c.bg1 },
  TabLine = { fg = c.fg, bg = c.bg1 },
  TabLineFill = { fg = c.grey, bg = c.bg1 },
  TabLineSel = { fg = c.bg0, bg = c.fg },
  VertSplit = { fg = c.bg2 },
  Visual = { bg = c.bg2 },
  VisualNOS = { fg = c.none, bg = c.bg2, fmt = "underline" },
  QuickFixLine = { fg = c.blue, fmt = "underline" },
  Debug = { fg = c.yellow },
  debugPC = { fg = c.bg0, bg = c.green },
  debugBreakpoint = { fg = c.bg0, bg = c.red },
  ToolbarButton = { fg = c.bg0, bg = c.blue },
  FloatBorder = { fg = c.grey, bg = c.bg1 },
  NormalFloat = { fg = c.fg, bg = c.bg1 },
}

hl.syntax = {
  String = { fg = c.green, fmt = cfg.code_style.strings },
  Character = colors.Orange,
  Number = colors.Orange,
  Float = colors.Orange,
  Boolean = colors.Orange,
  Type = colors.Yellow,
  Structure = colors.Yellow,
  StorageClass = colors.Yellow,
  Identifier = { fg = c.red, fmt = cfg.code_style.variables },
  Constant = colors.Cyan,
  PreProc = colors.Purple,
  PreCondit = colors.Purple,
  Include = colors.Purple,
  Keyword = { fg = c.purple, fmt = cfg.code_style.keywords },
  Define = colors.Purple,
  Typedef = colors.Purple,
  Exception = colors.Purple,
  Conditional = { fg = c.purple, fmt = cfg.code_style.keywords },
  Repeat = { fg = c.purple, fmt = cfg.code_style.keywords },
  Statement = colors.Purple,
  Macro = colors.Red,
  Error = colors.Purple,
  Label = colors.Purple,
  Special = colors.Red,
  SpecialChar = colors.Red,
  Function = { fg = c.blue, fmt = cfg.code_style.functions },
  Operator = colors.Purple,
  Title = colors.Cyan,
  Tag = colors.Green,
  Delimiter = colors.LightGrey,
  Comment = { fg = c.grey, fmt = cfg.code_style.comments },
  SpecialComment = { fg = c.grey, fmt = cfg.code_style.comments },
  Todo = { fg = c.red, fmt = cfg.code_style.comments }
}

hl.treesitter = {
  ["@annotation"] = colors.Fg,
  ["@attribute"] = colors.Cyan,
  ["@boolean"] = colors.Orange,
  ["@character"] = colors.Orange,
  ["@comment"] = { fg = c.grey, fmt = cfg.code_style.comments },
  ["@conditional"] = { fg = c.purple, fmt = cfg.code_style.keywords },
  ["@constant"] = colors.Orange,
  ["@constant.builtin"] = colors.Orange,
  ["@constant.macro"] = colors.Orange,
  ["@constructor"] = { fg = c.yellow, fmt = "bold" },
  ["@error"] = colors.Fg,
  ["@exception"] = colors.Purple,
  ["@field"] = colors.Cyan,
  ["@float"] = colors.Orange,
  ["@function"] = { fg = c.blue, fmt = cfg.code_style.functions },
  ["@function.builtin"] = { fg = c.cyan, fmt = cfg.code_style.functions },
  ["@function.macro"] = { fg = c.cyan, fmt = cfg.code_style.functions },
  ["@include"] = colors.Purple,
  ["@keyword"] = { fg = c.purple, fmt = cfg.code_style.keywords },
  ["@keyword.function"] = { fg = c.purple, fmt = cfg.code_style.functions },
  ["@keyword.operator"] = { fg = c.purple, fmt = cfg.code_style.keywords },
  ["@label"] = colors.Red,
  ["@method"] = colors.Blue,
  ["@namespace"] = colors.Yellow,
  ["@none"] = colors.Fg,
  ["@number"] = colors.Orange,
  ["@operator"] = colors.Fg,
  ["@parameter"] = colors.Red,
  ["@parameter.reference"] = colors.Fg,
  ["@property"] = colors.Cyan,
  ["@punctuation.delimiter"] = colors.LightGrey,
  ["@punctuation.bracket"] = colors.LightGrey,
  ["@punctuation.special"] = colors.Red,
  ["@repeat"] = { fg = c.purple, fmt = cfg.code_style.keywords },
  ["@string"] = { fg = c.green, fmt = cfg.code_style.strings },
  ["@string.regex"] = { fg = c.orange, fmt = cfg.code_style.strings },
  ["@string.escape"] = { fg = c.red, fmt = cfg.code_style.strings },
  ["@symbol"] = colors.Cyan,
  ["@tag"] = colors.Red,
  ["@tag.delimiter"] = colors.Red,
  ["@text"] = colors.Fg,
  ["@text.strong"] = { fg = c.fg, fmt = 'bold' },
  ["@text.emphasis"] = { fg = c.fg, fmt = 'italic' },
  ["@text.underline"] = { fg = c.fg, fmt = 'underline' },
  ["@text.strike"] = { fg = c.fg, fmt = 'strikethrough' },
  ["@text.title"] = { fg = c.orange, fmt = 'bold' },
  ["@text.literal"] = colors.Green,
  ["@text.uri"] = { fg = c.cyan, fmt = 'underline' },
  ["@text.math"] = colors.Fg,
  ["@text.reference"] = colors.Blue,
  ["@text.enviroment"] = colors.Fg,
  ["@text.enviroment.name"] = colors.Fg,
  ["@note"] = colors.Fg,
  ["@warning"] = colors.Fg,
  ["@danger"] = colors.Fg,
  ["@type"] = colors.Yellow,
  ["@type.builtin"] = colors.Orange,
  ["@variable"] = { fg = c.fg, fmt = cfg.code_style.variables },
  ["@variable.builtin"] = { fg = c.red, fmt = cfg.code_style.variables },
}

local diagnostics_error_color = cfg.diagnostics.darker and c.dark_red or c.red
local diagnostics_hint_color = cfg.diagnostics.darker and c.dark_purple or c.purple
local diagnostics_warn_color = cfg.diagnostics.darker and c.dark_yellow or c.yellow
local diagnostics_info_color = cfg.diagnostics.darker and c.dark_cyan or c.cyan
hl.plugins.lsp = {
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

hl.plugins.lsp.LspDiagnosticsDefaultError = hl.plugins.lsp.DiagnosticError
hl.plugins.lsp.LspDiagnosticsDefaultHint = hl.plugins.lsp.DiagnosticHint
hl.plugins.lsp.LspDiagnosticsDefaultInformation = hl.plugins.lsp.DiagnosticInfo
hl.plugins.lsp.LspDiagnosticsDefaultWarning = hl.plugins.lsp.DiagnosticWarn
hl.plugins.lsp.LspDiagnosticsUnderlineError = hl.plugins.lsp.DiagnosticUnderlineError
hl.plugins.lsp.LspDiagnosticsUnderlineHint = hl.plugins.lsp.DiagnosticUnderlineHint
hl.plugins.lsp.LspDiagnosticsUnderlineInformation = hl.plugins.lsp.DiagnosticUnderlineInfo
hl.plugins.lsp.LspDiagnosticsUnderlineWarning = hl.plugins.lsp.DiagnosticUnderlineWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextError = hl.plugins.lsp.DiagnosticVirtualTextError
hl.plugins.lsp.LspDiagnosticsVirtualTextWarning = hl.plugins.lsp.DiagnosticVirtualTextWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextInformation = hl.plugins.lsp.DiagnosticVirtualTextInfo
hl.plugins.lsp.LspDiagnosticsVirtualTextHint = hl.plugins.lsp.DiagnosticVirtualTextHint

hl.plugins.cmp = {
  CmpItemAbbr = colors.Fg,
  CmpItemAbbrDeprecated = { fg = c.light_grey, fmt = "strikethrough" },
  CmpItemAbbrMatch = colors.Cyan,
  CmpItemAbbrMatchFuzzy = { fg = c.cyan, fmt = "underline" },
  CmpItemMenu = colors.LightGrey,
  CmpItemKind = { fg = c.purple, fmt = cfg.cmp_itemkind_reverse and "reverse" },
}

hl.plugins.whichkey = {
  WhichKey = colors.Red,
  WhichKeyDesc = colors.Blue,
  WhichKeyGroup = colors.Orange,
  WhichKeySeperator = colors.Green
}

hl.plugins.gitgutter = {
  GitGutterAdd = { fg = c.green },
  GitGutterChange = { fg = c.blue },
  GitGutterDelete = { fg = c.red },
}

-- comment
hl.plugins.diffview = {
  DiffviewFilePanelTitle = { fg = c.blue, fmt = "bold" },
  DiffviewFilePanelCounter = { fg = c.purple, fmt = "bold" },
  DiffviewFilePanelFileName = colors.Fg,
  DiffviewNormal = hl.common.Normal,
  DiffviewCursorLine = hl.common.CursorLine,
  DiffviewVertSplit = hl.common.VertSplit,
  DiffviewSignColumn = hl.common.SignColumn,
  DiffviewStatusLine = hl.common.StatusLine,
  DiffviewStatusLineNC = hl.common.StatusLineNC,
  DiffviewEndOfBuffer = hl.common.EndOfBuffer,
  DiffviewFilePanelRootPath = colors.Grey,
  DiffviewFilePanelPath = colors.Grey,
  DiffviewFilePanelInsertions = colors.Green,
  DiffviewFilePanelDeletions = colors.Red,
  DiffviewStatusAdded = colors.Green,
  DiffviewStatusUntracked = colors.Blue,
  DiffviewStatusModified = colors.Blue,
  DiffviewStatusRenamed = colors.Blue,
  DiffviewStatusCopied = colors.Blue,
  DiffviewStatusTypeChange = colors.Blue,
  DiffviewStatusUnmerged = colors.Blue,
  DiffviewStatusUnknown = colors.Red,
  DiffviewStatusDeleted = colors.Red,
  DiffviewStatusBroken = colors.Red
}

hl.plugins.gitsigns = {
  GitSignsAdd = colors.Green,
  GitSignsAddLn = colors.Green,
  GitSignsAddNr = colors.Green,
  GitSignsChange = colors.Blue,
  GitSignsChangeLn = colors.Blue,
  GitSignsChangeNr = colors.Blue,
  GitSignsDelete = colors.Red,
  GitSignsDeleteLn = colors.Red,
  GitSignsDeleteNr = colors.Red
}

hl.plugins.nvim_tree = {
  NvimTreeNormal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg1 },
  NvimTreeVertSplit = { fg = c.bg1, bg = cfg.transparent and c.none or c.bg1 },
  NvimTreeEndOfBuffer = { fg = cfg.ending_tildes and c.bg2 or c.bg1, bg = cfg.transparent and c.none or c.bg1 },
  NvimTreeRootFolder = { fg = c.orange, fmt = "bold" },
  NvimTreeGitDirty = colors.Yellow,
  NvimTreeGitNew = colors.Green,
  NvimTreeGitDeleted = colors.Red,
  NvimTreeSpecialFile = { fg = c.yellow, fmt = "underline" },
  NvimTreeIndentMarker = colors.Fg,
  NvimTreeImageFile = { fg = c.dark_purple },
  NvimTreeSymlink = colors.Purple,
  NvimTreeFolderName = colors.Blue,
}
hl.plugins.telescope = {
  TelescopeBorder = colors.Red,
  TelescopePromptBorder = colors.Cyan,
  TelescopeResultsBorder = colors.Cyan,
  TelescopePreviewBorder = colors.Cyan,
  TelescopeMatching = { fg = c.orange, fmt = "bold" },
  TelescopePromptPrefix = colors.Green,
  TelescopeSelection = { bg = c.bg2 },
  TelescopeSelectionCaret = colors.Yellow
}

hl.plugins.ts_rainbow = {
  rainbowcol1 = colors.Grey,
  rainbowcol2 = colors.Yellow,
  rainbowcol3 = colors.Blue,
  rainbowcol4 = colors.Orange,
  rainbowcol5 = colors.Purple,
  rainbowcol6 = colors.Green,
  rainbowcol7 = colors.Red
}

hl.plugins.bufferline = {
  -- Selected
  BufferLineIndicatorSelected = { fg = c.blue, bg = c.bg0 },
  BufferLineBufferSelected = { fg = c.fg, bg = c.bg0, fmt = "bold" },
  BufferLineNumbersSelected = { fg = c.fg, bg = c.bg0 },
  BufferLineCloseButtonSelected = { fg = c.bg0, bg = c.bg0 },
  BufferLineDiagnosticSelected = { fg = c.purple, bg = c.bg0 },
  BufferLineHintSelected = { fg = c.fg, bg = c.bg0 },
  BufferlineHintDiagnosticSelected = { fg = c.blue, bg = c.bg0 },
  BufferLineInfoSelected = { fg = c.fg, bg = c.bg0 },
  BufferLineInfoDiagnosticSelected = { fg = c.green, bg = c.bg0 },
  BufferlineWarningSelected = { fg = c.fg, bg = c.bg0, fmt = "italic" },
  BufferLineWarningDiagnosticSelected = { fg = c.yellow, bg = c.bg0, fmt = "bold" },
  BufferLineErrorSelected = { fg = c.fg, bg = c.bg0, fmt = "bold" },
  BufferLineErrorDiagnosticSelected = { fg = c.dark_red, bg = c.bg0, fmt = "bold" },
  BufferLineModifiedSelected = { fg = c.green, bg = c.bg0 },
  BufferLineDuplicateSelected = { fg = c.fg, bg = c.bg0 },
  BufferLineSeparatorSelected = { fg = c.grey, bg = c.bg0 },
  -- Visible
  BufferLineBufferVisible = { fg = c.grey, bg = c.bg0 },
  BufferLineNumbersVisible = { fg = c.grey, bg = c.bg0 },
  BufferLineCloseButtonVisible = { fg = c.bg0, bg = c.bg0 },
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

hl.langs.c = {
  cInclude = colors.Blue,
  cStorageClass = colors.Purple,
  cTypedef = colors.Purple,
  cDefine = colors.Cyan,
  cTSInclude = colors.Blue,
  cTSConstant = colors.Cyan,
  cTSConstMacro = colors.Purple,
  cTSOperator = colors.Purple,
}

hl.langs.cpp = {
  cppStatement = { fg = c.purple, fmt = "bold" },
  cppTSInclude = colors.Blue,
  cppTSConstant = colors.Cyan,
  cppTSConstMacro = colors.Purple,
  cppTSOperator = colors.Purple,
}

hl.langs.markdown = {
  markdownBlockquote = colors.Grey,
  markdownBold = { fg = c.none, fmt = "bold" },
  markdownBoldDelimiter = colors.Grey,
  markdownCode = colors.Green,
  markdownCodeBlock = colors.Green,
  markdownCodeDelimiter = colors.Yellow,
  markdownH1 = { fg = c.red, fmt = "bold" },
  markdownH2 = { fg = c.purple, fmt = "bold" },
  markdownH3 = { fg = c.orange, fmt = "bold" },
  markdownH4 = { fg = c.red, fmt = "bold" },
  markdownH5 = { fg = c.purple, fmt = "bold" },
  markdownH6 = { fg = c.orange, fmt = "bold" },
  markdownHeadingDelimiter = colors.Grey,
  markdownHeadingRule = colors.Grey,
  markdownId = colors.Yellow,
  markdownIdDeclaration = colors.Red,
  markdownItalic = { fg = c.none, fmt = "italic" },
  markdownItalicDelimiter = { fg = c.grey, fmt = "italic" },
  markdownLinkDelimiter = colors.Grey,
  markdownLinkText = colors.Red,
  markdownLinkTextDelimiter = colors.Grey,
  markdownListMarker = colors.Red,
  markdownOrderedListMarker = colors.Red,
  markdownRule = colors.Purple,
  markdownUrl = { fg = c.blue, fmt = "underline" },
  markdownUrlDelimiter = colors.Grey,
  markdownUrlTitleDelimiter = colors.Green
}

hl.langs.tex = {
  latexTSInclude         = colors.Blue,
  latexTSFuncMacro       = { fg = c.fg, fmt = cfg.code_style.functions },
  latexTSEnvironment     = { fg = c.cyan, fmt = "bold" },
  latexTSEnvironmentName = colors.Yellow,
  texCmdEnv              = colors.Cyan,
  texEnvArgName          = colors.Yellow,
  latexTSTitle           = colors.Green,
  latexTSType            = colors.Blue,
  latexTSMath            = colors.Orange,
  texMathZoneX           = colors.Orange,
  texMathZoneXX          = colors.Orange,
  texMathDelimZone       = colors.LightGrey,
  texMathDelim           = colors.Purple,
  texMathOper            = colors.Red,
  texCmd                 = colors.Purple,
  texCmdPart             = colors.Blue,
  texCmdPackage          = colors.Blue,
  texPgfType             = colors.Yellow,
}

hl.langs.vim = {
  vimOption = colors.Red,
  vimSetEqual = colors.Yellow,
  vimMap = colors.Purple,
  vimMapModKey = colors.Orange,
  vimNotation = colors.Red,
  vimMapLhs = colors.Fg,
  vimMapRhs = colors.Blue,
  vimVar = { fg = c.fg, fmt = cfg.code_style.variables },
  vimCommentTitle = { fg = c.light_grey, fmt = cfg.code_style.comments },
}

local lsp_kind_icons_color = {
  Default = c.purple,
  Array = c.yellow,
  Boolean = c.orange,
  Class = c.yellow,
  Color = c.green,
  Constant = c.orange,
  Constructor = c.blue,
  Enum = c.purple,
  EnumMember = c.yellow,
  Event = c.yellow,
  Field = c.purple,
  File = c.blue,
  Folder = c.orange,
  Function = c.blue,
  Interface = c.green,
  Key = c.cyan,
  Keyword = c.cyan,
  Method = c.blue,
  Module = c.orange,
  Namespace = c.red,
  Null = c.grey,
  Number = c.orange,
  Object = c.red,
  Operator = c.red,
  Package = c.yellow,
  Property = c.cyan,
  Reference = c.orange,
  Snippet = c.red,
  String = c.green,
  Struct = c.purple,
  Text = c.light_grey,
  TypeParameter = c.red,
  Unit = c.green,
  Value = c.orange,
  Variable = c.purple,
}

function M.setup()
  -- define cmp and aerial kind highlights with lsp_kind_icons_color
  for kind, color in pairs(lsp_kind_icons_color) do
    hl.plugins.cmp["CmpItemKind" .. kind] = { fg = color, fmt = cfg.cmp_itemkind_reverse and "reverse" }
  end

  vim_highlights(hl.common)
  vim_highlights(hl.syntax)
  vim_highlights(hl.treesitter)
  for _, group in pairs(hl.langs) do vim_highlights(group) end
  for _, group in pairs(hl.plugins) do vim_highlights(group) end

  -- user defined highlights: vim_highlights function cannot be used because it sets an attribute to none if not specified
  local function replace_color(prefix, color_name)
    if not color_name then return "" end
    if color_name:sub(1, 1) == '$' then
      local name = color_name:sub(2, -1)
      color_name = c[name]
      if not color_name then
        vim.schedule(function()
          vim.notify('borealis.nvim: unknown color "' .. name .. '"', vim.log.levels.ERROR, { title = "borealis.nvim" })
        end)
        return ""
      end
    end
    return prefix .. "=" .. color_name
  end

  for group_name, group_settings in pairs(vim.g.borealis_config.highlights) do
    vim.api.nvim_command(string.format("highlight %s %s %s %s %s", group_name,
      replace_color("guifg", group_settings.fg),
      replace_color("guibg", group_settings.bg),
      replace_color("guisp", group_settings.sp),
      replace_color("gui", group_settings.fmt)))
  end
end

return M
