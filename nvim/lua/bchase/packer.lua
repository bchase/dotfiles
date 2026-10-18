-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
      {'hrsh7th/cmp-nvim-lua'},
      {'hrsh7th/cmp-nvim-lsp-signature-help'},
      {'hrsh7th/cmp-vsnip'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/vim-vsnip'},
    }
  }
  use({ "elixir-tools/elixir-tools.nvim", tag = "stable", requires = { "nvim-lua/plenary.nvim" }})

  -- use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  -- use {
  --   'nvim-treesitter/nvim-treesitter',
  --   run = ':TSUpdate'
  -- }
  use {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- use({
  --   'rose-pine/neovim',
  --   as = 'rose-pine',
  --   config = function()
  --     vim.cmd('colorscheme rose-pine')
  --   end
  -- })
  use {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  }

  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  -- use('simrat39/rust-tools.nvim')
  -- use { 'mrcjkb/rustaceanvim', version = '^5', ft = { 'rust' } }
  -- use {
  --   'mrcjkb/rustaceanvim',
  --   version = '^5',
  --   ft = { 'rust' }
  --   -- ,
  --   -- config = function()
  --   --   vim.g.rustaceanvim = {
  --   --     server = {
  --   --       default_settings = {
  --   --         ['rust-analyzer'] = {
  --   --           procMacro = {
  --   --             enable = true,
  --   --           },
  --   --           cargo = {
  --   --             loadOutDirsFromCheck = true,
  --   --           },
  --   --         },
  --   --       },
  --   --     },
  --   --   }
  --   -- end
  -- }

  use('puremourning/vimspector')
end)
