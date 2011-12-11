" Much of my .vimrc is taken from Steve Losh's .vimrc which can be found below.
" My .vimrc is in a state of flux at the moment as I go through a phase of
" Vim hackery and experimentation. I make no claim that my configuration is either
" clean or sane. Use at your own peril ;)
"
" Steve Losh's stuff bits:
" Author: Steve Losh <steve@stevelosh.com>
" Source: http://bitbucket.org/sjl/dotfiles/src/tip/vim/
" My bits
" Author: James Sadler <freshtonic@gmail.com>
" Source http://github.com/freshtonic/dotfiles

filetype off
call pathogen#infect()
call pathogen#helptags()
set nocompatible
filetype plugin indent on

syn sync minlines=200
syn sync fromstart

if has("gui_running")
    set background=dark 
    set t_Co=256
    set background=dark
    colorscheme solarized
    "improve autocomplete menu color
    highlight Pmenu ctermbg=238 gui=bold
    set guioptions=egmrt
    syntax on

    " Remove all the UI cruft
    set go-=T
    set go-=l
    set go-=L
    set go-=r
    set go-=R

    " Use a line-drawing char for pretty vertical splits.
    set fillchars+=vert:│

    if has("gui_macvim")
        " Full screen means FULL screen
        set fuoptions=maxvert,maxhorz

        set gfn=Menlo:h11

        " Use the normal HIG movements, except for M-Up/Down
        let macvim_skip_cmd_opt_movement = 1
        no   <D-Left>       <Home>
        no!  <D-Left>       <Home>
        no   <M-Left>       <C-Left>
        no!  <M-Left>       <C-Left>

        no   <D-Right>      <End>
        no!  <D-Right>      <End>
        no   <M-Right>      <C-Right>
        no!  <M-Right>      <C-Right>

        no   <D-Up>         <C-Home>
        ino  <D-Up>         <C-Home>
        imap <M-Up>         <C-o>{

        no   <D-Down>       <C-End>
        ino  <D-Down>       <C-End>
        imap <M-Down>       <C-o>}

        imap <M-BS>         <C-w>
        inoremap <D-BS>     <esc>my0c`y
    else
        " Non-MacVim GUI, like Gvim
    end
else
    " Console Vim
    colorscheme ir_black
endif


" TODO: merge this stuff with Steve Losh's settings
"augroup myfiletypes
"  " Clear old autocmds in group
"  autocmd!
"  " autoindent with two spaces, always expand tabs
"  autocmd FileType ruby,eruby,yaml,cucumber set ai sw=2 sts=2 et
"  autocmd FileType coffee set ai sw=2 sts=2 et
" autocmd FileType xml set ai ts=8 sw=8 sts=8
"  autocmd FileType xslt set ai ts=2 sw=2
"augroup END


let g:syntastic_enable_signs=1

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e ~/code/dotfiles/vimrc<CR>
nmap <silent> <leader>sv :so ~/code/dotfiles/vimrc<CR>
nmap <silent> <leader>mv :!(cd ~/code/dotfiles && make clean install)<CR>


set autoindent
set backspace=indent,eol,start
set cmdheight=2
set cursorline
set dictionary=/usr/share/dict/words
set dir=/tmp
set encoding=utf-8
set history=1000
set hlsearch
set incsearch
set laststatus=2
set lazyredraw
set linebreak
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
nmap <silent> <C-\> :set list!<CR>
set showbreak=↪
set mouse=a
set noerrorbells
set shell=/bin/bash
set showbreak=↪
set showcmd
set showtabline=1
set splitbelow
set splitright
set switchbuf=useopen
set tabpagemax=30
set ttyfast
set visualbell

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*" 

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Tabs, spaces, wrapping 

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set textwidth=80
set formatoptions=qrn1
" set colorcolumn=+1

" Backups 

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups

" Leader 

let mapleader = ","
let maplocalleader = "\\"

" Color scheme 

syntax on

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'


" Status line ------------------------------------------------------------- 

augroup ft_statuslinecolor
    au!

    au InsertEnter * hi StatusLine ctermfg=196 guifg=#FF3145
    au InsertLeave * hi StatusLine ctermfg=130 guifg=#CD5907
augroup END

" Display the filename in the statusline
" set statusline=%{fugitive#statusline()}\ %<%f\ %y\ %#warningmsg#%{}%*
set statusline=%{fugitive#statusline()}\ %<%f\ %y\ %#warningmsg#%*

"set statusline=%f    " Path.
set statusline+=%m   " Modified flag.
set statusline+=%r   " Readonly flag.
set statusline+=%w   " Preview window flag.

set statusline+=\    " Space.

set statusline+=%=   " Right align.

" File format, encoding and type.  Ex: "(unix/utf-8/python)"
set statusline+=(
set statusline+=%{&ff}                        " Format (unix/DOS).
set statusline+=/
set statusline+=%{strlen(&fenc)?&fenc:&enc}   " Encoding (utf-8).
set statusline+=/
set statusline+=%{&ft}                        " Type (python).
set statusline+=)

" Line and column position and counts.
set statusline+=\ (line\ %l\/%L,\ col\ %03c)

" Abbreviations ----------------------------------------------------------- 

function! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction

function! MakeSpacelessIabbrev(from, to)
    execute "iabbrev <silent> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
endfunction

call MakeSpacelessIabbrev('gh/',  'http://github.com/')
call MakeSpacelessIabbrev('ghf/', 'http://github.com/freshtonic/')

iabbrev ldis ಠ_ಠ
iabbrev lsad ಥ_ಥ
iabbrev lhap ಥ‿ಥ

iabbrev fr@ freshtonic@gmail.com
iabbrev vrcf `~/.vimrc` file

" Searching and movement -------------------------------------------------- 

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

noremap <leader><space> :noh<cr>:call clearmatches()<cr>

runtime macros/matchit.vim

" Made D behave
nnoremap D d$

" Don't move on *
nnoremap * *<c-o>

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L g_

" Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Ack for the last search.
nnoremap <silent> <leader>? :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

" Fix linewise visual selection of various text objects
nnoremap VV V
nnoremap Vit vitVkoj
nnoremap Vat vatV
nnoremap Vab vabV
nnoremap VaB vaBV


" Directional Keys 

" It's 2011.
noremap j gj
noremap k gk

" Easy buffer navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l
noremap <leader>v <C-w>v




" Destroy infuriating keys ------------------------------------------------ 

" Fuck you, help key.
noremap  <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>a



augroup ft_ruby
    au!
    " au Filetype ruby setlocal foldmethod=syntax
    autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
    autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
    autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
    autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
augroup END

augroup ft_vim
    au!
    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    " The folowing puts Vim help files in a vertical split
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Save stuff owned by root when you forgot to open as root
cmap w!! w !sudo tee % >/dev/null

" Unhighlight search results
nnoremap ; :set invhlsearch<CR>

" Fix for legacy vi inconsistency
map Y y$

"" pretty print XML
nmap <silent> <leader>xp :%!$HOME/bin/xmlpp -tcen 2> /dev/null<CR>

" send the Ruby code in the buffer through awesome print.
nmap <silent> <leader>ap :%!ruby -e "require 'rubygems'; require 'awesome_print'; STDIN.each_line{ \|l\| ap eval(l) }"<cr>

" Run git grep
nmap <leader>gg<CR>:r!git grep 

"" CamelCaseMotion conflicts with the default <Leader>b binding of Command-T
nnoremap <silent> <Leader>l :CommandTBuffer<CR>
" Clean whitespace
map <leader>W  :%s/\s\+$//<cr>:let @/=''<CR>

" Change case
nnoremap <leader>u gUiw


" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Diffoff
nnoremap <leader>D :diffoff!<cr>

" Yankring
nnoremap <silent> <F6> :YRShow<cr>

" Preview Files
" TODO: install plugin https://github.com/robgleeson/hammer.vim
" nnoremap <leader>p :w<cr>:Hammer<cr>

" HTML tag closing
inoremap <C-_> <Space><BS><Esc>:call InsertCloseTag()<cr>a


" Better Completion
set completeopt=longest,menuone,preview

" Handle URL 
" Stolen from https://github.com/askedrelic/homedir/blob/master/.vimrc
" OSX only: Open a web-browser with the URL in the current line
function! HandleURI()
    let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
    echo s:uri
    if s:uri != ""
        exec "!open \"" . s:uri . "\""
    else
        echo "No URI found in line."
    endif
endfunction
map <leader>u :call HandleURI()<CR>

map <leader>a :Ack! 


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

nnoremap <F5> :GundoToggle<CR>
let g:gundo_debug = 1
let g:gundo_preview_bottom = 1

let g:event_handler_attributes_complete = 0
let g:rdfa_attributes_complete = 0
let g:microdata_attributes_complete = 0
let g:atia_attributes_complete = 0

noremap  <F2> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>

au Filetype nerdtree setlocal nolist

let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json', '.*\.o$', 'db.db']

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

function! NewScratchBuffer()
       set buftype=nofile
       set bufhidden=hide
       setlocal noswapfile
endfunction
nnoremap <silent> <leader><tab> :call NewScratchBuffer()<cr>

let g:syntastic_enable_signs = 1
let g:syntastic_disabled_filetypes = ['html', 'cucumber']
let g:syntastic_stl_format = '[%E{Error 1/%e: line %fe}%B{, }%W{Warning 1/%w: line %fw}]'
let g:syntastic_jsl_conf = '$HOME/.vim/jsl.conf'


" Motion for "next/last object". For example, "din(" would go to the next "()" pair
" and delete its contents.

onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>

onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>

function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())

  if c ==# "b"
      let c = "("
  elseif c ==# "B"
      let c = "{"
  elseif c ==# "d"
      let c = "["
  endif

  exe "normal! ".a:dir.c."v".a:motion.c
endfunction

" Motions to Ack for things.  Works with pretty much everything, including:

"   w, W, e, E, b, B, t*, f*, i*, a*, and custom text objects

" Awesome.

" Note: If the text covered by a motion contains a newline it won't work.  Ack
" searches line-by-line.

" TODO: make this work for 'git grep' too

nnoremap <silent> \a :set opfunc=<SID>AckMotion<CR>g@
xnoremap <silent> \a :<C-U>call <SID>AckMotion(visualmode())<CR>

function! s:CopyMotionForType(type)
    if a:type ==# 'v'
        silent execute "normal! `<" . a:type . "`>y"
    elseif a:type ==# 'char'
        silent execute "normal! `[v`]y"
    endif
endfunction

function! s:AckMotion(type) abort
    let reg_save = @@
    call s:CopyMotionForType(a:type)
    execute "normal! :Ack! --literal " . shellescape(@@) . "\<cr>"
    let @@ = reg_save
endfunction


function! g:echodammit(msg)
    exec 'echom "----------> ' . a:msg . '"'
endfunction

" Toggle whitespace in diffs 

set diffopt-=iwhite
let g:diffwhitespaceon = 1
function! ToggleDiffWhitespace() "
    if g:diffwhitespaceon
        set diffopt-=iwhite
        let g:diffwhitespaceon = 0
    else
        set diffopt+=iwhite
        let g:diffwhitespaceon = 1
    endif
    diffupdate
endfunc 

nnoremap <leader>dw :call ToggleDiffWhitespace()<CR>
