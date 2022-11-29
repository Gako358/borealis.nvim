local M = {}
local colors = {
  dark = {
    black = "#252525",
    bg0 = "#272727", -- # Main background
    bg1 = "#262626", -- # Menus and popups
    bg2 = "#2D4F67", -- # Statusline and selector background
    fg = "#d4d4d4", -- # Main foreground
    purple = "#ff00aa",
    green = "#96E072",
    orange = "#f39c12",
    blue = "#7cb7ff",
    yellow = "#FFE66D",
    cyan = "#00e8c6",
    red = "#ee5d43",
    grey = "#5c6370",
    light_grey = "#848b98",
    dark_cyan = "#2b6f77",
    dark_red = "#993939",
    dark_yellow = "#93691d",
    dark_purple = "#f92672",
    dark_green = "#7cb75f",
    diff_add = "#31392b",
    diff_delete = "#382b2c",
    diff_change = "#1c3448",
    diff_text = "#2c5372",
  },
  light = {
    black = "#101012",
    bg0 = "#fafafa",
    bg1 = "#f0f0f0",
    bg2 = "#e6e6e6",
    fg = "#383a42",
    purple = "#a626a4",
    green = "#50a14f",
    orange = "#c18401",
    blue = "#4078f2",
    yellow = "#986801",
    cyan = "#0184bc",
    red = "#e45649",
    grey = "#a0a1a7",
    light_grey = "#818387",
    dark_cyan = "#2b5d63",
    dark_red = "#833b3b",
    dark_yellow = "#7c5c20",
    dark_purple = "#79428a",
    dark_green = "#4a6c3a",
    diff_add = "#e2fbe4",
    diff_delete = "#fce2e5",
    diff_change = "#e2ecfb",
    diff_text = "#cad3e0",
  },
}

function M.select_colors()
  local selected = { none = "none" }
  selected = vim.tbl_extend("force", selected, colors[vim.g.borealis_config.style])
  return selected
end

local c = M.select_colors()

function M.terminal_color()
  vim.g.terminal_color_0 = c.bg0
  vim.g.terminal_color_1 = c.red
  vim.g.terminal_color_2 = c.green
  vim.g.terminal_color_3 = c.yellow
  vim.g.terminal_color_4 = c.blue
  vim.g.terminal_color_5 = c.purple
  vim.g.terminal_color_6 = c.cyan
  vim.g.terminal_color_7 = c.fg
  vim.g.terminal_color_8 = c.grey
  vim.g.terminal_color_9 = c.red
  vim.g.terminal_color_10 = c.green
  vim.g.terminal_color_11 = c.yellow
  vim.g.terminal_color_12 = c.blue
  vim.g.terminal_color_13 = c.purple
  vim.g.terminal_color_14 = c.cyan
  vim.g.terminal_color_15 = c.fg
end

return M
