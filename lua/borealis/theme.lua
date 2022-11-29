local M = {}
local c = require("borealis.colors").select_colors()
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
  Normal = { fg = c.fg, bg = c.bg0 },
  Terminal = { fg = c.fg, bg = c.bg0 },
  EndOfBuffer = { fg = c.bg0, bg = c.bg0 },
  FoldColumn = { fg = c.fg, bg = c.bg1 },
  Folded = { fg = c.fg, bg = c.bg1 },
  SignColumn = { fg = c.fg, bg = c.bg0 },
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
  DiffAdded = { fg = c.green },
  DiffRemoved = { fg = c.red },
  DiffFile = { fg = c.cyan },
  DiffIndexLine = { fg = c.grey },
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
  Character = { fg = c.orange },
  Number = { fg = c.orange },
  Float = { fg = c.orange },
  Boolean = { fg = c.orange },
  Type = { fg = c.yellow },
  Structure = { fg = c.yellow },
  StorageClass = { fg = c.yellow },
  Identifier = { fg = c.red, fmt = cfg.code_style.variables },
  Constant = { fg = c.cyan },
  PreProc = { fg = c.purple },
  PreCondit = { fg = c.purple },
  Include = { fg = c.purple },
  Keyword = { fg = c.purple, fmt = cfg.code_style.keywords },
  Define = { fg = c.purple },
  Typedef = { fg = c.purple },
  Exception = { fg = c.purple },
  Conditional = { fg = c.purple, fmt = cfg.code_style.keywords },
  Repeat = { fg = c.purple, fmt = cfg.code_style.keywords },
  Statement = { fg = c.purple },
  Macro = { fg = c.red },
  Error = { fg = c.purple },
  Label = { fg = c.purple },
  Special = { fg = c.red },
  SpecialChar = { fg = c.red },
  Function = { fg = c.blue, fmt = cfg.code_style.functions },
  Operator = { fg = c.purple },
  Title = { fg = c.cyan },
  Tag = { fg = c.green },
  Delimiter = { fg = c.light_grey },
  Comment = { fg = c.grey, fmt = cfg.code_style.comments },
  SpecialComment = { fg = c.grey, fmt = cfg.code_style.comments },
  Todo = { fg = c.red, fmt = cfg.code_style.comments }
}

hl.treesitter = {
  ["@annotation"] = { fg = c.fg },
  ["@attribute"] = { fg = c.cyan },
  ["@boolean"] = { fg = c.orange },
  ["@character"] = { fg = c.orange },
  ["@comment"] = { fg = c.grey, fmt = cfg.code_style.comments },
  ["@conditional"] = { fg = c.purple, fmt = cfg.code_style.keywords },
  ["@constant"] = { fg = c.orange },
  ["@constant.builtin"] = { fg = c.orange },
  ["@constant.macro"] = { fg = c.orange },
  ["@constructor"] = { fg = c.yellow, fmt = "bold" },
  ["@error"] = { fg = c.fg },
  ["@exception"] = { fg = c.purple },
  ["@field"] = { fg = c.cyan },
  ["@float"] = { fg = c.orange },
  ["@function"] = { fg = c.blue, fmt = cfg.code_style.functions },
  ["@function.builtin"] = { fg = c.cyan, fmt = cfg.code_style.functions },
  ["@function.macro"] = { fg = c.cyan, fmt = cfg.code_style.functions },
  ["@include"] = { fg = c.purple },
  ["@keyword"] = { fg = c.purple, fmt = cfg.code_style.keywords },
  ["@keyword.function"] = { fg = c.purple, fmt = cfg.code_style.functions },
  ["@keyword.operator"] = { fg = c.purple, fmt = cfg.code_style.keywords },
  ["@label"] = { fg = c.red },
  ["@method"] = { fg = c.blue },
  ["@namespace"] = { fg = c.yellow },
  ["@none"] = { fg = c.fg },
  ["@number"] = { fg = c.orange },
  ["@operator"] = { fg = c.fg },
  ["@parameter"] = { fg = c.red },
  ["@parameter.reference"] = { fg = c.fg },
  ["@property"] = { fg = c.cyan },
  ["@punctuation.delimiter"] = { fg = c.light_grey },
  ["@punctuation.bracket"] = { fg = c.light_grey },
  ["@punctuation.special"] = { fg = c.red },
  ["@repeat"] = { fg = c.purple, fmt = cfg.code_style.keywords },
  ["@string"] = { fg = c.green, fmt = cfg.code_style.strings },
  ["@string.regex"] = { fg = c.orange, fmt = cfg.code_style.strings },
  ["@string.escape"] = { fg = c.red, fmt = cfg.code_style.strings },
  ["@symbol"] = { fg = c.cyan },
  ["@tag"] = { fg = c.red },
  ["@tag.delimiter"] = { fg = c.red },
  ["@text"] = { fg = c.fg },
  ["@text.strong"] = { fg = c.fg, fmt = 'bold' },
  ["@text.emphasis"] = { fg = c.fg, fmt = 'italic' },
  ["@text.underline"] = { fg = c.fg, fmt = 'underline' },
  ["@text.strike"] = { fg = c.fg, fmt = 'strikethrough' },
  ["@text.title"] = { fg = c.orange, fmt = 'bold' },
  ["@text.literal"] = { fg = c.green },
  ["@text.uri"] = { fg = c.cyan, fmt = 'underline' },
  ["@text.math"] = { fg = c.fg },
  ["@text.reference"] = { fg = c.blue },
  ["@text.enviroment"] = { fg = c.fg },
  ["@text.enviroment.name"] = { fg = c.fg },
  ["@note"] = { fg = c.fg },
  ["@warning"] = { fg = c.fg },
  ["@danger"] = { fg = c.fg },
  ["@type"] = { fg = c.yellow },
  ["@type.builtin"] = { fg = c.orange },
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
    hl.plugins.cmp["CmpItemKind" .. kind] = { fg = color }
  end

  vim_highlights(hl.common)
  vim_highlights(hl.syntax)
  vim_highlights(hl.treesitter)

  -- plugins
  for _, group in pairs(hl.langs) do vim_highlights(group) end
  for _, group in pairs(hl.plugins) do vim_highlights(group) end
end

return M
