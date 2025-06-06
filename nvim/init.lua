-- plugins using lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{'nvim-telescope/telescope.nvim'},
	'nvim-treesitter/nvim-treesitter',
	'nvim-tree/nvim-web-devicons',
	'numToStr/Comment.nvim',
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{'folke/trouble.nvim',
		config = function()
			require("trouble").setup {}
		end
	},
	'xiyaowong/transparent.nvim',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
	'L3MON4D3/luasnip',
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true},
	'navarasu/onedark.nvim',
	{
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup {
			}
		end,
		dependencies = { {'nvim-tree/nvim-web-devicons'}}
	},
	'andweeb/presence.nvim',
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	},
	'nvim-tree/nvim-tree.lua',
	'ziglang/zig.vim',
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- setups for specific LSPs are in ./after/plugin/lsp.lua

require('mason').setup()
require('mason-lspconfig').setup()
require("nvim-tree").setup()

-- copy binds
-- i know this is lazy but i don't care
vim.cmd[[vnoremap <leader>y "+y]]
vim.cmd[[nnoremap <leader>Y "+yg_]]
vim.cmd[[nnoremap <leader>y "+y]]
vim.cmd[[nnoremap <leader>yy "+yy]]

-- paste binds
vim.cmd[[nnoremap <leader>p "+p]]
vim.cmd[[nnoremap <leader>P "+P]]
vim.cmd[[vnoremap <leader>p "+p]]
vim.cmd[[vnoremap <leader>P "+P]]

-- general vim options
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false 
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.termguicolors = true
vim.cmd[[set mouse=]]

-- trouble keybinds
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)
