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

require('plugins')

-- copy/paste
vim.cmd[[vnoremap <leader>y "+y]]
vim.cmd[[nnoremap <leader>Y "+yg_]]
vim.cmd[[nnoremap <leader>y "+y]]
vim.cmd[[nnoremap <leader>yy "+yy]]
vim.cmd[[nnoremap <leader>p "+p]]
vim.cmd[[nnoremap <leader>P "+P]]
vim.cmd[[vnoremap <leader>p "+p]]
vim.cmd[[vnoremap <leader>P "+P]]

-- buffers 
vim.opt.hidden = true
vim.keymap.set('n', '<C-N>', '<cmd>bnext<CR>')
vim.keymap.set('n', '<C-P>', '<cmd>bprev<CR>')
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

-- colors
vim.o.background = "dark"
vim.cmd.colorscheme('vague')
