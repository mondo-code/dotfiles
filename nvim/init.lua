require("config.lazy")
require("config.lsp")

-- normal vim stuff
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

-- copy/paste
vim.cmd[[vnoremap <leader>y "+y]]
vim.cmd[[nnoremap <leader>Y "+yg_]]
vim.cmd[[nnoremap <leader>y "+y]]
vim.cmd[[nnoremap <leader>yy "+yy]]
vim.cmd[[nnoremap <leader>p "+p]]
vim.cmd[[nnoremap <leader>P "+P]]
vim.cmd[[vnoremap <leader>p "+p]]
vim.cmd[[vnoremap <leader>P "+P]]

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- transparent background
vim.cmd([[
augroup TransparentBackground
autocmd!
autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
autocmd ColorScheme * highlight NonText ctermbg=none guibg=none
augroup END
]])

-- colors
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
