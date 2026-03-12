" plugins
call plug#begin()
Plug 'jasonccox/vim-wayland-clipboard'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yegappan/lsp'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'nanotech/jellybeans.vim'
Plug 'lervag/vimtex', { 'tag': 'v2.15' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

set number
set relativenumber
syntax enable
let mapleader=","
set ttimeoutlen=100
set termguicolors

" 4 space tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set smarttab

" qol
set autoindent
set textwidth=80
set ignorecase
set magic
set noerrorbells
set visualbell
set t_vb=
set encoding=utf8
set si
" set wrap
set scrolloff=4
set clipboard=unnamedplus
set directory^=$HOME/.vim/tmp//
nnoremap gb :buffers<CR>:buffer<Space>

" LSP settings 
let lspOpts = #{aleSupport: v:false,
        \   autoComplete: v:true,
        \   autoHighlight: v:false,
        \   autoHighlightDiags: v:true,
        \   autoPopulateDiags: v:false,
        \   completionMatcher: 'case',
        \   completionMatcherValue: 1,
        \   diagSignErrorText: 'E>',
        \   diagSignHintText: 'H>',
        \   diagSignInfoText: 'I>',
        \   diagSignWarningText: 'W>',
        \   echoSignature: v:false,
        \   hideDisabledCodeActions: v:false,
        \   highlightDiagInline: v:false,
        \   hoverInPreview: v:false,
        \   completionInPreview: v:false,
        \   closePreviewOnComplete: v:true,
        \   ignoreMissingServer: v:false,
        \   keepFocusInDiags: v:true,
        \   keepFocusInReferences: v:true,
        \   completionTextEdit: v:false,
        \   diagVirtualTextAlign: 'below',
        \   diagVirtualTextWrap: 'truncate',
        \   noNewlineInCompletion: v:true,
        \   omniComplete: v:false,
        \   omniCompleteAllowBare: v:false,
        \   outlineOnRight: v:false,
        \   outlineWinSize: 20,
        \   popupBorder: v:true,
        \   popupBorderHighlight: 'Title',
        \   popupBorderHighlightPeek: 'Special',
        \   popupBorderSignatureHelp: v:false,
        \   popupHighlightSignatureHelp: 'Pmenu',
        \   popupHighlight: 'Normal',
        \   semanticHighlight: v:true,
        \   showDiagInBalloon: v:true,
        \   showDiagInPopup: v:true,
        \   showDiagOnStatusLine: v:false,
        \   showDiagWithSign: v:true,
        \   showDiagWithVirtualText: v:true,
        \   showInlayHints: v:false,
        \   showSignature: v:true,
        \   snippetSupport: v:false,
        \   ultisnipsSupport: v:false,
        \   useBufferCompletion: v:false,
        \   usePopupInCodeAction: v:false,
        \   useQuickfixForLocations: v:false,
        \   vsnipSupport: v:false,
        \   bufferCompletionTimeout: 100,
        \   customCompletionKinds: v:false,
        \   completionKinds: {},
        \   filterCompletionDuplicates: v:false,
        \   condensedCompletionMenu: v:false}
autocmd User LspSetup call LspOptionsSet(lspOpts)

let lspServers = [
			\ #{
			\   name: 'clangd',
			\   filetype: ['c', 'cpp'],
			\   path: '/usr/bin/clangd',
			\   args: ['--background-index']
			\ },
			\ #{
			\    name: 'golang',
			\    filetype: ['go', 'gomod'],
			\    path: '/usr/bin/gopls',
			\    args: ['serve'],
			\    syncInit: v:true
			\ },
			\ #{
			\   name: 'python',
			\   filetype: ['py'],
			\   path: '/usr/bin/pyright-langserver',
			\   args: ['--stdio']
			\ },
			\ #{
			\    name: 'rustlang',
			\    filetype: ['rust'],
			\    path: '/usr/bin/rust-analyzer',
			\    args: [],
			\    syncInit: v:true
			\ },
			\ #{
			\	name: 'zig',
			\	filetype: ['zig'],
			\	path: '/usr/bin/zls',
			\	args: [],
			\	syncInit: v:true
			\  }
			\ ]

autocmd User LspSetup call LspAddServer(lspServers)

nnoremap <c-]>		<cmd>LspGotoDefinition<cr>
nnoremap g]			<cmd>LspPeekDefinition<cr>
nnoremap <leader>xx <cmd>LspDiag show<cr>
nnoremap <leader>e	<cmd>LspDiag here<cr>

" make autocomplete popup tolerable
set completeopt=menu,menuone,popup,noinsert
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" clipboard binds
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>y "+y
vnoremap <leader>p "+p
vnoremap <leader>P "+P

ca tn tabnew

nnoremap <leader>ff :Files<CR> 
nnoremap <leader>fg :Rg<CR> 

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme = 'jellybeans'
let g:airline_powerline_fonts = 1

" vimtex config
filetype plugin indent on
let g:vimtex_view_method = 'zathura'
let maplocalleader = ","

" visual
colorscheme jellybeans 
set background=dark
" transparent background
" hi Normal guibg=NONE ctermbg=NONE
