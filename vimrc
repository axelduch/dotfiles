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

" JS, PHP autocomplete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Theme
:colorscheme wombat256mod

" Sync with dev server
:silent :autocmd BufWritePost /home/axel/Projects/no-ide/git/* :silent !/home/axel/Projects/dev-sync-manager.sh

" Only spaces, tab = 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
" Display line number
set number

" Edition
set noswapfile " No swap file
set autoread " reload file when changed outside of vim

filetype plugin indent on     " required!
