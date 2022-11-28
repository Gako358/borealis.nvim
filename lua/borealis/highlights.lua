local M = {}
local c = require('borealis.colors')
local colors = require('borealis.palette').colors
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

hl.plugins.blankline = require("borealis.plugins.blankline").highlights
hl.plugins.bufferline = require("borealis.plugins.bufferline").highlights
hl.plugins.cmp = require("borealis.plugins.cmp").highlights
hl.plugins.gitsigns = require("borealis.plugins.gitsigns").highlights
hl.plugins.lightspeed = require("borealis.plugins.lightspeed").highlights
hl.plugins.lsp = require("borealis.plugins.lsp").highlights
hl.plugins.nvimtree = require("borealis.plugins.nvimtree").highlights
hl.plugins.telescope = require("borealis.plugins.telescope").highlights
hl.plugins.whichkey = require("borealis.plugins.whichkey").highlights

hl.langs.c = require("borealis.syntax.c").highlights
hl.langs.cpp = require("borealis.syntax.cpp").highlights
hl.langs.lua = require("borealis.syntax.lua").highlights
hl.langs.markdown = require("borealis.syntax.markdown").highlights
hl.langs.tex = require("borealis.syntax.tex").highlights
hl.langs.vim = require("borealis.syntax.vim").highlights

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
