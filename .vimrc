" plugins
call plug#begin()
Plug 'jasonccox/vim-wayland-clipboard'
Plug 'yegappan/lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

set number
set relativenumber
syntax enable
let mapleader=","
set ttimeoutlen=100

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
set wrap
set scrolloff=4
set clipboard=unnamedplus

" LSP settings 
let lspOpts = #{aleSupport: v:false,
        \   autoComplete: v:true,
        \   autoHighlight: v:true,
        \   autoHighlightDiags: v:true,
        \   autoPopulateDiags: v:true,
        \   completionMatcher: 'case',
        \   completionMatcherValue: 1,
        \   diagSignErrorText: 'E>',
        \   diagSignHintText: 'H>',
        \   diagSignInfoText: 'I>',
        \   diagSignWarningText: 'W>',
        \   echoSignature: v:false,
        \   hideDisabledCodeActions: v:false,
        \   highlightDiagInline: v:true,
        \   hoverInPreview: v:false,
        \   completionInPreview: v:false,
        \   closePreviewOnComplete: v:true,
        \   ignoreMissingServer: v:false,
        \   keepFocusInDiags: v:true,
        \   keepFocusInReferences: v:true,
        \   completionTextEdit: v:true,
        \   diagVirtualTextAlign: 'above',
        \   diagVirtualTextWrap: 'default',
        \   noNewlineInCompletion: v:false,
        \   omniComplete: v:null,
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
        \   showDiagWithVirtualText: v:false,
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
			\ 
			\	#{
			\    name: 'rustlang',
			\    filetype: ['rust'],
			\    path: '/usr/bin/rust-analyzer',
			\    args: [],
			\    syncInit: v:true
			\  }
			\ ]

autocmd User LspSetup call LspAddServer(lspServers)

nnoremap <c-]>		<cmd>LspGotoDefinition<cr>
nnoremap g]			<cmd>LspPeekDefinition<cr>
nnoremap <leader>xx <cmd>LspDiag show<cr>
nnoremap <leader>e	<cmd>LspDiag here<cr>

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

" visual
" colorscheme sorbet 
colorscheme retrobox
set background=dark
hi Normal guibg=NONE ctermbg=NONE
