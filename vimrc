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

" For Vundle
set nocompatible
filetype off

" Automatically setup Vundle on first run
if !isdirectory(expand("~/.vim/bundle/Vundle.vim"))
    call system("git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim")
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin("$HOME/.vim/bundle")
call pathogen#infect("pathogen/*")
" }}}
"=======================================================================
" Plugins {{{
"=======================================================================
" Essential
Plugin 'gmarik/Vundle.vim'               " Let Vundle manage Vundle
Plugin 'tpope/vim-commentary'            " Commenting operator gc
Plugin 'SirVer/ultisnips'                " Snippet system
Plugin 'honza/vim-snippets'              " Snippets
Plugin 'Xuyuanp/git-nerdtree'            " Nerd tree with git integration
Plugin 'dhruvasagar/vim-vinegar'         " Vinegar for NerdTree
Plugin 'delimitMate.vim'                 " Automatically close pairs (where appropriate)
Plugin 'kien/ctrlp.vim'                  " Fuzzy file finder
Plugin 'bling/vim-airline'               " Fancy status bar
Plugin 'tpope/vim-fugitive'              " Git plugin
Plugin 'tpope/vim-repeat'                " Repeat all kinds of stuff
Plugin 'tpope/vim-surround'              " Surround motions
Plugin 'mbbill/undotree'                 " Undo history as a tree
Plugin 'rking/ag.vim'                    " Silver searcher: faster vimgrep/grep:
Plugin 'kana/vim-textobj-line'           " line text object (w/o trailing ^M): yal, yil etc.
" Plugin 'haya14busa/incsearch.vim'
Plugin 'PeterRincker/vim-argumentative'  " i, a, text objects; >, <, movement
Plugin 'szw/vim-maximizer'               " Temporarily maximize window
Plugin 'vim-scripts/YankRing.vim'
Plugin 'ludovicchabant/vim-gutentags'


" Nice to have
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'chrisbra/csv.vim'
Plugin 'salsifis/vim-transpose'
Plugin 'junegunn/vim-easy-align'         " :'<,'>EasyAlign [*] DELIM or /regex/
Plugin 'godlygeek/tabular'               " :Tabularize /regex
Plugin 'jwhitley/vim-matchit'            " More jumps for %
Plugin 'michaeljsmith/vim-indent-object' " Indent-level as text obj.
Plugin 'othree/xml.vim'                  " XML editing
Plugin 'junegunn/seoul256.vim'           " Nice color scheme
Plugin 'scrooloose/syntastic'
Plugin 'ivyl/vim-bling'
Plugin 'yaifa.vim'
Plugin 'mattn/emmet-vim'                 " Zencoding successor
Plugin 'kana/vim-textobj-user'           " Needed for textobj-python
Plugin 'bps/vim-textobj-python'          " Provides class: ac, ic; Function: af, if
" Plugin 'jeetsukumaran/vim-markology'
Plugin 'mhinz/vim-startify'
Plugin 'tomasr/molokai'
Plugin 'Shougo/vimproc.vim'              " Do `$ make` after update
" Plugin 'Valloric/YouCompleteMe'        " $ Do `./install.sh` after update
Plugin 'tpope/vim-obsession'
" Plugin 'tpope/vim-abolish'
Plugin 'milkypostman/vim-togglelist'     " Toggle quickfix and location list
Plugin 'jpalardy/vim-slime'              " REPL interaction
Plugin 'majutsushi/tagbar'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'rizzatti/dash.vim'
Plugin 'https://github.com/freeo/vim-kalisi'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'croaker/mustang-vim'
Plugin 'renamer.vim'
Plugin 'rhysd/clever-f.vim'

" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-easytags'

" By language
" Swift
Plugin 'Keithbsmiley/swift.vim'

" Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'vim-scripts/paredit.vim'
Plugin 'tpope/vim-sexp-mappings-for-regular-people.git'
Plugin 'guns/vim-sexp.git'

