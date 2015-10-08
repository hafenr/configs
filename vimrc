"|                                                                     |
"|           ▄               ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄       ▄▄               |
"|          ▐░▌             ▐░▌▐░░░░░░░░░░░▌▐░░▌     ▐░░▌              |
"|           ▐░▌           ▐░▌  ▀▀▀▀█░█▀▀▀▀ ▐░▌░▌   ▐░▐░▌              |
"|            ▐░▌         ▐░▌       ▐░▌     ▐░▌▐░▌ ▐░▌▐░▌              |
"|  ▄▄▄▄▄▄▄▄▄▄▄▐░▌       ▐░▌        ▐░▌     ▐░▌ ▐░▐░▌ ▐░▌ ▄▄▄▄▄▄▄▄▄▄▄  |
"| ▐░░░░░░░░░░░▌▐░▌     ▐░▌         ▐░▌     ▐░▌  ▐░▌  ▐░▌▐░░░░░░░░░░░▌ |
"|  ▀▀▀▀▀▀▀▀▀▀▀  ▐░▌   ▐░▌          ▐░▌     ▐░▌   ▀   ▐░▌ ▀▀▀▀▀▀▀▀▀▀▀  |
"|                ▐░▌ ▐░▌           ▐░▌     ▐░▌       ▐░▌              |
"|                 ▐░▐░▌        ▄▄▄▄█░█▄▄▄▄ ▐░▌       ▐░▌              |
"|                  ▐░▌        ▐░░░░░░░░░░░▌▐░▌       ▐░▌              |
"|                   ▀          ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀               |
"|                                                                     |
"|                               ~*~*~                                 |
"|                   -=:: SETTINGS & MAPPINGS ::=-                     |
"|                               *`*`*                                 |
"=======================================================================
" General {{{
"=======================================================================
let os = substitute(system('uname'), "\n", "", "")
let vimdir = '$HOME/.vim'
" }}}
"=======================================================================
" Plugins {{{
"=======================================================================
call plug#begin('~/.vim/plugged')
" Essential
Plug 'gmarik/Vundle.vim'               " Let Vundle manage Vundle
Plug 'tpope/vim-commentary'            " Commenting operator gc
Plug 'SirVer/ultisnips'                " Snippet system
Plug 'honza/vim-snippets'              " Snippets
Plug 'Xuyuanp/git-nerdtree'            " Nerd tree with git integration
Plug 'tpope/vim-vinegar'
Plug 'Raimondi/delimitMate'
Plug 'kien/ctrlp.vim'                  " Fuzzy file finder
Plug 'bling/vim-airline'               " Fancy status bar
Plug 'tpope/vim-fugitive'              " Git plugin
Plug 'tpope/vim-repeat'                " Repeat all kinds of stuff
Plug 'tpope/vim-surround'              " Surround motions
Plug 'mbbill/undotree'                 " Undo history as a tree
Plug 'rking/ag.vim'                    " Silver searcher: faster vimgrep/grep:
Plug 'gabesoft/vim-ags'
" Plug 'PeterRincker/vim-argumentative'  " i, a, text objects; >, <, movement
Plug 'szw/vim-maximizer'               " Temporarily maximize window
Plug 'scrooloose/syntastic'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'rhysd/clever-f.vim'
" Plug 'tpope/vim-unimpaired'
Plug 'Lokaltog/vim-easymotion'
Plug 'jwhitley/vim-matchit'            " More jumps for %
Plug 'jpalardy/vim-slime'              " REPL interaction
" Plug 'Valloric/YouCompleteMe', { 'do': 'cd ~/.vim/plugged/YouCompleteMe/ && sh install.sh'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'          " ]c [c
Plug 'mattn/gist-vim'                  " buffer or selection to gist with :Gist
Plug 'ivyl/vim-bling'                  " blink on / n N
Plug 'bfredl/nvim-ipy'
Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'dbakker/vim-projectroot'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'ktonga/vim-follow-my-lead'
Plug 'mattn/webapi-vim'
Plug 'benekastah/neomake'
Plug 'janko-m/vim-test'

" Angular
Plug 'burnettk/vim-angular', { 'for': 'javascript' }
Plug 'matthewsimo/angular-vim-snippets', { 'for': 'javascript' }
Plug 'claco/jasmine.vim', { 'for': 'javascript' }

" Colors
Plug 'https://github.com/freeo/vim-kalisi'
Plug 'jonathanfilip/vim-lucius'
Plug 'croaker/mustang-vim'
Plug 'noahfrederick/vim-hemisu'
Plug 'tomasr/molokai'
Plug 'junegunn/seoul256.vim'           " Nice color scheme

" Nice to have
Plug 'vim-scripts/IndexedSearch'
Plug 'junegunn/vim-easy-align'         " :'<,'>EasyAlign [*] DELIM or /regex/
Plug 'yaifa.vim'
Plug 'kana/vim-textobj-user'           " Needed for textobj-python
Plug 'bkad/CamelCaseMotion'
Plug 'sgur/vim-textobj-parameter'
Plug 'saihoooooooo/vim-textobj-space'
Plug 'mattn/vim-textobj-url'
Plug 'kana/vim-textobj-line'           " line text object (w/o trailing ^M): yal, yil etc.
Plug 'thinca/vim-textobj-between'
Plug 'hafenr/vim-textobj-dotseparated'
Plug 'hafenr/vim-textobj-underscore'

Plug 'Shougo/vimproc.vim', { 'do': 'cd ~/.vim/plugged/vimproc.vim && make' }
Plug 'milkypostman/vim-togglelist'     " Toggle quickfix and location list
Plug 'editorconfig/editorconfig-vim'   " read .editorconfig files and set variables
Plug 'renamer.vim'                     " bulk rename by calling :Renamer

" By language
" Clojure
Plug 'guns/vim-clojure-static', { 'for': ['clojure', 'lisp', 'scheme'] }
Plug 'kien/rainbow_parentheses.vim', { 'for': ['clojure', 'lisp', 'scheme'] }
Plug 'tpope/vim-fireplace', { 'for': ['clojure', 'lisp', 'scheme'] }
Plug 'vim-scripts/paredit.vim', { 'for': ['clojure', 'lisp', 'scheme'] }

" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

" R
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'r' }
" Plug 'vim-pandoc/vim-rmarkdown', { 'for': 'r' }
Plug 'Vim-R-plugin'
" Plug 'nelstrom/vim-markdown-folding', { 'for': 'r' }
" Julia
" Plug 'JuliaLang/julia-vim'

