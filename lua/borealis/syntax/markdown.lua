local M = {}
local c = require("borealis.colors").select_colors()

M.highlights = {
  markdownBlockquote = { fg = c.gray },
  markdownBold = { fg = c.none, fmt = "bold" },
  markdownBoldDelimiter = { fg = c.grey, fmt = "bold" },
  markdownCode = { fg = c.green },
  markdownCodeBlock = { fg = c.green },
  markdownCodeDelimiter = { fg = c.yellow },
  markdownH1 = { fg = c.red, fmt = "bold" },
  markdownH2 = { fg = c.purple, fmt = "bold" },
  markdownH3 = { fg = c.orange, fmt = "bold" },
  markdownH4 = { fg = c.red, fmt = "bold" },
  markdownH5 = { fg = c.purple, fmt = "bold" },
  markdownH6 = { fg = c.orange, fmt = "bold" },
  markdownHeadingDelimiter = { fg = c.grey },
  markdownHeadingRule = { fg = c.grey },
  markdownId = { fg = c.yellow },
  markdownIdDeclaration = { fg = c.red },
  markdownItalic = { fg = c.none, fmt = "italic" },
  markdownItalicDelimiter = { fg = c.grey, fmt = "italic" },
  markdownLinkDelimiter = { fg = c.grey },
  markdownLinkText = { fg = c.red },
  markdownLinkTextDelimiter = { fg = c.grey },
  markdownListMarker = { fg = c.red },
  markdownOrderedListMarker = { fg = c.red },
  markdownRule = { fg = c.purple },
  markdownUrl = { fg = c.blue, fmt = "underline" },
  markdownUrlDelimiter = { fg = c.grey },
  markdownUrlTitleDelimiter = { fg = c.green },
}

return M
