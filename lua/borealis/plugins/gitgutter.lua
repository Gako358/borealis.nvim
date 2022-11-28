local M = {}
local c = require('borealis.colors')

M.highlights = {
  GitGutterAdd = { fg = c.green },
  GitGutterChange = { fg = c.blue },
  GitGutterDelete = { fg = c.red },
}

return M
