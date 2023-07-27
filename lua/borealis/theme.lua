local M = {}
local c = require("borealis.colors").select_colors()
local cfg = vim.g.borealis_config
local hl = {langs = {}, plugins = {}}
local function vim_highlights(highlights)
    for group_name, group_settings in pairs(highlights) do
        vim.api.nvim_command(string.format(
                                 "highlight %s guifg=%s guibg=%s guisp=%s gui=%s",
                                 group_name, group_settings.fg or "none",
                                 group_settings.bg or "none",
                                 group_settings.sp or "none",
                                 group_settings.fmt or "none"))
    end
end

hl.common = {
    Normal = {fg = c.fg, bg = c.bg0},
    Terminal = {fg = c.fg, bg = c.bg1},
    EndOfBuffer = {fg = c.bg0, bg = c.bg0},
    FoldColumn = {fg = c.fg, bg = c.bg1},
    Folded = {fg = c.fg, bg = c.bg1},
    SignColumn = {fg = c.fg, bg = c.bg0},
    ToolbarLine = {fg = c.fg},
    Cursor = {fmt = "reverse"},
    vCursor = {fmt = "reverse"},
    iCursor = {fmt = "reverse"},
    lCursor = {fmt = "reverse"},
    CursorIM = {fmt = "reverse"},
    CursorColumn = {bg = c.bg1},
    CursorLine = {bg = c.bg1},
    ColorColumn = {bg = c.bg1},
    CursorLineNr = {fg = c.fg},
    LineNr = {fg = c.grey},
    Conceal = {fg = c.grey, bg = c.bg1},
    DiffAdd = {fg = c.none, bg = c.dark_green},
    DiffChange = {fg = c.none, bg = c.dark_brown},
    DiffDelete = {fg = c.none, bg = c.dark_red},
    DiffText = {fg = c.none, bg = c.dark_blue},
    DiffAdded = {fg = c.bright_green},
    DiffRemoved = {fg = c.bright_red},
    DiffFile = {fg = c.dark_blue},
    DiffIndexLine = {fg = c.grey},
    Directory = {fg = c.bright_blue},
    ErrorMsg = {fg = c.light_red, fmt = "bold"},
    WarningMsg = {fg = c.orange, fmt = "bold"},
    MoreMsg = {fg = c.bright_blue, fmt = "bold"},
    CurSearch = {fg = c.bg0, bg = c.dark_blue},
    IncSearch = {fg = c.bg0, bg = c.dark_blue},
    Search = {fg = c.bg0, bg = c.orange},
    Substitute = {fg = c.bg0, bg = c.light_green},
    MatchParen = {fg = c.none, bg = c.grey},
    NonText = {fg = c.grey},
    Whitespace = {fg = c.grey},
    SpecialKey = {fg = c.grey},
    Pmenu = {fg = c.fg, bg = c.bg1},
    PmenuSbar = {fg = c.none, bg = c.bg1},
    PmenuSel = {fg = c.bg0, bg = c.bright_blue},
    WildMenu = {fg = c.bg0, bg = c.blue},
    PmenuThumb = {fg = c.none, bg = c.grey},
    Question = {fg = c.yellow},
    SpellBad = {fg = c.light_red, fmt = "underline", sp = c.light_red},
    SpellCap = {fg = c.yellow, fmt = "underline", sp = c.yellow},
    SpellLocal = {fg = c.light_cyan, fmt = "underline", sp = c.light_cyan},
    SpellRare = {fg = c.purple, fmt = "underline", sp = c.purple},
    StatusLine = {fg = c.fg, bg = c.bg2},
    StatusLineTerm = {fg = c.fg, bg = c.bg2},
    StatusLineNC = {fg = c.grey, bg = c.bg1},
    StatusLineTermNC = {fg = c.grey, bg = c.bg1},
    TabLine = {fg = c.fg, bg = c.bg1},
    TabLineFill = {fg = c.grey, bg = c.bg1},
    TabLineSel = {fg = c.bg0, bg = c.fg},
    VertSplit = {fg = c.bg2},
    Visual = {bg = c.bg2},
    VisualNOS = {fg = c.none, bg = c.bg2, fmt = "underline"},
    QuickFixLine = {fg = c.bright_blue, fmt = "underline"},
    Debug = {fg = c.yellow},
    debugPC = {fg = c.bg0, bg = c.green},
    debugBreakpoint = {fg = c.bg0, bg = c.light_red},
    ToolbarButton = {fg = c.bg0, bg = c.light_blue},
    FloatBorder = {fg = c.grey, bg = c.bg1},
    NormalFloat = {fg = c.fg, bg = c.bg1}
}

