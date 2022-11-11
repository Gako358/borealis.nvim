local M = {}

---Change borealis option (vim.g.borealis_config.option)
---It can't be changed directly by modifing that field due to a Neovim lua bug with global variables (borealis_config is a global variable)
---@param opt string: option name
---@param value any: new value
function M.set_option(opt, value)
  local cfg = vim.g.borealis_config
  cfg[opt] = value
  vim.g.borealis_config = cfg
end
