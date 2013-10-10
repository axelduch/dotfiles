" Pathogen
call pathogen#infect()
call pathogen#helptags()

" JS, PHP autocomplete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Tagbar
nmap <F8> :TagbarToggle<CR>
