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
  if vim.o.background == "light" then
    M.set_option("style", "light")
  elseif vim.g.borealis_config.style == "light" then
    M.set_option("style", "dark")
  end
  require("borealis.highlights").setup()
end

local default_config = {
  style = "dark",
  transparent = false,
  term_colors = true,
  ending_tildes = false,
  cmp_itemkind_reverse = false,

  -- Formats
  code_style = {
    comments = "italic",
    functions = "italic",
    keywords = "none",
    strings = "italic",
    variables = "none",
  },

  -- Plugins Related
  diagnostics = {
    darker = false,
    undercurl = false,
    background = false,
  },
}

--- Setup borealis
function M.setup()
  if not vim.g.borealis_config or not vim.g.borealis_config.loaded then
    vim.g.borealis_config = vim.tbl_deep_extend("keep", vim.g.borealis_config or {}, default_config)
    M.set_option("loaded", true)
  end
end

function M.load()
  vim.api.nvim_command('colorscheme borealis')
end

return M
