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
    DiffAdd = {fg = c.none, bg = c.diff_add_bg},
    DiffChange = {fg = c.none, bg = c.diff_change_bg},
    DiffDelete = {fg = c.none, bg = c.diff_delete_bg},
    DiffText = {fg = c.none, bg = c.diff_text},
    DiffAdded = {fg = c.diff_add},
    DiffRemoved = {fg = c.diff_delete},
    DiffFile = {fg = c.diff_file},
    DiffIndexLine = {fg = c.grey},
    Directory = {fg = c.info},
    ErrorMsg = {fg = c.diagnostic_error, fmt = "bold"},
    WarningMsg = {fg = c.diagnostic_warn, fmt = "bold"},
    MoreMsg = {fg = c.info, fmt = "bold"},
    CurSearch = {fg = c.bg0, bg = c.search},
    IncSearch = {fg = c.bg0, bg = c.todo},
    Search = {fg = c.bg0, bg = c.search},
    Substitute = {fg = c.bg0, bg = c.substitute},
    MatchParen = {fg = c.none, bg = c.grey},
    NonText = {fg = c.grey},
    Whitespace = {fg = c.grey},
    SpecialKey = {fg = c.grey},
    Pmenu = {fg = c.fg, bg = c.bg1},
    PmenuSbar = {fg = c.none, bg = c.bg1},
    PmenuSel = {fg = c.bg0, bg = c.info},
    WildMenu = {fg = c.bg0, bg = c.info},
    PmenuThumb = {fg = c.none, bg = c.grey},
    Question = {fg = c.questions},
    SpellBad = {fg = c.exceptions, fmt = "underline", sp = c.exceptions},
    SpellCap = {fg = c.operators, fmt = "underline", sp = c.operators},
    SpellLocal = {fg = c.builtin, fmt = "underline", sp = c.builtin},
    SpellRare = {fg = c.statements, fmt = "underline", sp = c.statements},
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
    QuickFixLine = {fg = c.info, fmt = "underline"},
    Debug = {fg = c.operators},
    debugPC = {fg = c.bg0, bg = c.text},
    debugBreakpoint = {fg = c.bg0, bg = c.exceptions},
    ToolbarButton = {fg = c.bg0, bg = c.tags},
    FloatBorder = {fg = c.grey, bg = c.bg1},
    NormalFloat = {fg = c.fg, bg = c.bg1}
}

hl.syntax = {
    String = {fg = c.strings, fmt = cfg.code_style.strings},
    Character = {fg = c.constants},
    Number = {fg = c.number},
    Float = {fg = c.number},
    Boolean = {fg = c.constants},
    Type = {fg = c.types},
    Structure = {fg = c.structures},
    StorageClass = {fg = c.structures},
    Identifier = {fg = c.identifier, fmt = cfg.code_style.variables},
    Constant = {fg = c.constants},
    PreProc = {fg = c.statements},
    PreCondit = {fg = c.statements},
    Include = {fg = c.statements},
    Keyword = {fg = c.statements, fmt = cfg.code_style.keywords},
    Define = {fg = c.statements},
    Typedef = {fg = c.statements},
    Exception = {fg = c.exceptions},
    Conditional = {fg = c.statements, fmt = cfg.code_style.keywords},
    Repeat = {fg = c.statements, fmt = cfg.code_style.keywords},
    Statement = {fg = c.statements},
    Macro = {fg = c.special},
    Error = {fg = c.exceptions},
    Label = {fg = c.statements},
    Special = {fg = c.special},
    SpecialChar = {fg = c.special},
    Function = {fg = c.functions, fmt = cfg.code_style.functions},
    Operator = {fg = c.operators},
    Title = {fg = c.fields},
    Tag = {fg = c.text},
    Delimiter = {fg = c.light_grey},
    Comment = {fg = c.comments, fmt = cfg.code_style.comments},
    SpecialComment = {fg = c.comments, fmt = cfg.code_style.comments},
    Todo = {fg = c.todo, fmt = cfg.code_style.comments}
}

