local M = {}

local c = require('borealis.colors').select_colors()
local colors = require('borealis.colors').colors
local cfg = vim.g.borealis_config

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

hl.treesitter = require("borealis.treesitter").highlights

hl.plugins.blankline = require("borealis.plugins.blankline").highlights
hl.plugins.bufferline = require("borealis.plugins.bufferline").highlights
hl.plugins.cmp = require("borealis.plugins.cmp").highlights
hl.plugins.gitgutter = require("borealis.plugins.gitgutter").highlights
hl.plugins.gitsigns = require("borealis.plugins.gitsigns").highlights
hl.plugins.lightspeed = require("borealis.plugins.lightspeed").highlights
hl.plugins.lsp = require("borealis.plugins.lsp").highlights
hl.plugins.nvimtree = require("borealis.plugins.nvimtree").highlights
hl.plugins.telescope = require("borealis.plugins.telescope").highlights
hl.plugins.whichkey = require("borealis.plugins.whichkey").highlights

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
  for kind, color in pairs(lsp_kind_icons_color) do
    hl.plugins.cmp["CmpItemKind" .. kind] = { fg = color, fmt = cfg.cmp_itemkind_reverse and "reverse" }
  end

  vim_highlights(hl.common)
  vim_highlights(hl.syntax)
  vim_highlights(hl.treesitter)

  -- plugins
  for _, group in pairs(hl.langs) do vim_highlights(group) end
  for _, group in pairs(hl.plugins) do vim_highlights(group) end
end

return M