hl.syntax = {
    String = {fg = c.green, fmt = cfg.code_style.strings},
    Character = {fg = c.dark_yellow},
    Number = {fg = c.brown},
    Float = {fg = c.brown},
    Boolean = {fg = c.dark_yellow},
    Type = {fg = c.bright_yellow},
    Structure = {fg = c.bright_yellow},
    StorageClass = {fg = c.bright_yellow},
    Identifier = {fg = c.red, fmt = cfg.code_style.variables},
    Constant = {fg = c.dark_yellow},
    PreProc = {fg = c.purple},
    PreCondit = {fg = c.purple},
    Include = {fg = c.purple},
    Keyword = {fg = c.purple, fmt = cfg.code_style.keywords},
    Define = {fg = c.purple},
    Typedef = {fg = c.purple},
    Exception = {fg = c.light_red},
    Conditional = {fg = c.purple, fmt = cfg.code_style.keywords},
    Repeat = {fg = c.purple, fmt = cfg.code_style.keywords},
    Statement = {fg = c.purple},
    Macro = {fg = c.dark_red},
    Error = {fg = c.light_red},
    Label = {fg = c.purple},
    Special = {fg = c.dark_red},
    SpecialChar = {fg = c.dark_red},
    Function = {fg = c.blue, fmt = cfg.code_style.functions},
    Operator = {fg = c.yellow},
    Title = {fg = c.cyan},
    Tag = {fg = c.green},
    Delimiter = {fg = c.light_grey},
    Comment = {fg = c.dark_grey, fmt = cfg.code_style.comments},
    SpecialComment = {fg = c.dark_grey, fmt = cfg.code_style.comments},
    Todo = {fg = c.red, fmt = cfg.code_style.comments}
}

hl.treesitter = {
    ["@annotation"] = {fg = c.fg},
    ["@attribute"] = {fg = c.light_cyan},
    ["@boolean"] = {fg = c.dark_yellow},
    ["@character"] = {fg = c.dark_yellow},
    ["@comment"] = {fg = c.dark_grey, fmt = cfg.code_style.comments},
    ["@conditional"] = {fg = c.purple, fmt = cfg.code_style.keywords},
    ["@constant"] = {fg = c.dark_yellow},
    ["@constant.builtin"] = {fg = c.dark_yellow},
    ["@constant.macro"] = {fg = c.dark_yellow},
    ["@constructor"] = {fg = c.red, fmt = "bold"},
    ["@error"] = {fg = c.light_red},
    ["@exception"] = {fg = c.light_red},
    ["@field"] = {fg = c.cyan},
    ["@float"] = {fg = c.brown},
    ["@function"] = {fg = c.blue, fmt = cfg.code_style.functions},
    ["@function.builtin"] = {fg = c.light_cyan, fmt = cfg.code_style.functions},
    ["@function.macro"] = {fg = c.light_cyan, fmt = cfg.code_style.functions},
    ["@include"] = {fg = c.purple},
    ["@keyword"] = {fg = c.purple, fmt = cfg.code_style.keywords},
    ["@keyword.function"] = {fg = c.purple, fmt = cfg.code_style.functions},
    ["@keyword.operator"] = {fg = c.purple, fmt = cfg.code_style.keywords},
    ["@label"] = {fg = c.red},
    ["@method"] = {fg = c.blue},
    ["@namespace"] = {fg = c.red},
    ["@none"] = {fg = c.fg},
    ["@number"] = {fg = c.brown},
    ["@operator"] = {fg = c.fg1},
    ["@parameter"] = {fg = c.red},
    ["@parameter.reference"] = {fg = c.fg1},
    ["@preproc"] = {fg = c.purple},
    ["@property"] = {fg = c.light_cyan},
    ["@punctuation.delimiter"] = {fg = c.light_grey},
    ["@punctuation.bracket"] = {fg = c.light_grey},
    ["@punctuation.special"] = {fg = c.dark_red},
    ["@repeat"] = {fg = c.purple, fmt = cfg.code_style.keywords},
    ["@string"] = {fg = c.green, fmt = cfg.code_style.strings},
    ["@string.regex"] = {fg = c.dark_yellow, fmt = cfg.code_style.strings},
    ["@string.escape"] = {fg = c.red, fmt = cfg.code_style.strings},
    ["@symbol"] = {fg = c.light_cyan},
    ["@tag"] = {fg = c.light_blue},
    ["@tag.delimiter"] = {fg = c.light_blue},
    ["@tag.attribute"] = {fg = c.light_cyan},
    ["@text"] = {fg = c.fg},
    ["@text.strong"] = {fg = c.fg, fmt = 'bold'},
    ["@text.emphasis"] = {fg = c.fg, fmt = 'italic'},
    ["@text.underline"] = {fg = c.fg, fmt = 'underline'},
    ["@text.strike"] = {fg = c.fg, fmt = 'strikethrough'},
    ["@text.title"] = {fg = c.dark_yellow, fmt = 'bold'},
    ["@text.literal"] = {fg = c.green},
    ["@text.uri"] = {fg = c.light_cyan, fmt = 'underline'},
    ["@text.todo"] = {fg = c.red, fmt = cfg.code_style.comments},
    ["@text.math"] = {fg = c.fg},
    ["@text.reference"] = {fg = c.fg},
    ["@text.environment"] = {fg = c.fg},
    ["@text.environment.name"] = {fg = c.fg},
    ["@text.diff.add"] = {fg = c.bright_green},
    ["@text.diff.delete"] = {fg = c.bright_red},
    ["@note"] = {fg = c.fg},
    ["@warning"] = {fg = c.fg},
    ["@danger"] = {fg = c.fg},
    ["@type"] = {fg = c.bright_yellow},
    ["@type.builtin"] = {fg = c.dark_yellow},
    ["@variable"] = {fg = c.fg1, fmt = cfg.code_style.variables},
    ["@variable.builtin"] = {fg = c.red, fmt = cfg.code_style.variables}
}

