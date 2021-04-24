" Run :PlugInstall to install plugins

set nocompatible              " be iMproved, required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Plugins stored in ~/.vim/plugged
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Make a nice statusbar
Plug 'vim-airline/vim-airline'

" ReStructured Text support
Plug 'gu-fan/riv.vim'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Personal wiki and note-taking
Plug 'mattn/calendar-vim'
Plug 'vimwiki/vimwiki'

" nord-vim colorscheme
Plug 'arcticicestudio/nord-vim'

" Initialize plugin system
call plug#end()

syntax on

colorscheme nord

"""""""""""""""""
" Sane Defaults "
"""""""""""""""""
set autoindent
set expandtab
set foldlevel=99
set number relativenumber
set scrolloff=5
set shiftwidth=2
set smartindent
set softtabstop=2
set tabstop=2

" Configure vim Airline
" Always show a status line
set laststatus=2

" Display all buffers when only one tab is open
let g:airline#extensions#tabline#enabled=1

" Use powerline fonts in the statusline
let g:airline_powerline_fonts=1

" Configure Vim.FZF
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }


" Configure vimwiki
let wiki_1 = {}
let wiki_1.path = '~/vimwiki/personal/'
let wiki_1.html_template = '~/public_html/template.tpl'
let wiki_1.syntax= 'markdown'
let wiki_1.ext= 'md'
let wiki_1.index = 'index'
let wiki_1.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'markdown':'md'}
let wiki_2 = {}
let wiki_2.path = '~/vimwiki/tech/'
let wiki_2.syntax= 'markdown'
let wiki_2.ext= 'md'
let wiki_2.index = 'index'
let wiki_2.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'markdown':'md'}
let g:vimwiki_list = [wiki_1, wiki_2]

" vimwiki w/calendar
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
:autocmd FileType vimwiki map c :call ToggleCalendar()


" Set 2 space indent for YAML files
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType yml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

autocmd FileType rst set maxmempattern=2000

" enable spellcheck for some file types
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us complete+=kspell
autocmd BufRead,BufNewFile *.rst setlocal spell spelllang=en_us complete+=kspell
autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us complete+=kspell
autocmd FileType gitcommit setlocal spell spelllang=en_us
