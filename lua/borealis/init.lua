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
  transparent = false, -- transparent background
  term_colors = true, -- 24-bit terminal colors
  ending_tildes = false, -- show end of buffer ending_tildes
  cmp_itemkind_reverse = false, -- reverse cmp itemkind

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

--- Setup borealis
---@param opts table: table with options
function M.setup(opts)
  --- if no options are passed, use default config
  --- if it is the first time, create default config
  if not vim.g.borealis_config or not vim.g.borealis_config.loaded then
    vim.g.borealis_config = vim.tbl_deep_extend("keep", vim.g.borealis_config or {}, default_config)
    M.set_option("loaded", true)
    M.set_option("style", "dark")
  end
  if opts then
    vim.g.borealis_config = vim.tbl_deep_extend("force", vim.g.borealis_config, opts)
    if opts.style then
      M.set_option("style", opts.style)
    end
  end
end

function M.load()
  vim.api.nvim_command('colorscheme borealis')
end

return M
