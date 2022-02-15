require("plugins")
require("default-config")
require("settings")
require("keymaps")

require("nvim-treesitter.configs").setup{highlight = {enable = true}}

require("lsp")
require("snips")
require("popup")
require("templates")
require("colorschemes")
-- require('statusline')
-- vim.cmd("colo ayu-mirage")
