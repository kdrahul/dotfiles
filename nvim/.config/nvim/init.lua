require("default-config")
require("settings")
require("plugins")
require("keymaps")

require("nvim-treesitter.configs").setup {highlight = {enable = true}}

require("lsp")
require("kd-colors/night")

require("snips")