" Ruby
Plugin 'vim-ruby/vim-ruby'

" R
" Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'Vim-R-plugin'
Plugin 'nelstrom/vim-markdown-folding'
" Julia
" Plugin 'JuliaLang/julia-vim'

" LaTeX
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'Eckankar/vim-latex-folding'

" JavaScript, TypeScript, CoffeeScript
Plugin 'jason0x43/vim-js-indent'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-coffee-script'

" HTML, CSS/LESS
" Plugin 'ap/vim-css-color'
Plugin 'ervandew/screen'
Plugin 'groenewege/vim-less'
Plugin 'lepture/vim-jinja'
Plugin 'jaxbot/brolink.vim'
Plugin 'othree/html5.vim'

" Python
Plugin 'django.vim'
" Plugin 'davidhalter/jedi-vim'

" Scala
Plugin 'spiroid/vim-ultisnip-scala'
Plugin 'vim-scala'

" Matlab
Plugin 'matlab.vim'

call vundle#end()            " required
filetype plugin indent on    " required
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

    " let g:seoul256_background = 236 " Range: 233 - 239"
    " set background=dark

    colorscheme lucius
    LuciusDark
else                                " terminal
    " set term=screen-256color
    set t_Co=256                    " set 256 colors for terminal
    set background=dark

    colo lucius
    LuciusDark
    " colo mustang
endif

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let my_undo_dir = expand(vimdir . '/undo')
    " No console pops up
    call system('mkdir ' . my_undo_dir)
    let &undodir = my_undo_dir
    set undofile
endif

" Default python imports
py import vim, sys
py from vim import buffers, windows, command, current, error

set rtp+=/usr/local/lib/node_modules/typescript-tools
" }}}
"=======================================================================
" Basic Settings {{{
"=======================================================================
set clipboard=unnamed
" Specify the builtin list of words for C-X C-K completion
set dictionary+=/usr/share/dict/words
set thesaurus+=~/.vim/extra/mthesaur.txt
set spelllang=en_us
set nospell
set encoding=utf-8
syntax on                           " enable syntax highlighting
set shiftwidth=4                    " number of spaces to autoindent
set tabstop=4                       " # spaces shown for one TAB
set softtabstop=4                   " # spaces that are actually inserted/removed for a tab
set expandtab                       " insert spaces when hitting TAB (with above options)
set autoindent                      " enable autoindenting
" set number                          " view line numbers
set showmode                        " show current mode
set ruler                           " always show cursor position
set showcmd                         " display incomplete commands on lower right
set complete-=t
set hidden                          " edit another buffer while another one is unsaved
set lazyredraw                      " don't update the display while executing macros
set laststatus=2                    " always show status line
set autoread                        " automatically read a file that has changed on disk
set ofu=syntaxcomplete#Complete     " autocompletion so that menu will always appear
set cfu=
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
set nobackup            	    " don't create backup files
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
" Autocommands {{{
"=======================================================================
" Alternative to autotags:
augroup ctags
    autocmd!
    " au BufWritePost *.R,*.r,*.Rmd,*.py,*.scala,*.clj,*.coffee silent! !ctags -R &
augroup END

augroup general
    autocmd!
    autocmd BufEnter .vimrc setlocal foldmethod=marker
augroup END

autocmd BufNewFile,BufRead,BufFilePre *.md set filetype=markdown
autocmd BufNewFile,BufRead,BufFilePre *.ts set filetype=typescript
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
"-----------------------------------------------------------------------
" Default
"-----------------------------------------------------------------------
" Automatically delete trailing whitespace
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" ---------------------------------------------------------------------
" HTML, XML
" ---------------------------------------------------------------------
" augroup au_HTML_XML
"     autocmd Filetype html,xml,xsl source ~/.vim/plugin/closetag.vim
" augroup END

