" Run :PlugInstall to install plugins

set nocompatible              " be iMproved, required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Plugins stored in ~/.vim/plugged
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Use sensible defaults
Plug 'tpope/vim-sensible'

" Helpful key bindings
Plug 'tpope/vim-unimpaired'

" Make a nice statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ReStructured Text support
Plug 'gu-fan/riv.vim'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Personal wiki and note-taking
Plug 'mattn/calendar-vim'
Plug 'vimwiki/vimwiki'

" Vim-zettel - add-on to make vimwiki act as a zettelkasten
Plug 'michal-h21/vim-zettel'

" snippet engine
Plug 'SirVer/ultisnips'
" Snippets for Ultisnips
Plug 'honza/vim-snippets'

" ctags support
Plug 'preservim/tagbar'

" nord-vim colorscheme
Plug 'arcticicestudio/nord-vim'

" Git support
Plug 'tpope/vim-fugitive'

" Show register contents
Plug 'junegunn/vim-peekaboo'

" Initialize plugin system
call plug#end()

syntax on

" configure nord colorscheme
colorscheme nord

" Override Visual mode colors
hi Visual term=reverse cterm=reverse guibg=Grey

"""""""""""""""""
" Main settings
"""""""""""""""""
set autoindent
set expandtab
set foldlevel=99
set hlsearch
set number relativenumber
set scrolloff=5
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=4
set autochdir
set nrformats+=alpha
set showbreak=⤷
set ignorecase
set smartcase

" enable man plugin
:runtime! ftplugin/man.vim

" Configure vim Airline
" Always show a status line
set laststatus=2

" path for :find
set path+=~/vimwiki/**,~/projects/**

let g:nord_statusline_uniform = 1

let g:airline_theme='cool'

" Display all buffers when only one tab is open
let g:airline#extensions#tabline#enabled=1

" Use powerline fonts in the statusline
let g:airline_powerline_fonts=1

" Configure Vim.FZF. Can't use the cool stuff until VIM 8.2
"let g:fzf_preview_window = 'right:50%'
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }
nnoremap <C-f> :Files<Cr>

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
let wiki_3 = {}
let wiki_3.path = '~/vimwiki/work/'
let wiki_3.syntax= 'markdown'
let wiki_3.ext= 'md'
let wiki_3.index = 'index'
let wiki_3.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'markdown':'md'}
let wiki_4 = {}
let wiki_4.path = '~/vimwiki/private/'
let wiki_4.syntax= 'markdown'
let wiki_4.ext= 'md'
let wiki_4.index = 'index'
let wiki_4.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'markdown':'md'}
let g:vimwiki_list = [wiki_1, wiki_2, wiki_3, wiki_4]
" Disable Tab in tables to not conflict with UltiSnips
let g:vimwiki_table_mappings = 0
let g:vimwiki_markdown_link_ext = 1

" Set vimwiki tabstops
au FileType vimwiki setlocal shiftwidth=2 softtabstop=2 tabstop=2

" Run :Diary to jump to the Diary
command! Diary VimwikiDiaryIndex

augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
augroup end

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
:autocmd FileType vimwiki map <F2> :call ToggleCalendar()<CR>

" vim-zettel config
let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "

" Configure tagbar
let g:tagbar_type_ansible = {
	\ 'ctagstype' : 'ansible',
	\ 'kinds' : [
		\ 't:tasks'
	\ ],
	\ 'sort' : 0
\ }
nmap <F8> :TagbarToggle<CR>


" Set 2 space indent for YAML files
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType yml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

autocmd FileType rst set maxmempattern=2000

" enable spellcheck for some file types
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us complete+=kspell
autocmd BufRead,BufNewFile *.rst setlocal spell spelllang=en_us complete+=kspell
autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us complete+=kspell
autocmd FileType gitcommit setlocal spell spelllang=en_us

" netrw (folder viewer prefs)
let g:netrw_browse_split = 2
let g:netrw_winsize = 25

" Ultisnips config. Avoid Tab if using Valloric/YouCompleteMe or
" nvim-lua/completion-nvim or vimwiki
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


"""""""""""""""" Key mappings """""""""""""""""
" Paste visual selection to ix.io using credentials.
vnoremap <Leader>pp :w !curl -n -F "f:1=<-" ix.io<CR>

" moving lines (from https://vimtricks.com/p/vimtrick-moving-lines/ )
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv


" :Todo command lists TODO and FIXME entries
command! Todo noautocmd vimgrep /TODO\|FIXME/j ** | cw

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undodir
