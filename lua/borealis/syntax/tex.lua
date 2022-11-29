local M = {}
local c = require("borealis.colors").select_colors()

M.highlights = {
  latexTSInclude         = { fg = c.blue },
  latexTSFuncMacro       = { fg = c.fg, fmt = "italic" },
  latexTSEnvironment     = { fg = c.cyan, fmt = "bold" },
  latexTSEnvironmentName = { fg = c.yellow, fmt = "bold" },
  texCmdEnv              = { fg = c.cyan },
  texEnvArgName          = { fg = c.yellow },
  latexTSTitle           = { fg = c.green },
  latexTSType            = { fg = c.blue },
  latexTSMath            = { fg = c.orange },
  texMathZoneX           = { fg = c.orange },
  texMathZoneXX          = { fg = c.orange },
  texMathDelimZone       = { fg = c.light_grey },
  texMathDelim           = { fg = c.purple },
  texMathOper            = { fg = c.red },
  texCmd                 = { fg = c.purple },
  texCmdPart             = { fg = c.blue },
  texCmdPackage          = { fg = c.blue },
  texPgfType             = { fg = c.yellow },
}

return M
