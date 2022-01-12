DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERM"

O = {
  auto_close_tree = 0,
  auto_complete = true,
  hidden_files = true,
  wrap_lines = false,
  number = true,
  relative_number = true,
  cursorline = false,
  shell = "dash",
  timeoutlen = 100,
  background = "dark",
  nvim_tree_disable_netrw = 0,
  statusline = 0,
  ignore_case = true,
  smart_case = true,
  hl_search = false,
  transparent_window = false,
  leader_key = "space",
  -- @usage pass a table with your desired languages
  treesitter = {
    ensure_installed = "all",
    ignore_install = {"haskell"},
    highlight = {enabled = true},
    rainbow = {enabled = false}
  },
  plugin = {
    hop = {active = false},
    tabnine = {active = false}
  },
}
