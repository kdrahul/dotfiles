local map = vim.api.nvim_set_keymap

map("n", "<space>", " ", {})
vim.g.mapleader = " "
-- Quickfix movement
map("n", "<leader>j", ":cnext<CR>", { noremap = true, silent = true })
map("n", "<leader>k", ":cprev<CR>", { noremap = true, silent = true })

-- Telescope Search
map("n", "<leader>f", ":Telescope find_files<cr>", { noremap = true, silent = true })
map("n", "<leader>b", ":Telescope buffers<cr>", { noremap = true, silent = true })
map("n", "<leader>r", ":Telescope live_grep<cr>", { noremap = true, silent = true })
map("n", "<C-_>",":Telescope current_buffer_fuzzy_find<cr>", { noremap = true, silent = true })

-- Other
map("n", "H", "^", {silent = true})
map("n", "L", "$", {silent = true})

-- LSP bindings
map("n","gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true })
map("n","gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true, silent = true })
map("n","gr", "<Cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true })
map("n","gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true })
map("n","K", "<Cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true })
map("n","gn", "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {noremap = true, silent = true })
map("n","gp", "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {noremap = true, silent = true })
map("n","<leader>a", "<Cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true, silent = true })
map("n","<leader>e", "<Cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true, silent = true })


-- Formatter
map("n","<leader>s", "<Cmd>Format<CR>", {noremap = true, silent = true })

