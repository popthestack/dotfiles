set nocompatible
set encoding=utf-8

syntax on
set tabstop=4
set bs=2

if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END
endif
syntax on

" Persistent undo (vim 7.3+)
if has("persistent_undo")
  set undofile			" enable persistent undo
  set undodir=~/.undo
endif

" Relative line numbers
"set relativenumber

" Cursor highlights
"set cursorline

"set number
"hi LineNr ctermfg=DarkGray

"let mapleader = ','

nnoremap / /\v
vnoremap / /\v

set ignorecase " searches are case insensitive...
set smartcase  " ... unless they contain at least one capital letter
set incsearch  " incremental searching
set showmatch
set hlsearch   " highlight matches

nnoremap <leader><space> :let @/=''<cr>

hi MatchParen cterm=underline ctermbg=none ctermfg=none

autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4

"Invisible character colors
"highlight NonText guifg=#EFEFEF
"highlight SpecialKey guifg=#EFEFEF

"set list
"set listchars=tab:▸\ ,eol:¬

" No Help Key when trying to hit escape
"inoremap <F1> <ESC>
"nnoremap <F1> <ESC>
"vnoremap <F1> <ESC>

" Save when losing focus
"au FocusLost * :wa

