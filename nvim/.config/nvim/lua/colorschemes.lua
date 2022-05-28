-- require('colorbuddy').colorscheme('gruvbuddy')

-- local colorscheme = "gruvbuddy"

-- require('colorbuddy').colorscheme('nvim_colors')
--
-- local colorscheme = "nvim_colors"

require('colorbuddy').colorscheme('onebuddy')

local colorscheme = "onebuddy"

vim.g.tokyonight_style = "night"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
