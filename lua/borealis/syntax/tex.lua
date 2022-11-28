local M = {}
local c = require('borealis.colors')
local colors = require('borealis.config').colors
local cfg = vim.g.borealis_config

M.highlights = {
  latexTSInclude         = colors.Blue,
  latexTSFuncMacro       = { fg = c.fg, fmt = cfg.code_style.functions },
  latexTSEnvironment     = { fg = c.cyan, fmt = "bold" },
  latexTSEnvironmentName = colors.Yellow,
  texCmdEnv              = colors.Cyan,
  texEnvArgName          = colors.Yellow,
  latexTSTitle           = colors.Green,
  latexTSType            = colors.Blue,
  latexTSMath            = colors.Orange,
  texMathZoneX           = colors.Orange,
  texMathZoneXX          = colors.Orange,
  texMathDelimZone       = colors.LightGrey,
  texMathDelim           = colors.Purple,
  texMathOper            = colors.Red,
  texCmd                 = colors.Purple,
  texCmdPart             = colors.Blue,
  texCmdPackage          = colors.Blue,
  texPgfType             = colors.Yellow,
}

return M
