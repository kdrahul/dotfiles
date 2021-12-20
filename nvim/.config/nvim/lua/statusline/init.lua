local line = {}

line.config = function()
  require "lualine".setup {
    options = {theme = "ayu_mirage"}
  }
end

return line
