local colors = require('borealis.palette')

local function select_colors()
  local selected = { none = "none" }
  selected = vim.tbl_extend("force", selected, colors[vim.g.borealis_config.style])
  return selected
end

return select_colors()