hl.treesitter = {
    ["@annotation"] = {fg = c.fg},
    ["@attribute"] = {fg = c.builtin},
    ["@boolean"] = {fg = c.constants},
    ["@character"] = {fg = c.constants},
    ["@comment"] = {fg = c.comments, fmt = cfg.code_style.comments},
    ["@conditional"] = {fg = c.statements, fmt = cfg.code_style.keywords},
    ["@constant"] = {fg = c.constants},
    ["@constant.builtin"] = {fg = c.constants},
    ["@constant.macro"] = {fg = c.constants},
    ["@constructor"] = {fg = c.identifier, fmt = "bold"},
    ["@error"] = {fg = c.diagnostic_error},
    ["@exception"] = {fg = c.exceptions},
    ["@field"] = {fg = c.fields},
    ["@float"] = {fg = c.number},
    ["@function"] = {fg = c.functions, fmt = cfg.code_style.functions},
    ["@function.builtin"] = {fg = c.builtin, fmt = cfg.code_style.functions},
    ["@function.macro"] = {fg = c.builtin, fmt = cfg.code_style.functions},
    ["@include"] = {fg = c.statements},
    ["@keyword"] = {fg = c.statements, fmt = cfg.code_style.keywords},
    ["@keyword.function"] = {fg = c.statements, fmt = cfg.code_style.functions},
    ["@keyword.operator"] = {fg = c.statements, fmt = cfg.code_style.keywords},
    ["@label"] = {fg = c.todo},
    ["@method"] = {fg = c.functions},
    ["@namespace"] = {fg = c.identifier},
    ["@none"] = {fg = c.fg},
    ["@number"] = {fg = c.number},
    ["@operator"] = {fg = c.variables},
    ["@parameter"] = {fg = c.todo},
    ["@parameter.reference"] = {fg = c.variables},
    ["@preproc"] = {fg = c.statements},
    ["@property"] = {fg = c.builtin},
    ["@punctuation.delimiter"] = {fg = c.light_grey},
    ["@punctuation.bracket"] = {fg = c.light_grey},
    ["@punctuation.special"] = {fg = c.special},
    ["@repeat"] = {fg = c.statements, fmt = cfg.code_style.keywords},
    ["@string"] = {fg = c.strings, fmt = cfg.code_style.strings},
    ["@string.regex"] = {fg = c.constants, fmt = cfg.code_style.strings},
    ["@string.escape"] = {fg = c.todo, fmt = cfg.code_style.strings},
    ["@symbol"] = {fg = c.builtin},
    ["@tag"] = {fg = c.tags},
    ["@tag.delimiter"] = {fg = c.tags},
    ["@tag.attribute"] = {fg = c.builtin},
    ["@text"] = {fg = c.fg},
    ["@text.strong"] = {fg = c.fg, fmt = 'bold'},
    ["@text.emphasis"] = {fg = c.fg, fmt = 'italic'},
    ["@text.underline"] = {fg = c.fg, fmt = 'underline'},
    ["@text.strike"] = {fg = c.fg, fmt = 'strikethrough'},
    ["@text.title"] = {fg = c.constants, fmt = 'bold'},
    ["@text.literal"] = {fg = c.strings},
    ["@text.uri"] = {fg = c.builtin, fmt = 'underline'},
    ["@text.todo"] = {fg = c.todo, fmt = cfg.code_style.comments},
    ["@text.math"] = {fg = c.fg},
    ["@text.reference"] = {fg = c.fg},
    ["@text.environment"] = {fg = c.fg},
    ["@text.environment.name"] = {fg = c.fg},
    ["@text.diff.add"] = {fg = c.diff_add},
    ["@text.diff.delete"] = {fg = c.diff_delete},
    ["@note"] = {fg = c.fg},
    ["@warning"] = {fg = c.fg},
    ["@danger"] = {fg = c.fg},
    ["@type"] = {fg = c.types},
    ["@type.builtin"] = {fg = c.constants},
    ["@variable"] = {fg = c.variables, fmt = cfg.code_style.variables},
    ["@variable.builtin"] = {fg = c.todo, fmt = cfg.code_style.variables}
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
