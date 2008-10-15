set autoindent
nnoremap <silent> <C-n> :tabnext<CR>
nnoremap <silent> <C-p> :tabprevious<CR>
set mouse=a
set tabstop=2
set expandtab
" uncomment below to enable line numbering
" set number
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

au! BufRead,BufNewFile *.haml setfiletype haml 

nmap <leader>rci :%!ruby-code-indenter<cr> 

command -bar -nargs=1 OpenURL :!sensible-browser <args>
colorscheme vividchalk

helptags ~/.vim/doc 

" Display the filename in the statusline
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" Make sure the filename stays after scrolling
set laststatus=2
