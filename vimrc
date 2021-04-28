
" Mega VIM TIP:
" The following command dumps all Vim mappings to a file.
"
" To find out which plugin created a mapping, you can do a git bisect run until
" you find what's responsible.
"
" vim -s <(echo -e ':redir! >vim-mappings.txt\n:silent map\n:redir END\n:q\n')
"
" the following is also useful
" :verbose map <c-s>
" gives you details about the given mapping ( in our case <c-s>)


call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/syntastic'
Plug 'bkad/CamelCaseMotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-unimpaired'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-endwise'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-fugitive'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jparise/vim-graphql'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()            " required

" set rtp+=~/.vim/plugged/vim-colors-solarized
" set rtp+=/usr/local/opt/fzf

filetype plugin indent on

set wildignore+=node_modules/**
filetype off
set nocompatible
filetype plugin indent on

syn sync minlines=8000
syn sync fromstart

set t_Co=256

set background=dark

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

set laststatus=2
set autoindent
set backspace=indent,eol,start
set cmdheight=1
set dictionary=/usr/share/dict/words
set dir=/tmp
set encoding=utf-8
set history=1000
set hlsearch
set incsearch
set laststatus=2

set lazyredraw
set linebreak
set nolist
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
nmap <silent> <C-\> :set list!<CR>
set showbreak=↪
set mouse=a
set noerrorbells
set shell=/bin/bash
set showbreak=↪
set noshowcmd
set showtabline=1
set splitbelow
set splitright
set switchbuf=useopen
set tabpagemax=30
set visualbell
set t_vb=

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups

let mapleader = ","
let maplocalleader = "\\"

nmap <silent> <leader>l :FZF<CR>

call camelcasemotion#CreateMotionMappings('<leader>')

" Use the old regex engine.  The new one makes ruby syntax highlighting *really*
" slow.
set re=1
syntax on

nnoremap <silent> <C-N> :tabnext<CR>
nnoremap <silent> <C-P> :tabprev<CR>

noremap <leader><space> :noh<cr>:call clearmatches()<cr>

nmap <silent> <leader>b :call ToggleBackground()<CR>

nnoremap D d$

nnoremap * *<c-o>

nnoremap g; g;zz
nnoremap g, g,zz

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L g_

" Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" Fix linewise visual selection of various text objects
nnoremap VV V
nnoremap Vit vitVkoj
nnoremap Vat vatV
nnoremap Vab vabV
nnoremap VaB vaBV


" Directional Keys

" Easy buffer navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l
noremap <leader>v <C-w>v

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Save stuff owned by root when you forgot to open as root
cmap w!! w !sudo tee % >/dev/null

" Unhighlight search results
nnoremap ; :set invhlsearch<CR>

" Fix for legacy vi inconsistency
map Y y$

" Clean whitespace
map <leader>W  :%s/\s\+$//<cr>:let @/=''<CR>

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Diffoff
nnoremap <leader>D :diffoff!<cr>

" Yankring
nnoremap <silent> <F6> :YRShow<cr>

" HTML tag closing
inoremap <C-_> <Space><BS><Esc>:call InsertCloseTag()<cr>a

" copy filename of current buffer into unnamed register
nmap <silent> <leader>fn :let @" = expand("%")<CR>

" Better Completion
set completeopt=longest,menuone,preview

nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gr :Gremove<cr>
nnoremap <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>

augroup ft_fugitive
    au!
    au BufNewFile,BufRead .git/index setlocal nolist
augroup END

function! NewScratchBuffer()
	set buftype=nofile
	set bufhidden=hide
	setlocal noswapfile
endfunction
nnoremap <silent> <leader><tab> :call NewScratchBuffer()<cr>

let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

if has("nvim")
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
endif

" These don't work for some reason... maybe iTerm2 masks things
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

map <C-\> :NERDTreeToggle<CR>
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

set nofoldenable    " disable folding

set ai sw=2 sts=2 et

augroup formatting 
  autocmd!
  autocmd FileType ruby,eruby,yaml,cucumber,md set ai sw=2 sts=2 et
  autocmd FileType typescript set ai sw=2 sts=2 et
  autocmd FileType coffee,javascript set ai sw=2 sts=2 et
  autocmd FileType xml,html,xslt,svg set ai sw=2 sts=2 et
  autocmd FileType css,scss set ai sw=2 sts=2 et
  autocmd FileType sql set ai sw=2 sts=2 et
  autocmd FileType vim set ai sw=2 sts=2 et
  " autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
augroup END

augroup ft_ruby
	au!
	autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
	autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
	autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
	autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
augroup END

augroup ft_vim
	au!
	au FileType vim setlocal foldmethod=marker
	au FileType help setlocal textwidth=78
augroup END

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx
autocmd BufNewFile,BufRead *.ts,*.js set filetype=typescript.jsx

" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" colorscheme solarized

let g:rustfmt_autosave = 1

