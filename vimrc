" Vundle
set nocompatible              " be iMproved
set mouse=r
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

" accelerated smooth scroll
Plugin 'yonchu/accelerated-smooth-scroll'

" VimFiler (file explorer)
" It depends on unite.vim so install it before vimfiler
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'

" Set VimFiler as default file explorer and configure
let mapleader=" "
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_tree_leaf_icon = " "
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_time_format = '%m-%d-%y %H:%M:%S'
let g:vimfiler_expand_jump_to_first_child = 0
let g:vimfiler_ignore_pattern = '\.git\|\.DS_Store\|\.pyc'

nnoremap <Leader>d :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -toggle -no-quit<CR>
nnoremap <Leader>jf :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -no-quit -find<CR>
autocmd FileType vimfiler nunmap <buffer> x
autocmd FileType vimfiler nmap <buffer> x <Plug>(vimfiler_toggle_mark_current_line)
autocmd FileType vimfiler vmap <buffer> x <Plug>(vimfiler_toggle_mark_selected_lines)
autocmd FileType vimfiler nunmap <buffer> l
autocmd FileType vimfiler nmap <buffer> l <Plug>(vimfiler_cd_or_edit)
autocmd FileType vimfiler nmap <buffer> h <Plug>(vimfiler_switch_to_parent_directory)
autocmd FileType vimfiler nmap <buffer> <C-R> <Plug>(vimfiler_redraw_screen)
autocmd FileType vimfiler nmap <silent><buffer><expr> <CR> vimfiler#smart_cursor_map(
            \ "\<Plug>(vimfiler_expand_tree)",
            \ "\<Plug>(vimfiler_edit_file)")

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

Plugin 'mileszs/ack.vim'

" Markdown
Plugin 'plasticboy/vim-markdown'

call vundle#end()
filetype plugin indent on     " required!

" JS, PHP, JSP autocomplete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Theme
:colorscheme monokai

" gvim
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
:set lines=64
:set columns=90

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
set swapfile
set dir=~/tmp
set backupdir=~/backups
set autoread " reload file when changed outside of vim

" Syntax highlight
au BufNewFile,BufRead *.jspf,*.vm set syntax=html
au BufNewFile,BufRead *.at2 setlocal ft=asm

" ctrl+s to save
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