" LaTeX
Plug 'LaTeX-Box-Team/LaTeX-Box', { 'for': 'tex' }
Plug 'Eckankar/vim-latex-folding', { 'for': 'tex' }

" JavaScript, TypeScript, CoffeeScript
Plug 'jason0x43/vim-js-indent', { 'for': 'javascript' }
Plug 'hafenr/typescript-vim'
Plug 'vim-coffee-script', { 'for': 'coffee' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }

" HTML, CSS/LESS
" Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'                 " Zencoding successor
Plug 'ervandew/screen', { 'for': 'tex' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'groenewege/vim-less'

" Python
Plug 'davidhalter/jedi-vim'
Plug 'lepture/vim-jinja', { 'for': 'html' }
Plug 'michaeljsmith/vim-indent-object' " Indent-level as text obj.
Plug 'bps/vim-textobj-python'          " Provides class: ac, ic; Function: af, if

" Scala
Plug 'spiroid/vim-ultisnip-scala', { 'for': 'scala' }
Plug 'vim-scala', { 'for': 'scala' }

call plug#end()
" }}}
"=======================================================================
" Startup {{{
"=======================================================================
if has('gui_running')               " gvim options
    if os == "Darwin"
        set guifont=Monaco\ for\ Powerline:h16
        " Send option presses to macvim. Allows binding <M-x>
        " but won't allow typing special characaters anymore.
        " set macmeta
    elseif os == "Linux"
        set guifont=Deja\ Vu\ Sans\ Mono\ 10
    endif
    colorscheme muon
else                                " terminal
    " set term=screen-256color
    set t_Co=256                    " set 256 colors for terminal
    set background=dark
    colorscheme muon
endif
" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let my_undo_dir = expand(vimdir . '/undo')
    " No console pops up
    call system('mkdir ' . my_undo_dir)
    let &undodir = my_undo_dir
    set undofile
endif
" }}}
"=======================================================================
" Basic settings {{{
"=======================================================================
set clipboard=unnamed

set nocompatible
set dictionary+=/usr/share/dict/words " Specify the builtin list of words for C-X C-K completion
set thesaurus+=~/.vim/extra/mthesaur.txt
set spelllang=en_us
set nospell
" set encoding="utf-8"
syntax on                           " enable syntax highlighting
set shiftwidth=4                    " number of spaces to autoindent
set tabstop=4                       " # spaces shown for one TAB
set softtabstop=4                   " # spaces that are actually inserted/removed for a tab
set expandtab                       " insert spaces when hitting TAB (with above options)
set autoindent                      " enable autoindenting
set relativenumber                  " view line numbers
set number                          " show current line number (others will still be relative)
set showmode                        " show current mode
set ruler                           " always show cursor position
set showcmd                         " display incomplete commands on lower right
set complete-=t
set hidden                          " edit another buffer while another one is unsaved
set lazyredraw                      " don't update the display while executing macros
set laststatus=2                    " always show status line
set autoread                        " automatically read a file that has changed on disk
" set ofu=syntaxcomplete#Complete     " autocompletion so that menu will always appear
" set cfu=
set wildmenu                        " show a menu of possible completions when TABing incomplete commands
set wildmode=list:longest,full      " how wild mode should behave
set guioptions-=T                   " remove toolbar in gVim
set guioptions-=r                   " remove right scrollbar
set guioptions-=R                   " remove right scrollbar
set guioptions-=l                   " remove left scrollbar
set guioptions-=L                   " remove left scrollbar
set hlsearch                        " highlight search results, C-/ to clear the highlighting
set incsearch                       " incremental search: search as you type the query string
set ignorecase                      " ignores case while searching
set smartcase                       " if a search contains a upper case char, make search case sensitive
set diffopt=vertical                " always split vertical with :diffsplit otherfile
set tags=./tags;/
set wildignore+=*.o,*.obj,.git,*.class,target,project,build " ignore files for command-t
set wrap                            " wrap whole words
set linebreak                       " vim will break lines at the chars given in 'set brakeat'
set showbreak=......\|\             " show linebreaks with: ......| wrapped text
set textwidth=0                     " don't insert EOLs at linebreak
set noswapfile                      " don't use swapfile
set nobackup                        " don't create backup files
set splitright                      " split vertical windows right to the current windows
set splitbelow                      " split horizontal windows below to the current windows
set so=7                            " keep 7 empty lines from the cursor to the border when scrolling with j or k
set mouse=a
set visualbell                      " no annoying beeping
set foldenable                      " enable folding
set foldlevelstart=20               " the fold level to show at file open (-1 is the default: fold all)
set foldlevel=20
set foldnestmax=20                  " maximal fold level to show (20 is the default)
set foldmethod=expr
" set colorcolumn=80                  " highlight the 80th col
set history=1000                    " set the command line history
set cmdwinheight=10                 " window height for cmd/search history q: q/ resp. C-h (C-f default)
" set relativenumber
set cursorline                      " Highlight current line
let grepprg="ag\ --nocolor\ --nogroup\ --silent"
set showmatch                       " Highlight (blinking) matching [{( when inserting the closing )}]
" set list listchars=tab:»·,trail:·,extends:$,nbsp:= " Display tabs and trailing whitespace
set list listchars=tab:⇥\ ,nbsp:·,trail:␣,extends:▸,precedes:◂
" }}}
"=======================================================================
" Auto commands {{{
"=======================================================================
" Alternative to autotags:
augroup general
    autocmd!
    autocmd BufEnter .vimrc setlocal foldmethod=marker
augroup END

" augroup typescript
"     autocmd!
"     au BufWritePost *.ts Neomake!
" augroup END

autocmd BufNewFile,BufRead,BufFilePre *.md set filetype=markdown
autocmd BufNewFile,BufRead,BufFilePre *.ts set filetype=typescript
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
"-----------------------------------------------------------------------
" Default
"-----------------------------------------------------------------------
" Automatically delete trailing whitespace
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
"-----------------------------------------------------------------------
" Python
"-----------------------------------------------------------------------
augroup Python
    autocmd!
    autocmd FileType python setlocal foldmethod=indent foldnestmax=2
    autocmd FileType python setlocal shiftwidth=4 tabstop=4
augroup END
"-----------------------------------------------------------------------
" Clojure
"-----------------------------------------------------------------------
function! SetClojureSettings()
    nnoremap <silent> <M-l> :<C-u>call PareditMoveRight()<CR>
    nnoremap <silent> <M-h> :<C-u>call PareditMoveLeft()<CR>
    nnoremap <silent> <C-l> :<C-u>call PareditMoveRight()<CR>
    nnoremap <silent> <C-h> :<C-u>call PareditMoveLeft()<CR>
endfunction
augroup Clojure
    autocmd!
    autocmd FileType clojure call SetClojureSettings()
    au BufEnter *.clj,*.cljs setlocal macmeta
    au VimEnter *.clj,*.el RainbowParenthesesActivate
    au Syntax   *.clj,*.el RainbowParenthesesLoadRound " ()
    au Syntax   *.clj,*.el RainbowParenthesesLoadSquare " []
    au Syntax   *.clj,*.el RainbowParenthesesLoadBraces " {}
    au Syntax   *.clj,*.el RainbowParenthesesLoadChevrons " <>
    " au BufWritePost *.cljs :BLReloadPage
augroup END
"-----------------------------------------------------------------------
" Latex
"-----------------------------------------------------------------------
augroup Autex
    autocmd!
    au FileType tex let b:delimitMate_matchpairs = "\(:\)"
    autocmd FileType tex setlocal spell
augroup END
" }}}
"======================================================================
" Mappings {{{1
"=======================================================================
" Basic {{{2 "
nnoremap ; :
xnoremap ; :
nnoremap , ;
xnoremap , ;
nnoremap <space>w :w<CR>
nnoremap <space>. :source ~/.vimrc<CR>
cnoremap jk <CR>

nmap <space>j <Plug>(easymotion-prefix)j
nmap <space>k <Plug>(easymotion-prefix)k
" Mappings for neovim
if has('nvim')
    " ESC escapes :term (can't send ESC to terminal
    " processes anymore)
    tnoremap <C-[> <C-\><C-n>
    " Select something visually and then CR
    " sends it to the next window which should be
    " :term
    :xnoremap <CR> y<C-w>wpA<CR><C-\><C-n><C-w>w
endif

" Moving lines
nnoremap <silent> <C-k> :move-2<cr>
nnoremap <silent> <C-j> :move+<cr>
" nnoremap <silent> <C-h> <<
" nnoremap <silent> <C-l> >>
xnoremap <silent> <C-k> :move-2<cr>gv
xnoremap <silent> <C-j> :move'>+<cr>gv
" xnoremap <silent> <C-h> <gv
" xnoremap <silent> <C-l> >gv

nnoremap ,f i=expand('%:t:r')<CR><ESC>

let mapleader='<space>'
let maplocalleader = ","
" map <space> <leader>

" nnoremap <silent> <C-right> :<C-u>call PareditMoveRight()<CR>
" nnoremap <silent> <C-left> :<C-u>call PareditMoveLeft()<CR>

" Select most recently pasted text
nnoremap gV `[v`]

" nnoremap <space>b :<C-u>Unite -start-insert -auto-resize buffer<CR>

" Append a comment
nnoremap <C-a> A  <C-r>=&comments[1]<CR>

" Insert an empty space
" nnoremap <S-space> i <ESC>

" nnoremap <S-space> :BLReloadPage<CR>

" Clear all highlightning
nnoremap <C-\> :noh<CR>

" After yanking or putting switch to the lower-end
" of the selection. This allows pasting multiple times
" the same selection (and generally feels more natural imo).
" vnoremap <silent> y y`]
" vnoremap <silent> p p`]
" nnoremap <silent> p p`]

" Select just pasted text
noremap gV `[v`]

