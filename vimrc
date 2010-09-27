
" BEGIN: load modules with Tim Pope's vim-pathogen
" see: http://www.vim.org/scripts/script.php?script_id=2332 for details
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" END: load modules with Tim Pope's vim-pathogen

" This must be first, because it changes other options as side effect
set nocompatible

" set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


" lets us e: another buffer without being forced to save or undo existing
set hidden

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

if has('autocmd')
	autocmd filetype python set expandtab
endif

if &t_Co >= 256 || has("gui_running")
   colorscheme ir_black
endif

if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

" set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

autocmd filetype html,xml set listchars-=tab:>.

set mouse=a

fun! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Save stuff owned by root when you forgot to open as root
cmap w!! w !sudo tee % >/dev/null

" Unhighlight search results
nnoremap ; :set invhlsearch<CR>

set dir=/tmp

set incsearch                   "is:    automatically begins searching as you type
set hlsearch                    "hls:   highlights search results
" Use ctrl-n to unhighlight search results in normal mode:
set backspace=indent,eol,start  "bs:    allows you to backspace over the listed character types
set linebreak                   "lbr:   causes vim to not wrap text in the middle of a word
set nowrap                        "nowrap:  don't wraps lines by default

set showmode                    "smd:   shows current vi mode in lower left
set showcmd                     "sc:    shows typed commands
set cmdheight=2                 "ch:    make a little more room for error messages
set sidescroll=2                "ss:    only scroll horizontally little by little
set scrolloff=1                 "so:    places a line between the current line and the screen edge
set sidescrolloff=2             "siso:  places a couple columns between the current column and the screen edge
set laststatus=2                "ls:    makes the status bar always visible
set ttyfast                     "tf:    improves redrawing for newer computers

set nojoinspaces                "nojs:  prevents inserting two spaces after punctuation on a join (it's not 1990 anymore)
set lazyredraw                  "lz:    will not redraw the screen while running macros (goes faster)

" Fix for legacy vi inconsistency
map Y y$

set background=dark 
set t_Co=256
colorscheme ir_black

set switchbuf=useopen           "swb:   Jumps to first window or tab that contains specified buffer instead of duplicating an open window
set showtabline=1               "stal:  Display the tabbar if there are multiple tabs. Use :tab ball or invoke Vim with -p

set splitright                  "spr:   puts new vsplit windows to the right of the current
set splitbelow                  "sb:    puts new split windows to the bottom of the current

set winminheight=0              "wmh:   the minimal line height of any non-current window
set winminwidth=0               "wmw:   the minimal column width of any non-current window

" Tab navigation
nnoremap <silent> <leader>n :tabnext<CR>
nnoremap <silent> <leader>p :tabprevious<CR>

" YankRing keys
nnoremap <silent> <leader>yrs :YRShow<CR>

set tabpagemax=30

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
  autocmd FileType python set ai ts=4 sts=4 et sw=4
  " autocmd FileType xml set ai ts=8 sw=8 sts=8
  autocmd FileType xslt set ai ts=2 sw=2
augroup END

" Display the filename in the statusline
set statusline=%{fugitive#statusline()}\ %<%f\ %y\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" Make sure the filename stays after scrolling
set laststatus=2

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" Disable the toolbar if running MacVim
if has("gui_running")
    set guioptions=egmrt
endif

" Stop that fucking beep!
set noerrorbells
set visualbell
set t_vb=

" Key mapping to start FuzzyFinder
nnoremap <silent> <C-f> :FuzzyFinderFile<CR>

function! PrettifyXml()
	%s/></>\r</g
	normal gg=G
endfunction

nmap <silent> <leader>xp :call PrettifyXml()<CR>


