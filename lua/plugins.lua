-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use { "williamboman/mason.nvim" }
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Закрывает скобки после ENTER
  use 'rstacruz/vim-closer'

  use 'tpope/vim-commentary'

  -- autocompletion
  use 'neovim/nvim-lspconfig'    -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp'         -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'     -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip'         -- Snippets plugin
  use 'nvim-tree/nvim-web-devicons'

  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

  -- treesitter configuration
  --
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  use("nvim-treesitter/playground")

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }

  use { "folke/tokyonight.nvim" }

  use { "jiangmiao/auto-pairs" }
end)
