set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'jiangmao/auto-pairs'
Plugin 'jalvesaq/Nvim-R'
Plugin 'tpope/vim-commentary'
Plugin 'nvim-treesitter/nvim-treesitter'
Plugin 'folke/tokyonight.nvim'
Plugin 'xiyaowong/nvim-transparent'
Plugin 'nvim-tree/nvim-tree.lua'
Plugin 'nvim-tree/nvim-web-devicons'
Plugin 'preservim/nerdcommenter'
Plugin 'hrsh7th/nvim-cmp'

call vundle#end()
filetype plugin indent on

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

" visual
set background=dark
colorscheme tokyonight-night
highlight Normal ctermbg=none
highlight NonText ctermbg=none

let R_assign = 0
