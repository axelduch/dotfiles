" Pathogen
" call pathogen#infect()
" call pathogen#helptags()

" Vundle
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle "mozilla/doctorjs"

" file finder
Bundle "kien/ctrlp.vim" 

" autocompletion
Bundle "Valloric/YouCompleteMe"

" smart detection of space or tabs mode
Bundle "vim-scripts/yaifa.vim"

" jshint
Bundle "Shutnik/jshint2.vim"

" zoom in and out fonts
Bundle "vim-scripts/fontzoom.vim"
set guifont=Bitstream\ Vera\ Sans\ Mono\ 9

" powerline
Bundle "Lokaltog/powerline", {'rtp': 'powerline/bindings/vim/'}
set laststatus=2
set encoding=utf-8
set t_Co=256
let g:Powerline_symbols = 'fancy'
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

filetype plugin indent on     " required!

" JS, PHP autocomplete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Theme
:colorscheme wombat256mod

" jshint on save
let jshint2_save = 0

" Only spaces, tab = 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
" Display line number
set number
" Display invisible characters
set list
" Edition
set noswapfile " No swap file
set autoread " reload file when changed outside of vim

" Syntax highlight for at2
au BufNewFile,BufRead *.at2 setlocal ft=asm

