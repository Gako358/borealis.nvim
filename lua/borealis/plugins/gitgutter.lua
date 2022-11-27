local c = require('borealis.colors')

local M = {}

M.gitgutter = {
  GitGutterAdd = { fg = c.green },
  GitGutterChange = { fg = c.blue },
  GitGutterDelete = { fg = c.red },
}

return M
