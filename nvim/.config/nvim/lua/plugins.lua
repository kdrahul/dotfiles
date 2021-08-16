local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end
packer.init {
  compile_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "plugin", "packer_compiled.vim"),
  git = {clone_timeout = 300},
  display = {
    open_fn = function()
      return require("packer.util").float {border = "single"}
    end
  }
}
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(
  function(use)
    use "wbthomason/packer.nvim"

    -- -- Telescope
    use {"nvim-lua/popup.nvim"}
    use {"nvim-lua/plenary.nvim"}
    use {"tjdevries/astronauta.nvim"}
    -- use {
    --   "nvim-telescope/telescope.nvim",
    --   config = [[require('thescope')]],
    --   cmd = "Telescope"
    -- }
    use {"neovim/nvim-lspconfig"}
    use {"glepnir/lspsaga.nvim"}
    use {"kabouzeid/nvim-lspinstall"}
    use {
      "hrsh7th/nvim-compe",
      config = function()
        require("autocomplete").config()
      end
    }

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    -- Language addons
    use {"rust-lang/rust.vim"}
    use {"mhartington/formatter.nvim"}

    -- Markdown Preview
    -- use {"iamcco/markdown-preview.nvim", run = "-> mkdp#utils#install"}
    use {"iamcco/markdown-preview.nvim"}

    -- Status Line
    -- use {
    --   "hoob3rt/lualine.nvim",
    --   config = function()
    --     require("statusline").config()
    --   end
    -- }

    -- fzf
    use {"junegunn/fzf", dir = "~/.fzf", run = "./install --all"}
    use {"junegunn/fzf.vim"}

    -- Colorscheme
    use {"Shatur/neovim-ayu"}
    use {"yonlu/omni.vim"}
    use {"L3MON4D3/LuaSnip"}
    -- Commenter
    -- use {'tpope/vim-commentary'}
    use "terrortylor/nvim-comment"
  end
)
