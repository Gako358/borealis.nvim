local M = {}
---Change borealis option (vim.g.borealis_config.option)
---@param opt string: option name
---@param value any: new value
function M.set_option(opt, value)
  local cfg = vim.g.borealis_config
  cfg[opt] = value
  vim.g.borealis_config = cfg
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

M.default_config = {
  style = "dark",
  toggle_style = "<c-s>",

  code_style = {
    comments = "italic",
    functions = "italic",
    keywords = "none",
    strings = "italic",
    variables = "none",
  },
}

return M