hl.lsp = {
    ["@lsp.type.comment"] = hl.treesitter["@comment"],
    ["@lsp.type.enum"] = hl.treesitter["@type"],
    ["@lsp.type.enumMember"] = hl.treesitter["@constant.builtin"],
    ["@lsp.type.interface"] = hl.treesitter["@type"],
    ["@lsp.type.typeParameter"] = hl.treesitter["@type"],
    ["@lsp.type.keyword"] = hl.treesitter["@keyword"],
    ["@lsp.type.namespace"] = hl.treesitter["@namespace"],
    ["@lsp.type.parameter"] = hl.treesitter["@parameter"],
    ["@lsp.type.property"] = hl.treesitter["@property"],
    ["@lsp.type.variable"] = hl.treesitter["@variable"],
    ["@lsp.type.macro"] = hl.treesitter["@function.macro"],
    ["@lsp.type.method"] = hl.treesitter["@method"],
    ["@lsp.type.number"] = hl.treesitter["@number"],
    ["@lsp.type.generic"] = hl.treesitter["@text"],
    ["@lsp.type.builtinType"] = hl.treesitter["@type.builtin"],
    ["@lsp.typemod.method.defaultLibrary"] = hl.treesitter["@function"],
    ["@lsp.typemod.function.defaultLibrary"] = hl.treesitter["@function"],
    ["@lsp.typemod.operator.injected"] = hl.treesitter["@operator"],
    ["@lsp.typemod.string.injected"] = hl.treesitter["@string"],
    ["@lsp.typemod.variable.defaultLibrary"] = hl.treesitter["@variable.builtin"],
    ["@lsp.typemod.variable.injected"] = hl.treesitter["@variable"],
    ["@lsp.typemod.variable.static"] = hl.treesitter["@constant"]
}

hl.plugins.blankline = require("borealis.plugins.blankline").highlights
hl.plugins.bufferline = require("borealis.plugins.bufferline").highlights
hl.plugins.cmp = require("borealis.plugins.cmp").highlights
hl.plugins.gitsigns = require("borealis.plugins.gitsigns").highlights
hl.plugins.lightspeed = require("borealis.plugins.lightspeed").highlights
hl.plugins.lsp = require("borealis.plugins.lsp").highlights
hl.plugins.noice = require("borealis.plugins.noice").highlights
hl.plugins.nvimtree = require("borealis.plugins.nvimtree").highlights
hl.plugins.saga = require("borealis.plugins.saga").highlights
hl.plugins.telescope = require("borealis.plugins.telescope").highlights
hl.plugins.trouble = require("borealis.plugins.trouble").highlights
hl.plugins.whichkey = require("borealis.plugins.whichkey").highlights

hl.langs.c = require("borealis.syntax.c").highlights
hl.langs.cpp = require("borealis.syntax.cpp").highlights
hl.langs.lua = require("borealis.syntax.lua").highlights
hl.langs.markdown = require("borealis.syntax.markdown").highlights
hl.langs.scala = require("borealis.syntax.scala").highlights
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
    Variable = c.purple
}

function M.setup()
    for kind, color in pairs(lsp_kind_icons_color) do
        hl.plugins.cmp["CmpItemKind" .. kind] = {fg = color}
    end

    vim_highlights(hl.common)
    vim_highlights(hl.syntax)
    vim_highlights(hl.treesitter)
    vim_highlights(hl.lsp)

    -- plugins
    for _, group in pairs(hl.langs) do vim_highlights(group) end
    for _, group in pairs(hl.plugins) do vim_highlights(group) end
end

return M
