
" BEGIN: load modules with Tim Pope's vim-pathogen
" see: http://www.vim.org/scripts/script.php?script_id=2332 for details
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
" END: load modules with Tim Pope's vim-pathogen

" This must be first, because it changes other options as side effect
set nocompatible

" set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" change the mapleader from \ to ,
let mapleader=","

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

set list
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

