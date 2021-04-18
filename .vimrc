" Run :PlugInstall to install plugins

set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Plugins stored in ~/.vim/plugged
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'vim-airline/vim-airline'
Plug 'Rykka/riv.vim'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Initialize plugin system
call plug#end()

syntax on

"colo darkblue

"""""""""""""""""
" Sane Defaults "
"""""""""""""""""
set scrolloff=5
set number relativenumber
set foldlevel=99
set shiftwidth=2
set autoindent
set smartindent

" Configure vim Airline
set laststatus=2

let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" Configure Vim.FZF
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }

" Set 2 space indent for YAML files
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

autocmd FileType rst
    \ set maxmempattern=2000
