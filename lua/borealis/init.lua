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
  require("borealis.theme").setup()
  require("borealis.config").terminal_color()
end

function M.toggle()
  if vim.g.borealis_config.style == "light" then
    M.set_option("style", "dark")
    vim.o.background = "dark"
  else
    M.set_option("style", "light")
    vim.o.background = "light"
  end
  vim.api.nvim_command("colorscheme borealis")
end

local default_config = {
  style = "dark",
  toggle_style = "<c-t>",

  code_style = {
    comments = "italic",
    functions = "italic",
    keywords = "none",
    strings = "italic",
    variables = "none",
  },
}

--- Setup borealis
function M.setup()
  if not vim.g.borealis_config or not vim.g.borealis_config.loaded then
    vim.g.borealis_config = vim.tbl_deep_extend("keep", vim.g.borealis_config or {}, default_config)
    M.set_option("loaded", true)
  end

  if vim.g.borealis_config.toggle_style then
    vim.api.nvim_set_keymap('n', vim.g.borealis_config.toggle_style, '<cmd>lua require("borealis").toggle()<cr>',
      { noremap = true, silent = true })
  end
end

function M.load()
  vim.api.nvim_command('colorscheme borealis')
end

return M
