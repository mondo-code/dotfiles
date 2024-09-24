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
	'Mofiqul/dracula.nvim',
	'navarasu/onedark.nvim',
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
	{
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup {
			}
		end,
		dependencies = { {'nvim-tree/nvim-web-devicons'}}
	},
	'VonHeikemen/lsp-zero.nvim',
	'andweeb/presence.nvim',
})

require('mason').setup()
require('mason-lspconfig').setup()
require('lsp-zero')
require('lspconfig').pylsp.setup({})
require('lspconfig').clangd.setup({})
require('lspconfig').rust_analyzer.setup({})

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
