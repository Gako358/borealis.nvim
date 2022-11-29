local M = {}
local config = require("borealis.config")

--- Apply borealis theme
function M.colorscheme()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "borealis"
  if vim.o.background == "light" then
    config.set_option("style", "light")
  elseif vim.g.borealis_config.style == "light" then
    config.set_option("style", "dark")
  end
  require("borealis.theme").setup()
  require("borealis.colors").terminal_color()
end

--- Setup borealis
function M.setup()
  if not vim.g.borealis_config or not vim.g.borealis_config.loaded then
    vim.g.borealis_config = vim.tbl_deep_extend("keep", vim.g.borealis_config or {}, config.default_config)
    config.set_option("loaded", true)
  end

  if vim.g.borealis_config.toggle_style then
    vim.api.nvim_set_keymap('n', vim.g.borealis_config.toggle_style, '<cmd>lua require("borealis.config").toggle()<cr>',
      { noremap = true, silent = true })
  end
end

function M.load()
  vim.api.nvim_command('colorscheme borealis')
end

return M
