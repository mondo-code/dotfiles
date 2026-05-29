-- general vim stuff before plugins in case plugins need anything defined
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
vim.opt.scrolloff = 4 
vim.opt.updatetime = 50
vim.opt.termguicolors = true
vim.cmd[[set mouse=]]
vim.g.mapleader = ","
-- this is the ancient mystical spell that allows me to use relative line numbers in netrw
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

require('plugins')

-- copy/paste
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+yg_')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>yy', '"+yy')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')
vim.keymap.set('v', '<leader>p', '"+p')
vim.keymap.set('v', '<leader>P', '"+P')

-- buffers 
vim.opt.hidden = true
vim.keymap.set('n', '<C-L>', '<cmd>bnext<CR>')
vim.keymap.set('n', '<C-H>', '<cmd>bprev<CR>')
vim.keymap.set('n', '<C-W>d', '<cmd>bd<CR>')

-- LSP stuff
vim.lsp.enable({
	"pyright",
	"lua_ls",
	"clangd",
	"gopls",
	"v-analyzer",
	"rust-analyzer",
	"zls"
})

vim.diagnostic.config({
    virtual_lines = true,
    -- virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})

-- colors/visual stuff
vim.o.background = "dark"
require('transparent').clear_prefix('lualine')
vim.cmd.colorscheme('jellybeans')