"-----------------------------------------------------------------------
" R
"-----------------------------------------------------------------------
" augroup R
"     autocmd!
"     au FileType r set iskeyword+=.

"     function! SetRmdOptions()
"         setfiletype rmarkdown.rmd
"     endfunction

"     autocmd BufEnter,BufRead *.Rmd call SetRmdOptions()
" augroup END

"-----------------------------------------------------------------------
" Python
"-----------------------------------------------------------------------
augroup Python
    autocmd!
    autocmd FileType python setlocal foldmethod=indent foldnestmax=2
    autocmd FileType python setlocal shiftwidth=4 tabstop=4
    " autocmd FileType python set omnifunc=pythoncomplete#Complete
    " autocmd FileType python setlocal ofu=jedi#completions
    " autocmd BufWritePost *.py silent! !ctags -R --exclude=.git --exclude=lib --exclude=external --languages=python
augroup END


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
    " autocmd FileType tex set mps+=$:$
    au FileType tex let b:delimitMate_matchpairs = "\(:\)"
    autocmd FileType tex setlocal spell
    " autocmd FileType tex let b:AutoPairs['$'] = '$'
    " autocmd FileType tex nnoremap <buffer> <leader>c <leader>ll
    " autocmd FileType tex nnoremap <buffer> <leader>v <leader>lv
augroup END

augroup Darwin
    autocmd!
    autocmd BufRead,BufNewFile *.drw set filetype=darwin
augroup END


"-----------------------------------------------------------------------
" Markdown
"-----------------------------------------------------------------------
augroup Markdown
    " autocmd FileType markdown set foldmethod=marker
    " autocmd FileType markdown set foldmarker=-------------------------------------------------------------------------------,*******************************************************************************
augroup END
" }}}
"=======================================================================
" Mappings {{{1
"=======================================================================
" Basic {{{2 "

" Command-Arrow to resize current buffer by +/- 5
" :vert res +5 <CR> and then repeat last ex-command with @: @@ @@ @@
nnoremap <C-w>< 10<C-w><
nnoremap <C-w>> 10<C-w>>
nnoremap <C-w>- 10<C-w>-
nnoremap <C-w>+ 10<C-w>+

" let mapleader=""
let maplocalleader = ","
map <space> <leader>

" nnoremap <silent> <C-right> :<C-u>call PareditMoveRight()<CR>
" nnoremap <silent> <C-left> :<C-u>call PareditMoveLeft()<CR>

" Select most recently pasted text
nnoremap gV `[v`]

" Easier access to command-window
" Use ; for command line since it's easier to type
nnoremap ; :
xnoremap ; :
cnoremap jk <CR>

" Show the registers
nnoremap <leader>R :reg<CR>

nnoremap <leader>so :source ~/.vimrc<CR>
nnoremap <leader>w :w<CR>

" Append a comment
nnoremap <C-a> A  <C-r>=&comments[1]<CR>

" Insert an empty space
nnoremap <S-space> i <ESC>

nnoremap <S-space> :BLReloadPage<CR>

" Clear all highlightning
nnoremap <C-\> :noh<CR>

" After yanking or putting switch to the lower-end
" of the selection. This allows pasting multiple times
" the same selection (and generally feels more natural imo).
" vnoremap <silent> y y`]
" vnoremap <silent> p p`]
" nnoremap <silent> p p`]

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

" Empty line above, below
nnoremap [<leader> O<ESC>j
nnoremap ]<leader> o<ESC>k

" Select just pasted text
noremap gV `[v`]

nnoremap ,y "+y
vnoremap ,p "+p

" (highlighted text, normal paste via mouse3)
nnoremap ,,y "*y
nnoremap ,,p "*p
nnoremap ,Y "+yy

" Knit to pdf
" nnoremap <leader>R :!Rscript -e "require(knitr); knit2pdf('<C-R>%')"<CR>

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

