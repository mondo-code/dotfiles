-- setup must be called before loading
-- onedark
require('onedark').setup
{
	style = 'dark'
}
require('onedark').load()
-- Set transparent background with transparent.nvim
require("transparent").setup({
  groups = { -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLineNr', 'EndOfBuffer',
  },
  extra_groups = {}, -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
})
-- this vim command kind of works
-- vim.cmd [[
-- hi Normal guibg=NONE ctermbg=NONE
-- hi NvimTreeNormal guibg=NONE ctermbg=NONE
-- hi! LualineNormal guibg=NONE
-- hi! LualineInsert guibg=NONE
-- hi! LualineVisual guibg=NONE
-- hi! LualineReplace guibg=NONE
-- hi! LualineCommand guibg=NONE
-- ]]
