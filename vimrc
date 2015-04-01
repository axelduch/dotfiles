" Vundle
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'
Plugin 'mozilla/doctorjs'

" SLIMV (lisp)
Plugin 'vim-scripts/slimv.vim'

" file finder
Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" rename a file
Plugin 'danro/rename.vim'

" autocompletion
Plugin 'Valloric/YouCompleteMe'

" smart detection of space or tabs mode
Plugin 'vim-scripts/yaifa.vim'

" jshint
Plugin 'Shutnik/jshint2.vim'

" syntastic
Plugin 'scrooloose/syntastic'

" tabular alignment of equal signs
Plugin 'godlygeek/tabular'

" Multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" emmet
Plugin 'mattn/emmet-vim'

" zoom in and out fonts
Plugin 'vim-scripts/fontzoom.vim'
set guifont=Bitstream\ Vera\ Sans\ Mono\ 9

" powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
set laststatus=2
set encoding=utf-8
set t_Co=256
let g:Powerline_symbols = 'fancy'
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

Plugin 'wombat256.vim'

call vundle#end()
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