nnoremap ,y "+y
vnoremap ,p "+p

" (highlighted text, normal paste via mouse3)
nnoremap ,,y "*y
nnoremap ,,p "*p
nnoremap ,Y "+yy

" Jump in the middle of the _current_ line, not the middle of
" the display
nnoremap <silent> gm :call cursor(0, virtcol('$')/2)<cr>

" THIS IS COPIED FROM TPOPE's PLUGIN VIM-RSI
" vim-rsi: https://github.com/tpope/vim-rsi/blob/master/plugin/rsi.vim
"
" It allows emacs-like navigation in command mode and insert mode
" The reason I didn't include the full plugin was that some of
" its meta-mappings messed with my keyboard layout
" BEGIN vim-rsi snippet
inoremap        <C-A> <C-O>^
inoremap   <C-X><C-A> <C-A>
cnoremap        <C-A> <Home>
cnoremap   <C-X><C-A> <C-A>

inoremap <expr> <C-B> getline('.')=~'^\s*$'&&col('.')>strlen(getline('.'))?"0\<Lt>C-D>\<Lt>Esc>kJs":"\<Lt>Left>"
cnoremap        <C-B> <Left>

inoremap <expr> <C-D> col('.')>strlen(getline('.'))?"\<Lt>C-D>":"\<Lt>Del>"
cnoremap <expr> <C-D> getcmdpos()>strlen(getcmdline())?"\<Lt>C-D>":"\<Lt>Del>"

