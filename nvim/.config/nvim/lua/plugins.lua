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

    -- Telescope
    use {"nvim-lua/popup.nvim"}
    use {"nvim-lua/plenary.nvim"}
    -- use {"tjdevries/astronauta.nvim"}
    use {"neovim/nvim-lspconfig",'williamboman/nvim-lsp-installer'}
    use {"glepnir/lspsaga.nvim"}

    -- Popup Stuff
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/nvim-cmp"
    use "saadparwaiz1/cmp_luasnip"
    use "onsails/lspkind-nvim"

    -- use {
    --   "hrsh7th/nvim-compe",
    --   config = function()
    --     require("autocomplete").config()
    --   end
    -- }

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    -- Language addons
    use {"rust-lang/rust.vim"}
    use {"mhartington/formatter.nvim"}

    -- Markdown Preview
    use {
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function()
        vim.g.mkdp_filetypes = {"markdown"}
      end,
      ft = {"markdown"}
    }

    -- Status Line
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- FZF
    use {"junegunn/fzf", dir = "~/.fzf", run = "./install --all"}
    use {"junegunn/fzf.vim"}

    -- Colorscheme

    use "tjdevries/colorbuddy.vim"
    use "tjdevries/gruvbuddy.nvim"
    use 'Th3Whit3Wolf/onebuddy'
    use 'bbenzikry/snazzybuddy.nvim'
    use 'kdrahul/nvim_colors'
    use {"Shatur/neovim-ayu"}
    use {"L3MON4D3/LuaSnip"}
    use {"EdenEast/nightfox.nvim"}
    use "shaunsingh/nord.nvim"
    use "projekt0n/github-nvim-theme"
    use "rafamadriz/neon"
    use 'folke/tokyonight.nvim'
    use { 'rktjmp/lush.nvim' }

    -- Commenter
    use "terrortylor/nvim-comment"
  end
)
