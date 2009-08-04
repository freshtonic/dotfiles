set autoindent

set dir=/tmp
filetype plugin on
filetype plugin indent on
syntax on                       "syn:   syntax highlighting

set nocompatible                "cp:    turns off strct vi compatibility
set incsearch                   "is:    automatically begins searching as you type
set ignorecase                  "ic:    ignores case when pattern matching
set smartcase                   "scs:   ignores ignorecase when pattern contains uppercase characters
set hlsearch                    "hls:   highlights search results
" Use ctrl-n to unhighlight search results in normal mode:
nmap <silent> <C-N> :silent noh<CR>
set backspace=indent,eol,start  "bs:    allows you to backspace over the listed character types
set linebreak                   "lbr:   causes vim to not wrap text in the middle of a word
" If enabled, the following command absolutely gives me the shits
" set wrap                        "wrap:  wraps lines by default
set nowrap

set showmode                    "smd:   shows current vi mode in lower left
set showcmd                     "sc:    shows typed commands
set cmdheight=2                 "ch:    make a little more room for error messages
set sidescroll=2                "ss:    only scroll horizontally little by little
set scrolloff=1                 "so:    places a line between the current line and the screen edge
set sidescrolloff=2             "siso:  places a couple columns between the current column and the screen edge
set laststatus=2                "ls:    makes the status bar always visible
set ttyfast                     "tf:    improves redrawing for newer computers
set viminfo='100,f1,:100,/100   "vi:    For a nice, huuuuuge viminfo file

" Toggle line wrapping in normal mode:
nmap <silent> <C-P> :set nowrap!<CR>:set nowrap?<CR>
set showmatch                   "sm:    flashes matching brackets or parentheses
set nobackup                    "bk:    does not write a persistent backup file of an edited file
set writebackup                 "wb:    does keep a backup file while editing a file

set cindent                     "cin:   enables the second-most configurable indentation (see :help C-indenting).
set cinoptions=l1,c4,(s,U1,w1,m1,j1
set cinwords=if,elif,else,for,while,try,except,finally,def,class

set autoindent                  "ai:    auto indent
set expandtab                   "et:    uses spaces instead of tab characters
set smarttab                    "sta:   helps with backspacing because of expandtab
set softtabstop=4               "ts:    number of spaces that a tab counts for
set shiftwidth=4                "sw:    number of spaces to use for autoindent
set shiftround                  "sr:    rounds indent to a multiple of shiftwidth

set nojoinspaces                "nojs:  prevents inserting two spaces after punctuation on a join (it's not 1990 anymore)
set lazyredraw                  "lz:    will not redraw the screen while running macros (goes faster)
set pastetoggle=<F5>            "pt:    useful so auto-indenting doesn't mess up code when pasting

" Fix for legacy vi inconsistency
map Y y$


"lcs:   displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>

" Toggle hidden characters display
map <silent> <F6> :set nolist!<CR>:set nolist?<CR>

" Toggle spell-checking
map <silent> <F8> :set nospell!<CR>:set nospell?<CR>

" Maps Omnicompletion to CTRL-space since ctrl-x ctrl-o is for Emacs-style RSI
inoremap <C-Space> <C-x><C-o>
" Spacebar toggles a fold, zi toggles all folding, zM closes all folds

noremap  <silent>  <space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l')<cr>

set foldmethod=marker           "fdm:   looks for patterns of triple-braces in a file
" set foldcolumn=4                "fdc:   creates a small left-hand gutter for displaying fold info
set switchbuf=useopen           "swb:   Jumps to first window or tab that contains specified buffer instead of duplicating an open window
set showtabline=1               "stal:  Display the tabbar if there are multiple tabs. Use :tab ball or invoke Vim with -p
set hidden                      "hid:   allows opening a new buffer in place of an existing one without first saving the existing one

set splitright                  "spr:   puts new vsplit windows to the right of the current
set splitbelow                  "sb:    puts new split windows to the bottom of the current

set winminheight=0              "wmh:   the minimal line height of any non-current window
set winminwidth=0               "wmw:   the minimal column width of any non-current window
" Type <F1> follwed by a buffer number or name fragment to jump to it.
" Also replaces the annoying help button. Based on tip 821.
map <F1> :ls<CR>:b<Space>

noremap <silent> ,sq :new +:read\ !svn\ diff\ "#"<CR>:exe Scratch()<CR>:set filetype=diff<CR>:set nofoldenable<CR>
noremap <silent> ,sd :tabnew %<CR> :vnew +:read\ !svn\ cat\ "#"<CR>:exe Scratch()<CR>:diffthis<CR><C-W>w :diffthis<CR>:set syntax=off<CR>

" Python :make
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
au FileType python set keywordprg=pydoc

function! Scratch()
    set buftype=nofile
    set bufhidden=delete
    set noswapfile
endfunction
noremap <silent> ,s :exe Scratch()<CR>




" My old stuff here

nnoremap <silent> <C-n> :tabnext<CR>
nnoremap <silent> <C-p> :tabprevious<CR>
set mouse=a
" set tabstop=2
" set expandtab
" uncomment below to enable line numbering
" set number
set tabpagemax=30
syntax on
set nocompatible
filetype plugin indent on
" runtime! macros/matchit.vim

" auto word wrap
" and insert line breaks
set textwidth=78
set wm=2

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
  autocmd FileType python set ai ts=4 sts=4 et sw=4
augroup END

au! BufRead,BufNewFile *.haml setfiletype haml

nmap <leader>rci :%!ruby-code-indenter<cr>

command -bar -nargs=1 OpenURL :!sensible-browser <args>
colorscheme tango

helptags ~/.vim/doc

" Display the filename in the statusline
set statusline=(%{GitBranch()})\ %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" Make sure the filename stays after scrolling
set laststatus=2

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

autocmd FileWritePre * :call TrimWhiteSpace()
autocmd FileAppendPre * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre * :call TrimWhiteSpace()

map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" Open multiple files in tabs in one command
command! -complete=file -nargs=+ Etabs call s:ETW('tabnew', <f-args>)
command! -complete=file -nargs=+ Ewindows call s:ETW('new', <f-args>)
command! -complete=file -nargs=+ Evwindows call s:ETW('vnew', <f-args>)

function! s:ETW(what, ...)
  for f1 in a:000
    let files = glob(f1)
    if files == ''
      execute a:what . ' ' . escape(f1, '\ "')
    else
      for f2 in split(files, "\n")
        execute a:what . ' ' . escape(f2, '\ "')
      endfor
    endif
  endfor
endfunction

map <T> TaskList

autocmd FileType python set omnifunc=pythoncomplete#Complete

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
