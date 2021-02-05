execute pathogen#infect()
syntax on
filetype plugin indent on

colo darkblue

"""""""""""""""""
" Sane Defaults "
"""""""""""""""""
set scrolloff=5
set number relativenumber

" Configuration vim Airline
set laststatus=2

let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" Configuration NERDTree
map <F5> :NERDTreeToggle<CR>

" Configuration floaterm
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9

" Configuration Vim.FZF
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }

" Set 2 space indent for YAML files
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
