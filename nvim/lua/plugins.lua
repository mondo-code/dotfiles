-- plugin installations
vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/lervag/vimtex" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/xiyaowong/transparent.nvim" },
	{ src = "https://github.com/vague-theme/vague.nvim" }
})
vim.g.vimtex_view_method = "zathura"
vim.pack.add({
    { src = "https://github.com/ibhagwan/fzf-lua" },
})

local actions = require('fzf-lua.actions')
require('fzf-lua').setup({
    winopts = { backdrop = 85 },
    keymap = {
        builtin = {
            ["<C-f>"] = "preview-page-down",
            ["<C-b>"] = "preview-page-up",
            ["<C-p>"] = "toggle-preview",
        },
        fzf = {
            ["ctrl-a"] = "toggle-all",
            ["ctrl-t"] = "first",
            ["ctrl-g"] = "last",
            ["ctrl-d"] = "half-page-down",
            ["ctrl-u"] = "half-page-up",
        }
    },
    actions = {
        files = {
            ["ctrl-q"] = actions.file_sel_to_qf,
            ["enter"]  = actions.file_edit_or_qf,
        }
    }
})

-- trouble, snippets, cmp
vim.pack.add({
	{ src = "https://github.com/folke/trouble.nvim" },
    { src = "https://github.com/hrsh7th/nvim-cmp.git" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp.git" },
    { src = "https://github.com/hrsh7th/cmp-buffer.git" },
	{ src = "https://github.com/L3MON4D3/LuaSnip.git" },
})

local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
    },
    experimental = { ghost_text = true },
})

-- lualine
vim.pack.add({
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/akinsho/bufferline.nvim" }
})
require("lualine").setup({
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		-- lualine_y = {'progress'},
		lualine_y = {
			function()
				return vim.fn.line('.') .. '/' .. vim.fn.line('$')
			end
		},
		lualine_z = {'location'}
	},
})
require("bufferline").setup({
	options = { show_buffer_close_icons = false, }
})

vim.api.nvim_create_user_command("PackUpdate", function()
  require("vim.pack").update()
end, { desc = "Update all plugins using vim.pack" })

-- fzf 
vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<CR>')
vim.keymap.set('n', '<leader>fg', '<cmd>FzfLua live_grep<CR>')

-- trouble
require("trouble").setup({})
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",        { desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>",{ desc = "Symbols (Trouble)" })
vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions / references / ..." })
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>",            { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",             { desc = "Quickfix List (Trouble)" })
