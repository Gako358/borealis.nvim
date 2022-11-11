local c = require('borealis.colors')
local cfg = vim.g.borealis_config
local colors = {
  bg = c.bg0,
  fg = c.fg,
  red = c.red,
  green = c.green,
  yellow = c.yellow,
  blue = c.blue,
  purple = c.purple,
  cyan = c.cyan,
  gray = c.grey
}

local borealis = {
  inactive = {
    a = { fg = colors.gray, bg = colors.bg, gui = 'bold' },
    b = { fg = colors.gray, bg = colors.bg },
    c = { fg = colors.gray, bg = cfg.lualine.transparent and c.none or c.bg1 },
  },
  normal = {
    a = { fg = colors.bg, bg = colors.blue, gui = 'bold' },
    b = { fg = colors.fg, bg = c.bg3 },
    c = { fg = colors.gray, bg = cfg.lualine.transparent and c.none or c.bg1 },
  },
  visual = { a = { fg = colors.bg, bg = colors.purple, gui = 'bold' } },
  replace = { a = { fg = colors.bg, bg = colors.red, gui = 'bold' } },
  insert = { a = { fg = colors.bg, bg = colors.green, gui = 'bold' } },
  command = { a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' } },
  terminal = { a = { fg = colors.bg, bg = colors.cyan, gui = 'bold' } },
}
return borealis;
