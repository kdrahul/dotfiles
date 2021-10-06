-- require("ayu").setup(
--   {
--     -- themeStyle = "dark", -- Because Dark is defaiult
--     -- @values : NONE, Italic
--     commentStyle = "italic",
--     functionStyle = "bold",
--     keywordStyle = "NONE"
--   }
-- )
--
-- require('onedark').setup({
--     commentStyle = "italic",
--     functionStyle = "bold",
--     keywordStyle = "NONE",
--     colors = {bg = "#222222"},
-- })
--
-- require "night"

-- Nightfox Theme
local nightfox = require('nightfox')

nightfox.setup({
    fox = "nightfox"
})

nightfox.load()
