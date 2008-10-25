set autoindent
nnoremap <silent> <C-n> :tabnext<CR>
nnoremap <silent> <C-p> :tabprevious<CR>
set mouse=a
set tabstop=2
set expandtab
set number
set tabpagemax=30
syntax on
set nocompatible
filetype plugin indent on
runtime! macros/matchit.vim

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

nmap <leader>rci :%!ruby-code-indenter<cr> 

:command -bar -nargs=1 OpenURL :!sensible-browser <args>

:colorscheme vividchalk
"set t_Co=256

:helptags ~/.vim/doc  

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold
