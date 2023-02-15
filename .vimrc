set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'jalvesaq/Nvim-R'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'ray-x/aurora'

call vundle#end()
filetype plugin indent on

" non-vundle stuff
set number
set relativenumber
syntax enable

" configuring tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab	" use tabs not spaces
set smarttab

" quality of life
set autoindent
set textwidth=80
set ignorecase
set magic
set noerrorbells
set visualbell
set t_vb=
set encoding=utf8
set ai	" auto indent
set si	" smart indent
set wrap " wraps lines
let R_assign = 0

" visual
set background=dark
colorscheme gruvbox
"colorscheme aurora
" this works in vim but not neovim
hi Normal guibg=NONE ctermbg=NONE
" highlight Normal ctermbg=none
" highlight NonText ctermbg=none
