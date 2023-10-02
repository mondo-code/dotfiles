" plugins
call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'tpope/vim-commentary'
call plug#end()

set number
set relativenumber
syntax enable

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

" visual
set background=dark
hi Normal guibg=NONE ctermbg=NONE
