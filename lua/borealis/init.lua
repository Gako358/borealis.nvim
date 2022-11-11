local M = {}

---Change borealis option (vim.g.borealis_config.option)
---@param opt string: option name
---@param value any: new value
function M.set_option(opt, value)
  local cfg = vim.g.borealis_config
  cfg[opt] = value
  vim.g.borealis_config = cfg
end

--- Apply borealis theme
function M.colorscheme()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "borealis"

  require("borealis.highlights").setup()
  require("borealis.terminal").setup()

end

local default_config = {
  style = "dark",
  transparent = false,            -- transparent background
  term_colors = true,             -- 24-bit terminal colors
  ending_tildes = false,          -- show end of buffer ending_tildes
  cmp_itemkind_reverse = false,   -- reverse cmp itemkind

  -- Formats
  code_style = {
    comments = "italic",
    functions = "italic",
    keywords = "none",
    strings = "none",
    variables = "none",
  },

  lualine = {
    transparent = false,
  },

  -- Plugins Related
  diagnostic = {
    darker = false,
    undercurl = false,
    background = "false",
  },
}
