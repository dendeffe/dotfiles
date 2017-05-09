set nocompatible              " be iMproved, required
filetype off                  " required

" disable logipat from loading (and exposing :ELP, which prevents me from using :E for :explore)
let g:loaded_logipat = 1 

" Don't index .git and node_modules (mostly grunt)
"g:gutentags_exclude = ['.git', 'node_modules']

" Don't use all included files for complete http://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow
set complete-=i

set term=screen-256color
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
let mapleader=","

" Remove  delay on esc sequences https://groups.google.com/forum/#!topic/vim_dev/r3CPPl6AVRM
set timeout timeoutlen=5000 ttimeoutlen=100

" Disable the error bell
"http://superuser.com/questions/553684/vim-how-to-play-without-the-beeps
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Line numbers in netrw
" http://stackoverflow.com/questions/8730702/how-do-i-configure-vimrc-so-that-line-numbers-display-in-netrw-in-vim
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" Don't show swap files in netrw
let g:netrw_list_hide= '[._]*.sw[a-w][a-z]'
let g:netrw_list_hide= '[._]sw[a-w][a-z]'

" backup to ~/.tmp 
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'kien/ctrlp.vim'

" newline in normal mode
" nmap <S-Enter> O<Esc>
" nmap <CR> o<Esc>

"
"" Plugin 'wikitopian/hardmode'
Plugin 'bling/vim-airline'
Plugin 'arecarn/crunch.vim'
Plugin 'reedes/vim-pencil'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'majutsushi/tagbar'
Plugin 'mtscout6/vim-tagbar-css'
"Plugin 'pangloss/vim-javascript'
"Plugin 'KabbAmine/vCoolor.vim'
"Plugin 'JulesWang/css.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'airblade/vim-gitgutter'
"Plugin 'tpope/vim-unimpaired'
"Plugin 'captbaritone/better-indent-support-for-php-with-html'
Plugin 'mtth/scratch.vim'
"Plugin 'firegoby/html_entities_helper.vim'
Plugin 'dracula/vim'
""
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Let ctrlp know of ctrlpfunky
let g:ctrlp_extensions = ['funky']

" let ctrlp find invisible files
let g:ctrlp_show_hidden = 1

" Iron will and discipline! Let's turn on Hard Mode!
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
set laststatus=2

set relativenumber

"start neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" set background color of popup
highlight Pmenu ctermbg=8 guibg=#4563B7
"end neocomplet

set encoding=utf-8
" Make backspace behave in a sane manner.
set backspace=indent,eol,start
" Switch syntax highlighting on
syntax on
 
" Enable file type detection and do language-dependent indenting.
filetype plugin indent on
 
" Show line numbers
set number
 
" Allow hidden buffers, don't limit to 1 file per window/split
set hidden


" Whitespace
set nowrap

" Search
set hlsearch
set incsearch
set ignorecase
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

set guifont=Fira\ Mono:h16
"colorscheme badwolf
" colorscheme cobalt2
colorscheme dracula
"colorscheme molokai
"colorscheme smyck
set listchars=tab:▸\ ,eol:¬
set cursorline


"MAPPINGS"
" vimgrep
nnoremap <c-S-f> :vimgrep // **/*.php

autocmd VimEnter * echo '>ˆ.ˆ<'

" Silver searcher Code In the hole
if executable('ag')
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m
endif
