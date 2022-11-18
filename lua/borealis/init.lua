local M = {}

-- M.styles = {
--   'dark',
--   'light'
-- }

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

function M.toggle()
  local index = vim.g.borealis_config.toggle_style_index + 1
  if index > #vim.g.borealis_config.toggle_style_list then index = 1 end
  M.set_option("style", vim.g.borealis_config.toggle_style_list[index])
  M.set_option("toggle_style_index", index)
  if vim.g.borealis_config.style == "light" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
  vim.api.nvim_command("colorscheme borealis")
end

local default_config = {
  style = "dark",
  -- toggle_style_key = nil,
  -- toggle_style_list = M.styles,
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

  colors = {},
  highlights = {},

  lualine = {
    transparent = false,
  },

  -- Plugins Related
  diagnostics = {
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
    --M.set_option("toggle_style_index", 0)
  end
  if opts then
    vim.g.borealis_config = vim.tbl_deep_extend("force", vim.g.borealis_config, opts)
    --if opts.toggle_style_list then
    --  M.set_option("toggle_style_list", opts.toggle_style_list)
    --end
  end
  -- if vim.g.borealis_config.toggle_style_key then
  --   vim.api.nvim_set_keymap("n", vim.g.borealis_config.toggle_style_key, "<cmd>lua require('borealis').toggle()<CR>", { noremap = true, silent = true })
  -- end
end

function M.load()
  vim.api.nvim_command('colorscheme borealis')
end

return M