inoremap <expr> <C-E> col('.')>strlen(getline('.'))?"\<Lt>C-E>":"\<Lt>End>"

inoremap <expr> <C-F> col('.')>strlen(getline('.'))?"\<Lt>C-F>":"\<Lt>Right>"
cnoremap <expr> <C-F> getcmdpos()>strlen(getcmdline())?&cedit:"\<Lt>Right>"
" END vim-rsi snippet

" c_CTRL-F is remapped to c_CTRL-H for 'history'
cnoremap <C-h> <C-f>

" Insert line above/below curser
nnoremap <leader>j o<ESC>k
nnoremap <leader>k O<ESC>j

" Go to next fold
nnoremap <M-j> zj
nnoremap <M-k> zk

" Navigate quickfix list
" nnoremap ]q :cnext<CR>
" nnoremap [q :cprevious<CR>

" Scroll by visual lines
nnoremap j gj
nnoremap k gk

" Create a file of the same name with _test appended.
nnoremap ,te :e =expand('%:r') . '_test.' . expand('%:e')<CR><CR>

" Markdown
inoremap <C-h>1 <ESC>yypVr=o
inoremap <C-h>2 <ESC>yypVr-o
nnoremap ,h1 yypVr=
nnoremap ,h2 yypVr-

" Emmet
imap <C-l> <C-y>,

