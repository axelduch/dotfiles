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

" SLIMV (lisp)
Bundle "vim-scripts/slimv.vim"

" file finder
Bundle "kien/ctrlp.vim" 
unlet g:ctrlp_custom_ignore
let g:ctrlp_custom_ignore = '(node_modules\|DS_Store\|git)$'

" rename a file
Bundle "danro/rename.vim"

" autocompletion
Bundle "Valloric/YouCompleteMe"

" smart detection of space or tabs mode
Bundle "vim-scripts/yaifa.vim"

" jshint
Bundle "Shutnik/jshint2.vim"

" syntastic
Bundle "scrooloose/syntastic"

" tabular alignment of equal signs
Bundle "godlygeek/tabular"

" Multiple cursors
Bundle "terryma/vim-multiple-cursors"

" emmet
Plugin 'mattn/emmet-vim'

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

" JS, PHP, JSP autocomplete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Theme
:colorscheme wombat256mod

" gvim
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

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

" Syntax highlight
au BufNewFile,BufRead *.jspf,*.vm set syntax=html
au BufNewFile,BufRead *.at2 setlocal ft=asm

" ctrl+s to save
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" ctrl+c during normal and insert mode to copy entire line to system clipboard
nnoremap <c-c> "+yy
inoremap <c-c> "+yy

" ctrl+c to copy selection in visual mode to system clipboard
vnoremap <c-c> "+y

" ctrl+v during insert mode to paste system clipboard
inoremap <c-v> <c-r>*<CR>
