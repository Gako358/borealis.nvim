for k in pairs(package.loaded) do
  if k:match(".*borealis.*") then
    package.loaded[k] = nil
  end
end

require("borealis").setup()
require("borealis").colorscheme()