" Typing ,lcd or ,cd will switch the (local)
" working directory to the current file's
nnoremap <leader>cld :lcd %:p:h<CR>
nnoremap <leader>cd :cd %:p:h<CR>

" Scroll by visual lines
nnoremap j gj
nnoremap k gk

" 2}}}

" Plugin mapings {{{2 "

" Markdown
inoremap <C-h>1 <ESC>yypVr=o
inoremap <C-h>2 <ESC>yypVr-o
nnoremap ,h1 yypVr=
nnoremap ,h2 yypVr-

" TypeScript Server
" type of symbol under cursor
nnoremap ,tt :TSStype<CR>
nnoremap ,td :TSSdef<CR>

" Ag
nnoremap <leader>a :Ag ""<Left>

" Fugitive
nnoremap <leader>gg :Gstatus<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Git push<CR>
" nmap <leader><leader> V

" Undotree
nnoremap <F4> :UndotreeToggle<CR>

" Emmet, remap to something less awkward
imap <C-e> <C-y>,

nmap <script> <silent> <leader>l :call ToggleLocationList()<CR>
nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>

nnoremap <C-w>m :MaximizerToggle<CR>
vnoremap <C-w>m :MaximizerToggle<CR>gv

" Look up word under cursor with Dash
nnoremap gK :Dash<CR>

" CtrlP

" While in prompt: C-b and C-f switch search modes
" C-j C-k allow navigation in results list
" <CR> opens file in current window
" <C-v> opens file in vertical split
" <C-s> opens file in horizontal split

" (e)dit
let g:ctrlp_map = '<C-p>'
nnoremap <leader>e :CtrlPMixed<CR>
nnoremap <leader>o :CtrlPMixed<CR>
" buffe(r)
nnoremap <leader>r :CtrlPBuffer<CR>
" (d)efinitions
nnoremap <leader>d :CtrlPTag<CR>

nnoremap <leader>L :CtrlPLine<CR>
nnoremap <leader>F :CtrlPMRUFiles<CR>
nnoremap <leader>D :CtrlPBookmarkDir<CR>

" LateX-Box
nnoremap ,xv :LatexView<CR>
nnoremap ,xc :Latexmk<CR>

" NERDTree
" Open NERDTree at the location of the current file
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <S-F2> :NERDTreeFind<CR>

" Tagbar
nnoremap <F3> :TagbarToggle<CR>

" YankRing
nnoremap <leader>p :YRShow<CR>
let g:yankring_replace_n_pkey = '<M-p>'
let g:yankring_replace_n_nkey = '<M-n>'

" UltiSnips
nnoremap <leader>ue :UltiSnipsEdit<CR>
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

" {{{2 Latex2Unicode
"-----------------------------------------------------------------------
let g:unicoder_cancel_normal = 1
let g:unicoder_cancel_insert = 1
nmap <C-y> :call unicoder#start(0)<CR>
imap <C-y> <Esc>:call unicoder#start(1)<CR>
" 2}}}

" {{{2 Startify
"-----------------------------------------------------------------------
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
" 2}}}

" {{{2 delimitMate
"-----------------------------------------------------------------------
let delimitMate_expand_cr = 1
" 2}}}

" {{{2 Brolink
"-----------------------------------------------------------------------
let g:bl_no_mappings = 1
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

" Remember to actually install all the syntax errors and style checkers"
" pip install pyflakes pep8 pep257 flake8 pylint etc.
" npm install -g jslint coffeelint # js, html, and coffee
" npm install -g csslint
" npm install -g w3 # also html
" cabal install hlint
let g:syntastic_python_checkers = ['pyflakes', 'flake8']
let g:syntastic_haskell_checkers = ['hlint']
" 2}}}

" " {{{2 Tagbar
" "-----------------------------------------------------------------------
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }

let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
    \ ]
\ }

