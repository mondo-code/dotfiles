-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'navarasu/onedark.nvim'
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},         -- Required
		  {'hrsh7th/cmp-nvim-lsp'},     -- Required
		  {'hrsh7th/cmp-buffer'},       -- Optional
		  {'hrsh7th/cmp-path'},         -- Optional
		  {'saadparwaiz1/cmp_luasnip'}, -- Optional
		  {'hrsh7th/cmp-nvim-lua'},     -- Optional

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},             -- Required
		  {'rafamadriz/friendly-snippets'}, -- Optional
	  }
  }
  use {
	  'nvim-tree/nvim-tree.lua',
	  requires = {
		  'nvim-tree/nvim-web-devicons', -- optional, for file icons
	  },
	  tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use {
	  'numToStr/Comment.nvim',
	  config = function()
		  require('Comment').setup()
	  end
  }
  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'mfussenegger/nvim-dap'
  use({
	  "kylechui/nvim-surround",
	  tag = "*", -- Use for stability; omit to use `main` branch for the latest features
	  config = function()
		  require("nvim-surround").setup({
			  -- Configuration here, or leave empty to use defaults
		  })
	  end
  })
  use {
	  "folke/trouble.nvim",
	  requires = "nvim-tree/nvim-web-devicons",
	  config = function()
		  require("trouble").setup {
			  -- your configuration comes here
			  -- or leave it empty to use the default settings
			  -- refer to the configuration section below
		  }
	  end
  }
end)