" Git
nnoremap <space>gg :Gstatus<CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gp :Git push<CR>

" Undotree
nnoremap <F4> :UndotreeToggle<CR>

" Quickfix
nmap <script> <silent> <space>l :call ToggleLocationList()<CR>
nmap <script> <silent> <space>q :call ToggleQuickfixList()<CR>
" Navigating quickfix list (gets populated by e.g. vimgrep/ag)
nnoremap ]q     :cnext<CR>
nnoremap ]Q     :cfirst<CR>
nnoremap [q     :cprevious<CR>
nnoremap [Q     :clast<CR>
" Navigating the location list (gets populated by e.g. Syntastic)
nnoremap ]w     :lnext<CR>
nnoremap ]W     :lfirst<CR>
nnoremap [w     :lprevious<CR>
nnoremap [W     :llast<CR>

" Ex
nnoremap <space>; :CtrlPCmdPalette<CR>

" Tags
nnoremap <space>ta :CtrlPTag<CR>

" Projects
nnoremap <space>pp :CtrlPBookmarkDir<CR>
nnoremap <space>pf :CtrlP<CR>
nnoremap <space>pt :NERDTreeToggle<CR>
nnoremap <space>pa :CtrlPBookmarkDirAdd
nnoremap <space>ps :Ag ""<Left>

" Dirs
nnoremap <space>dl :lcd %:p:h<CR>
nnoremap <space>dc :cd %:p:h<CR>
nnoremap <space>dd :CtrlPDir<CR>

" Search stuff
" Search (l)ines
nnoremap <space>sl :CtrlPLine<CR>
" Search (r)ecursively
nnoremap <space>sr :Ag ""<Left>
" Search (b)uffer
nnoremap <space>sb :%s/
" Search (c)lear
nnoremap <space>sc :noh<CR>

" Files
nnoremap <space>fr :CtrlPMRUFiles<CR>
nnoremap <space>ft :NERDTreeFind<CR>
nnoremap <space>fs :w<CR>

" Buffers
nnoremap <space>r :CtrlPBuffer<CR>
nnoremap <space>ls :CtrlPBuffer<CR>

" Toggle features
nnoremap <space>ti :IndentLinesToggle<CR>

" Registers
nnoremap <space>R :<C-u>Unite -start-insert register<CR>

" Windows
nnoremap <C-w>m :MaximizerToggle<CR>
vnoremap <C-w>m :MaximizerToggle<CR>gv

" Command-Arrow to resize current buffer by +/- 5
" :vert res +5 <CR> and then repeat last ex-command with @: @@ @@ @@
nnoremap <C-w>< 10<C-w><
nnoremap <C-w>> 10<C-w>>
nnoremap <C-w>- 10<C-w>-
nnoremap <C-w>+ 10<C-w>+


" Ctrl-Space for completions.
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" NERDTree
" Open NERDTree at the location of the current file
" nnoremap <F2> :NERDTreeToggle<CR>
" nnoremap <S-F2> :NERDTreeFind<CR>

" Tagbar
" nnoremap <F3> :TagbarToggle<CR>

" UltiSnips
" nnoremap <leader>ue :UltiSnipsEdit<CR>
" 2}}}
" 1}}}
"=======================================================================
" Abbreviations {{{
"=======================================================================
" recursive search with :e
" :e r/filename
" cabbrev r ./**
cabbrev stat ~/Dropbox/CBB/StatMethods
" }}}
"=======================================================================
" Plugin settings {{{1
"=======================================================================
" {{{2 delimitMate
"-----------------------------------------------------------------------
let delimitMate_expand_cr = 1
" 2}}}
" {{{2 indentLine
"-----------------------------------------------------------------------
" ¦ ┆ ︙ │
" Enable with :IndentLinesToggle
let g:indentLine_char = '┆'
" 2}}}
" {{{2 LaTeX-Box
"-----------------------------------------------------------------------
let g:LatexBox_viewer = 'open -a Skim'
" 0: Don't open quickfix, 2: Open but don't make it the active window
let g:LatexBox_quickfix = 0
" let g:main_tex_file = '~/Dev/dcop-bachelor-thesis/thesis/thesis.tex'
let g:tex_flavor = "latex"
let g:LatexBox_latexmk_options = "-pvc -pdf"
" 2}}}

" {{{2 Maximizer
"-----------------------------------------------------------------------
let g:maximizer_set_default_mapping = 0
" 2}}}

" {{{2 Ag
"-----------------------------------------------------------------------
set grepprg=ag\ --column " then navigate qf window with ]q and [q
" 2}}}

" {{{2 R Plugin
"-----------------------------------------------------------------------
let g:vimrplugin_assign='<'
let vimrplugin_assign_map = "<M-->"

let r_syntax_folding = 1
if !has('gui_running')
    let vimrplugin_term = "/Applications/iTerm.app/Contents/MacOS/iTerm"
    let vimrplugin_term_cmd =  "/Applications/iTerm.app/Contents/MacOS/iTerm"
    let vimrplugin_applescript = 0
    let g:ScreenImpl = 'Tmux'
    let vimrplugin_vsplit = 1 " For vertical tmux split"
    let g:ScreenShellInitialFocus = 'shell'
    " instruct to use your own .screenrc file
    " For integration of r-plugin with screen.vim
    " Don't use conque shell if installed
    let vimrplugin_conqueplugin = 0
    " see R documentation in a Vim buffer
    let vimrplugin_vimpager = 'no'
endif
" 2}}}

" {{{2 YouCompleteMe
"-----------------------------------------------------------------------
" Removed TAB form list of select_completion keys since UltiSnips uses that key.
" Select elemens by <C-n>, <C-p>
let g:ycm_auto_trigger = 0
let g:ycm_key_list_select_completion = ['<Down>'] " Tab removed
let g:ycm_key_list_previous_completion = ['<Up>'] " S-Tab removed
" let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_min_num_of_chars_for_completion = 2 " default 2
let g:ycm_min_num_identifier_candidate_chars = 0 " default 0
" Can make vim slower if tags file is on a network dir
let g:ycm_collect_identifiers_from_tags_files = 1
let g:pymode_rope_complete_on_dot = 0
let g:ycm_seed_identifiers_with_syntax = 1
" 2}}}

" {{{2 UltiSnips
"-----------------------------------------------------------------------
" Default Keybindings
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsEditSplit='vertical'
let g:snips_author="Robin Hafen"
let g:snips_email="robin.hafen@gmail.com"
let g:snips_github="https://github.com/hafenr"
" 2}}}

" {{{2 Syntastic
"-----------------------------------------------------------------------
let g:syntastic_warning_symbol='⚠'
let g:syntastic_error_symbol='✗'
let g:syntastic_r_lint_styles = 'list(spacing.indentation.notabs, spacing.indentation.evenindent)'
let g:syntastic_r_checkers = ["lint", "svTools"]
let g:syntastic_enable_r_svtools_checker = 1
let g:syntastic_enable_r_lint_checker = 1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-", " proprietary attribute \"tm-"]

" Remember to actually install all the syntax errors and style checkers"
" pip install pyflakes pep8 pep257 flake8 pylint etc.
" npm install -g jslint coffeelint # js, html, and coffee
" npm install -g csslint
" npm install -g w3 # also html
" cabal install hlint
let g:syntastic_python_checkers = ['pyflakes', 'flake8']
let g:syntastic_haskell_checkers = ['hlint']
" 2}}}

" {{{2 Vim-slime
"-----------------------------------------------------------------------
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
" 2}}}

" {{{2 Jedi
"-----------------------------------------------------------------------
" let g:jedi#use_splits_not_buffers = "left"
let g:jedi#auto_initialization = 0
let g:jedi#show_call_signatures = 2 " 0 is off, 2 is display in mode line
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "bottom"
" let g:jedi#goto_assignments_command = ",g"
" let g:jedi#goto_definitions_command = ",d"
" let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = ",n"
" let g:jedi#completions_command = "<C-Space>"
" let g:jedi#rename_command = ",r"
" let g:jedi#show_call_signatures = "1"
" 2}}}

" {{{2 EasyAlign
"-----------------------------------------------------------------------
" Start interactive EasyAlign in visual mode
" :EasyAlign */regex aligns on all matches of regex, 2/regex on every second etc.
vmap ,al <Plug>(EasyAlign)
" 2}}}

" Netrw {{{2 "
"-----------------------------------------------------------------------
let g:netrw_preview = 1 " p previews file in vertical split
let g:netrw_altv = 0  " Split to the right
" 2}}} "

" Clever-f {{{2 "
"-----------------------------------------------------------------------
" Don't search across lines
let g:clever_f_across_no_line = 1
" let g:clever_f_smart_case = 1
" Let ; match any sign character, i.e. use f;
" let g:clever_f_chars_match_any_signs = ';'
" 2}}} "

" Unite {{{2 "
"-----------------------------------------------------------------------
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
let g:unite_data_directory='~/.vim/.cache/unite'

let g:unite_source_history_yank_enable = 1
let g:unite_split_rule = 'botright'
" let g:unite_enable_start_insert=1  " or just use -start-insert
let g:unite_prompt='» '

" nnoremap <space>o :<C-u>Unite -auto-resize outline<CR>
" nnoremap <space>f :<C-u>Unite -start-insert -auto-resize file_rec/git<CR>
" nnoremap <space>e :<C-u>UniteWithBufferDir -start-insert -auto-resize file<CR>

if executable('ag')
    let g:unite_source_rec_async_command = 'ag --nogroup --nocolor --column --hidden ' .
       \ '--ignore ".git" ' .
       \ '--ignore "app/assets/fonts" ' .
       \ '--ignore "app/assets/images" ' .
       \ '--ignore "node_modules/" ' .
       \ '--ignore "bower_components/" ' .
       \ '--ignore "public/uploads" -g '

    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
    let g:unite_source_grep_recursive_opt=''
endif

nnoremap <space>m :Unite -auto-resize file file_mru file_rec<cr>
" 2}}} "

" {{{2 Ctrlp
"-----------------------------------------------------------------------
let g:ctrlp_map = '<C-p>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1
let g:ctrlp_cmdpalette_execute = 1

" While in directory mode:
" <cr> change the local working directory for CtrlP and keep it open.
" <c-t> change the global working directory (exit).
" <c-v> change the local working directory for the current window (exit).
" <c-x> change the global working directory to CtrlP's current local

" Default is search by full path. Switch with CTRL-d while in CtrlP prompt.
" let g:ctrlp_by_filename = 0
let g:ctrlp_root_markers = ['.ctrlp']

let g:ctrlp_custom_ignore = {
\   'dir':  '\v(\.git|\.hg|\.svn|\.yardoc|public/images|public/system|data|tmp|resources/public/js|node_modules|bower_components)$',
\   'file': '\v\.(o|m4a|pdf|swp|pyc|wav|mp3|ogg|blend|dvi|fls|aux|blg|bbl|log|loa|lof|toc|fdb_latexmk|lot|js.map|min.js|min.css|)$|\~$'
\   }

" Save cache across sessions => much faster. Refresh with F5.
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" 2}}}

" {{{2 Airline
" : %3p : %4l : %3c
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'
let g:airline_section_y = airline#section#create(["cwd:%{split(getcwd(), '/')[-1]}% "])
set noshowmode
" 2}}}

" {{{2 Typescript
" : %3p : %4l : %3c
let g:typescript_compiler_use_tsconfig = 1
set noshowmode
" 2}}}

" 1}}}
"=======================================================================
" Custom functions and commands {{{
"=======================================================================
" CLOJURESCRIPT
" 1) Open vim
" 2) Back in the terminal, run lein repl
" 3) In the repl, do (run)
" 4) In vim, open the cljs file and do
" :Piggieback (weasel.repl.websocket/repl-env :ip "0.0.0.0" :port 9001)
" 5) Open browser to http://localhost:10555/
" 6) Use fireplace
command! ConnectChestnut Piggieback (weasel.repl.websocket/repl-env :ip "0.0.0.0" :port 9001)
" From another user on SO (maybe useful in the future):
command! Piggie :Piggieback (cemerick.austin/exec-env)
command! Biggie :Piggieback (cemerick.austin/exec-env :exec-cmds ["open" "-ga" "/Applications/Google Chrome.app"])
command! Wiggie :Piggieback (weasel.repl.websocket/repl-env :ip "0.0.0.0" :port 9001)

" Command line with automatic history
" (instead of having to press C-f bzw. C-h)
" BEGIN CL
" Swap default ':', '/' and '?' with cmdline-window equivalent.
" nnoremap ; q:
" xnoremap ; q:
" nnoremap / q/
" xnoremap / q/
" nnoremap ? q?
" xnoremap ? q?
" nnoremap q; :
" xnoremap q; :
" nnoremap q/ /
" xnoremap q/ /
" nnoremap q? ?
" xnoremap q? ?
" augroup command_window
"     autocmd!
"     " have <Ctrl-C> leave cmdline-window
"     autocmd CmdwinEnter * nnoremap <buffer> <C-c> :q\|echo ""<cr>
"     autocmd CmdwinEnter * inoremap <buffer> <C-c> <esc>:q\|echo ""<cr>
"     autocmd CmdwinEnter * nnoremap <buffer> <jk> :q\|echo ""<cr>
"     autocmd CmdwinEnter * inoremap <buffer> <jk> <esc>:q\|echo ""<cr>
"     " start command line window in insert mode and no line numbers
"     autocmd CmdwinEnter * startinsert
"     autocmd CmdwinEnter * set nonumber
"     autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
" augroup END
" END CL

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" Edit vimrc
command! Rc e ~/.vimrc

" Change between tab sizes
function! SetTabSize(number)
    exec "set expandtab tabstop=" . a:number
    exec "set shiftwidth=" . a:number
    exec "set softtabstop=" . a:number
endfunc

command! -nargs=1 Tab call SetTabSize(<f-args>)

function! RoundNumber(digits)
    let word_under_cursor = expand("<cWORD>")
    let unrounded_str = matchstr(word_under_cursor, "[0-9]*\.[0-9][0-9]*")
    let unrounded = str2float(unrounded_str)
    let format_str = "%." . a:digits . "f"
    let rounded = printf(format_str, unrounded)
    let cmd = printf("s/%s/%s", unrounded_str, rounded)
    execute cmd
    set nohlsearch
    execute "normal ``"
endfunc

command! -nargs=1 Round call RoundNumber(<f-args>)

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction

vmap <silent> <expr> p <sid>Repl()

" }}}
"=======================================================================
" End {{{
"=======================================================================
" Show insert cursor as yellow and normal mode cursor as light green.
highlight Cursor guifg=black guibg=#00ff1e
highlight iCursor guifg=black guibg=cyan
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkon0
" }}}
"=======================================================================
