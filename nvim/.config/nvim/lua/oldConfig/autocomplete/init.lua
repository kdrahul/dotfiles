--if not package.loaded['compe'] then
--   return
-- end

local M = {}

-- vim.g.vsnip_snippet_dir = O.vnsip_dir

M.config = function()
  opt = {
    enabled = O.auto_complete,
    autocomplete = true,
    debug = true,
    min_length = 1,
    preselect = "enable",
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
    source = {
      path = {kind = "   (Path)"},
      buffer = {kind = "   (Buffer)"},
      calc = {kind = "   (Calc)"},
      nvim_lsp = {kind = "   (LSP)"},
      nvim_lua = {kind = "  "},
      nvim_lua = true,
      tags = false,
      treesitter = {kind = " "}
    }
  }

  require("compe").setup(opt)

  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local check_back_space = function()
    local col = vim.fn.col "." - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match "%s" then
      return true
    else
      return false
    end
  end

  vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {noremap = true, silent = true, expr = true})
  vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", {noremap = true, silent = true, expr = true})
  vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", {noremap = true, silent = true, expr = true})
  vim.api.nvim_set_keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", {noremap = true, silent = true, expr = true})
  vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {noremap = true, silent = true, expr = true})
end

return M
