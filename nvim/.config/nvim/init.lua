require("default-config")
require("settings")
require("plugins")
require("keymaps")

require("nvim-treesitter.configs").setup{highlight = {enable = true}}

require("lsp")
-- require("kd-colors")
require("snips")
require("popup")
require("templates")
vim.cmd("colo ayu-mirage")