let g:tagbar_type_markdown = {
	\ 'ctagstype' : 'markdown',
	\ 'kinds' : [
		\ 'h:Heading_L1',
		\ 'i:Heading_L2',
		\ 'k:Heading_L3'
	\ ]
\ }

let g:tagbar_type_coffee = {
    \ 'ctagstype' : 'coffee',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 'm:methods',
        \ 'f:functions',
        \ 'v:variables',
        \ 'f:fields',
    \ ]
\ }
" 2}}}

" {{{2 Vim-slime
"-----------------------------------------------------------------------
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
" 2}}}

" {{{2 Jedi
"-----------------------------------------------------------------------
" let g:jedi#use_tabs_not_buffers = 0
" " let g:jedi#use_splits_not_buffers = "left"
" let g:jedi#popup_on_dot = 0
" let g:jedi#popup_select_first = 0
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

" Unite {{{2 "
"-----------------------------------------------------------------------
let g:unite_source_history_yank_enable = 1
noremap <leader>y :<C-u>Unite history/yank<CR>
" 2}}} "

" EasyTags {{{2 "
"-----------------------------------------------------------------------
" let g:easytags_opts = []
" let g:easytags_async = 1
" let g:easytags_by_filetype = 1

" let g:easytags_languages = {
" \   'language': {
" \     'cmd': g:easytags_cmd,
" \       'args': ['--exclude=*.min.js'],
" \       'fileoutput_opt': '-f',
" \       'stdout_opt': '-f-',
" \       'recurse_flag': '-R'
" \   }
" \}
" 2}}} "

" Clever-f {{{2 "
"-----------------------------------------------------------------------
" Don't search across lines
let g:clever_f_across_no_line = 1
" 2}}} "

" {{{2 Ctrlp
"-----------------------------------------------------------------------
" r: Try to search for a root directory (containing .git, .ctrlp, etc.)
" and set that dir as the working dir
" c: working directory
" let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1

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

" {{{2 vim-textobj-user
call textobj#user#plugin('rchunk', {
\   'code': {
\     'select-a': 'ar',
\     'select-a-function': 'RChunkA',
\     'select-i': 'ir',
\     'select-i-function': 'RChunkI',
\   },
\ })

function! RChunkA()
    set noincsearch
    set nohlsearch
    execute "norm ?```"
    let upper_pos = getpos('.')
    echom upper_pos[1]
    execute "norm /```"
    let lower_pos = getpos('.')
    set nohlsearch
    set incsearch
    return ['V', upper_pos, lower_pos]
endfunction

function! RChunkI()
    set noincsearch
    set nohlsearch
    execute "norm ?```"
    norm! j
    let upper_pos = getpos('.')
    execute "norm /```"
    norm! k
    let lower_pos = getpos('.')
    set nohlsearch
    set incsearch
    return ['V', upper_pos, lower_pos]
endfunction
" 2}}} "

" {{{2 Airline
" : %3p : %4l : %3c
if has('gui_running')
    let g:airline_powerline_fonts = 1
    let g:airline_theme='dark'
endif
let g:airline_section_y = airline#section#create(["cwd:%{split(getcwd(), '/')[-1]}% "])
set noshowmode
" 2}}}

" {{{2 Markology
 let g:markology_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
" 2}}}

" {{{2 incsearch.vim
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

" Enable mappings below for automatic 'nohlsearch' after hitting the last match:

" set hlsearch
" let g:incsearch#auto_nohlsearch = 1
" map n  <Plug>(incsearch-nohl-n)
" map N  <Plug>(incsearch-nohl-N)
" map *  <Plug>(incsearch-nohl-*)
" map #  <Plug>(incsearch-nohl-#)
" map g* <Plug>(incsearch-nohl-g*)
" map g# <Plug>(incsearch-nohl-g#)
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
" Colors {{{
"=======================================================================
" Conceal background should be the same as seoul256 bg
hi Conceal guibg=#3f3f3f
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
