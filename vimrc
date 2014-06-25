"================================================================
"                __     _____ __  __ ____   ____
"                \ \   / /_ _|  \/  |  _ \ / ___|
"                 \ \ / / | || |\/| | |_) | |
"                  \ V /  | || |  | |  _ <| |___
"                   \_/  |___|_|  |_|_| \_\\____|
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"                            2014-03-28
"================================================================
" General {{{
"================================================================
let os = substitute(system('uname'), "\n", "", "")
let vimdir = '$HOME/.vim'

" For Vundle
set nocompatible
filetype off

" Let Vundle manage Vundle
set rtp+=~/.vim/vundle_managed/Vundle.vim
call vundle#begin("$HOME/.vim/vundle_managed")
call pathogen#infect("pathogen_managed/*")
" }}}
"================================================================
" Plugins {{{
"================================================================
" Essential
Plugin 'PeterRincker/vim-argumentative'  " i, a, text objects; >, <, movement
Plugin 'SirVer/ultisnips'                " Snippet system
Plugin 'Xuyuanp/git-nerdtree'            " Nerd tree with git integration
Plugin 'bling/vim-airline'               " Fancy status bar
Plugin 'gmarik/Vundle.vim'               " Package manager
Plugin 'honza/vim-snippets'              " Snippets
Plugin 'delimitMate.vim'                 " Automatically close pairs (where appropriate)
Plugin 'junegunn/vim-easy-align'         " :'<,'>EasyAlign [*] DELIM or /regex/
Plugin 'godlygeek/tabular'               " :Tabularize /regex
Plugin 'jwhitley/vim-matchit'            " More jumps for %
Plugin 'kien/ctrlp.vim'                  " Fuzzy file finder
Plugin 'mbbill/undotree'                 " Undo history as a tree
Plugin 'michaeljsmith/vim-indent-object' " Indent-level as text obj.
Plugin 'szw/vim-maximizer'               " Temporarily maximize window
Plugin 'tpope/vim-commentary'            " Commenting operator gc
Plugin 'tpope/vim-fugitive'              " Git plugin
Plugin 'tpope/vim-repeat'                " Repeat all kinds of stuff
Plugin 'maxbrunsfeld/vim-yankstack'      " Needs to be started before surround!
Plugin 'tpope/vim-surround'              " Surround motions
Plugin 'wellle/targets.vim'              " More and better text objects
Plugin 'othree/xml.vim'                  " XML editing
Plugin 'junegunn/seoul256.vim'           " Nice color scheme
Plugin 'scrooloose/syntastic'
Plugin 'ivyl/vim-bling'
Plugin 'yaifa.vim'
Plugin 'mattn/emmet-vim'                 " Zencoding successor
Plugin 'rking/ag.vim'                    " Silver searcher: faster vimgrep/grep:
Plugin 'kana/vim-textobj-user'           " Needed for textobj-python
Plugin 'bps/vim-textobj-python'          " Provides class: ac, ic; Function: af, if


" Nice to have
" Plugin 'Valloric/YouCompleteMe'        " $ Do `./install.sh` after update
Plugin 'terryma/vim-expand-region'
Plugin 'jeetsukumaran/vim-markology'
" Plugin 'mhinz/vim-startify'
Plugin 'tomasr/molokai'
Plugin 'takac/vim-hardtime'
Plugin 'flazz/vim-colorschemes'
Plugin 'Shougo/vimproc.vim'              " Do `$ make` after update
Plugin 'L9'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'fisadev/vim-ctrlp-cmdpalette'
Plugin 'tpope/vim-obsession'
" Plugin 'tpope/vim-abolish'
Plugin 'justinmk/vim-sneak'
Plugin 'milkypostman/vim-togglelist'     " Toggle quickfix and location list
Plugin 'jpalardy/vim-slime'              " REPL interaction
Plugin 'Lokaltog/vim-easymotion'

" By language

" R
Plugin 'Vim-R-plugin'

" Julia
Plugin 'JuliaLang/julia-vim'

" LaTeX
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'Eckankar/vim-latex-folding'

" HTML, CSS/LESS, JS
Plugin 'ap/vim-css-color'
Plugin 'vim-coffee-script'
Plugin 'ervandew/screen'
Plugin 'groenewege/vim-less'
Plugin 'tristen/vim-sparkup'
Plugin 'lepture/vim-jinja'
Plugin 'jaxbot/brolink.vim'

" Python
Plugin 'https://github.com/ivanov/vim-ipython'
Plugin 'django.vim'
" Plugin 'klen/python-mode'
"<localleader> Plugin 'davidhalter/jedi-vim'

" Scala
Plugin 'spiroid/vim-ultisnip-scala'
Plugin 'vim-scala'

" Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-leiningen'

" Matlab
Plugin 'matlab.vim'

" Markdown
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'plasticboy/vim-markdown'

" Dash integration
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'majutsushi/tagbar'

" Experimental
Plugin 'hsitz/VimOrganizer'
Plugin 'AndrewRadev/splitjoin.vim'

call vundle#end()            " required
filetype plugin indent on    " required
" }}}
"================================================================
" Startup {{{
"================================================================
if has('gui_running')               " gvim options
    if os == "Darwin"
        set guifont=Monaco\ for\ Powerline:h16
        " Send option presses to macvim. Allows binding <M-x>
        " but won't allow typing special characaters anymore.
        " set macmeta
    elseif os == "Linux"
        set guifont=Deja\ Vu\ Sans\ Mono\ 10
    endif

    let g:seoul256_background = 236 " Range: 233 - 239"
    colo seoul256
    " colo default
    " colorscheme obsidian2
    " colorscheme mustang
    " colorscheme rdark
    " colorscheme summerfruit256
else                                " terminal
    " set term=screen-256color
    set t_Co=256                    " set 256 colors for terminal
    set background=dark
    colo seoul256
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

" }}}
"================================================================
" Basic Settings {{{
"================================================================
set clipboard=unnamed
" Specify the builtin list of words for C-X C-K completion
set dictionary+=/usr/share/dict/words
set thesaurus+=~/.vim/extra/mthesaur.txt
set spelllang=en_us
set nospell
" set complete+=k                     " Enable dictionary completion with C-N C-P
set complete-=]                     " Search tags as well
set complete-=t                     " Search tags as well
set encoding=utf-8
syntax on                           " enable syntax highlighting
set shiftwidth=4                    " number of spaces to autoindent
set tabstop=4                       " number of spaces for a tabstop
set softtabstop=4
set expandtab                       " expand tab to spaces in insert mode
set autoindent                      " enable autoindenting
set number                          " view line numbers
set showmode                        " show current mode
set ruler                           " always show cursor position
set nocursorline                    " have a line indicate cursor position
set showcmd                         " display incomplete commands on lower right
set hidden                          " edit another buffer while another one is unsaved
set lazyredraw                      " don't update the display while executing macros
set laststatus=2                    " always show status line
set autoread                        " automatically read a file that has changed on disk
set ofu=syntaxcomplete#Complete     " autocompletion so that menu will always appear
set cfu=
set wildmenu                        " enable wildmenu
set wildmode=list:longest,full      " how wild mode should behave
set guioptions-=T                   " remove toolbar in gVim
set guioptions-=r                   " remove right scrollbar
set guioptions-=R                   " remove right scrollbar
set guioptions-=l                   " remove left scrollbar
set guioptions-=L                   " remove left scrollbar
set hlsearch                        " highlight search results, see mapping for disable highlighting
set incsearch                       " set incremental search
set ignorecase                      " ignores case while searching
set smartcase                       " if a search contains a upper case char, make search case sensitive
set diffopt=vertical                " always split vertical with :diffsplit otherfile
set tags=./tags;/
set wildignore+=*.o,*.obj,.git,*.class,target,project,build " ignore files for command-t
set wrap                            " wrap whole words
set linebreak                       " vim will break lines at the chars given in 'set brakeat'
set showbreak=......\|\             " show linebreaks with: ......| wrapped text
set textwidth=0                     " don't insert EOLs at linebreak
set noswapfile                      " Don't use swapfile
set nobackup            		        " Don't create annoying backup files
set splitright                      " Split vertical windows right to the current windows
set splitbelow                      " Split horizontal windows below to the current windows
set so=7                            " keep 7 empty lines from the cursor to the border when scrolling with j or k
set mouse=a
set visualbell                      " no annoying beeping
set foldmethod=expr
" set colorcolumn=80                  " highlight the 80th col
set history=1000                    " set the command line history
set cmdwinheight=10                 " window height for cmd/search history q: q/ resp. C-h (C-f default)
set relativenumber
set cursorline                      " Highlight current line
let grepprg="ag\ --nocolor\ --nogroup\ --silent"

" }}}
"================================================================
" Autocommands {{{
"================================================================
" Alternative to autotags:
" au BufWritePost *.R,*.r,*.py,*.scala,*.clj,*.coffee silent! !ctags -R &
autocmd BufEnter .vimrc setlocal foldmethod=marker

"---------------------------------------------------------------------
" Default
"---------------------------------------------------------------------
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" ---------------------------------------------------------------------
" HTML, XML
" ---------------------------------------------------------------------
" augroup au_HTML_XML
"     autocmd Filetype html,xml,xsl source ~/.vim/plugin/closetag.vim
" augroup END

"---------------------------------------------------------------------
" R
"---------------------------------------------------------------------
augroup au_R
    autocmd!
    au FileType r RainbowParenthesesActivate
    au FileType r set iskeyword+=.
augroup END


"---------------------------------------------------------------------
" Clojure
"---------------------------------------------------------------------
augroup au_Clojure
    autocmd!
    au FileType clojure RainbowParenthesesActivate
    au FileType clojure RainbowParenthesesLoadRound
    au FileType clojure RainbowParenthesesLoadSquare
    au FileType clojure RainbowParenthesesLoadBraces
augroup END

"---------------------------------------------------------------------
" Python
"---------------------------------------------------------------------
augroup au_Python
    autocmd!
    autocmd FileType python setlocal foldmethod=indent foldnestmax=2
    autocmd FileType python setlocal shiftwidth=4 tabstop=4
    " autocmd FileType python set omnifunc=pythoncomplete#Complete
    " autocmd FileType python setlocal ofu=jedi#completions
    " autocmd BufWritePost *.py silent! !ctags -R --exclude=.git --exclude=lib --exclude=external --languages=python
augroup END

"---------------------------------------------------------------------
" Latex
"---------------------------------------------------------------------
augroup autex
    autocmd!
    " autocmd FileType tex set mps+=$:$
    au FileType tex let b:delimitMate_matchpairs = "\(:\)"
    autocmd FileType tex setlocal spell
    " autocmd FileType tex let b:AutoPairs['$'] = '$'
    " autocmd FileType tex nnoremap <buffer> <leader>c <leader>ll
    " autocmd FileType tex nnoremap <buffer> <leader>v <leader>lv
augroup END

augroup au_Darwin
    autocmd!
    autocmd BufRead,BufNewFile *.drw set filetype=darwin
augroup END


"---------------------------------------------------------------------
" Markdown
"---------------------------------------------------------------------
augroup au_Markdown
    autocmd!
    autocmd FileType markdown iabbr ddx \frac{d}{dx}
    autocmd FileType markdown iabbr ddt \frac{d}{dt}
    " autocmd FileType markdown inoremap $ $$<Left>
    " autocmd FileType markdown setlocal spell spelllang=en_us
    " autocmd FileType markdown inoremap $$ $$<CR>$$<ESC>O
    " autocmd FileType markdown let b:AutoPairs['$'] = '$'
    " autocmd FileType markdown set foldmethod=marker
    " autocmd FileType markdown set foldmarker=-------------------------------------------------------------------------------,*******************************************************************************
augroup END
" }}}
"================================================================
" Mappings {{{1
"================================================================
" Basic {{{2 "
let mapleader="<space>"
let maplocalleader = ","

" Select most recently pasted text
nnoremap gv `[v`]

" Easier access to command-window
" Use ; for command line since it's easier to type
nnoremap ; :
xnoremap ; :

" SkyBison for fuzzy searching the command line
nnoremap <space>; :<c-u>call SkyBison("")<cr>

" Use : for 'go-to-next-match' when `f`ing
nnoremap : ;
xnoremap : ;

" Show the registers
nnoremap <space>re :reg<CR>

" Old escape (now Caps-Lock)
inoremap jk <ESC>

nnoremap <space>so :source ~/.vimrc<CR>

" Insert an empty space
nnoremap <S-space> i <ESC>

" Save the file
nnoremap <C-space> :w<cr>

" Clear all highlightning
nnoremap <C-\> :noh<CR>

" After yanking or putting switch to the lower-end
" of the selection. This allows pasting multiple times
" the same selection (and generally feels more natural imo).
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

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
nnoremap [<space> O<ESC>j
nnoremap ]<space> o<ESC>k

" Select just pasted text
noremap gV `[v`]

" nnoremap ,y "+y
" vnoremap ,p "+p

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
" it's meta-mappings messed with my keyboard layout
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

" jk exits command mode
" cnoremap jk <C-c>

" Insert line above/below curser
nnoremap <space>j o<ESC>k
nnoremap <space>k O<ESC>j

" Go to next fold
nnoremap <M-j> zj
nnoremap <M-k> zk

" Navigate quickfix list
" nnoremap ]q :cnext<CR>
" nnoremap [q :cprevious<CR>

" Typing ,lcd or ,cd will switch the (local)
" working directory to the current file's
nnoremap <space>cld :lcd %:p:h<CR>
nnoremap <space>cd :cd %:p:h<CR>

" Scroll by visual lines
" nnoremap j gj
" nnoremap k gk
" 2}}}

" Plugin mapings {{{2 "

" Yankstack
nmap <space>p <Plug>yankstack_substitute_older_paste
nmap <space>P <Plug>yankstack_substitute_newer_paste

" Fugitive
nnoremap <space>gg :Gstatus<CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gp :Git push<CR>
" nmap <space><space> V

" Undotree
nnoremap <F4> :UndotreeToggle<CR>

" Emmet, remap to something less awkward
imap <C-l> <C-y>,

" Sneak
nmap gs <Plug>SneakForward
xmap gs <Plug>VSneakForward
nmap gS <Plug>SneakBackward
xmap gS <Plug>VSneakBackward

nmap <script> <silent> <space>l :call ToggleLocationList()<CR>
nmap <script> <silent> <space>q :call ToggleQuickfixList()<CR>

nnoremap <C-w>o :MaximizerToggle<CR>
vnoremap <C-w>o :MaximizerToggle<CR>gv

" Look up word under cursor with Dash
nnoremap gK :Dash<CR>

" CtrlP
" While in prompt: C-b and C-f switch search modes
" C-j C-k allow navigation in results list
" <CR> opens file in current window
" <C-v> opens file in vertical split
" <C-s> opens file in horizontal split
let g:ctrlp_map = '<C-p>'

" The command executed by the above mapping
let g:ctrlp_cmd = 'CtrlPMixed'

nnoremap <space>pl :CtrlPLine<CR>
nnoremap <space>b :CtrlPBuffer<CR>
nnoremap <space>ls :CtrlPBuffer<CR>
nnoremap <space>rf :CtrlPMRUFiles<CR>
nnoremap <space>ta :CtrlPTag<CR>
nnoremap <space>e :CtrlPMixed<CR>

" nnoremap <leader>b 2:<c-u>call SkyBison("b ")<cr>
" nnoremap <leader>t 2:<c-u>call SkyBison("tag ")<cr>
" nnoremap <leader>h 2:<c-u>call SkyBison("h ")<cr>
" nnoremap <leader>e :<c-u>call SkyBison("e ")<cr>

let g:ctrlp_root_markers = ['.ctrlp']
" While in directory mode:
" <cr> change the local working directory for CtrlP and keep it open.
" <c-t> change the global working directory (exit).
" <c-v> change the local working directory for the current window (exit).
" <c-x> change the global working directory to CtrlP's current local

" LateX-Box
nnoremap ,xv :LatexView<CR>
nnoremap ,xc :Latexmk<CR>

" NERDTree
" Open NERDTree at the location of the current file
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <S-F2> :NERDTreeFind<CR>

" " Tagbar
nnoremap <F3> :TagbarToggle<CR>

nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

nmap : <Plug>SneakNext

" 2}}}
" 1}}}
"================================================================
" Abbreviations {{{
"================================================================
" recursive search with :e
" :e r/filename
" cabbrev r ./**
" iabbrev over <esc>BdWi\frac{<esc>pxi}{
" }}}
"================================================================
" Plugin settings {{{1
"================================================================

" {{{2 Skybison
"---------------------------------------------------------------------
let g:skybison_fuzz = 2
let g:skybison_numberselect = 0
" 2}}}

" {{{2 Brolink
"---------------------------------------------------------------------
let g:bl_no_mappings = 1
" 2}}}

" {{{2 Split Join
"---------------------------------------------------------------------
" Default is gS and gJ
" let g:splitjoin_split_mapping = ''
" let g:splitjoin_join_mapping = ''

" nmap <Leader>j :SplitjoinJoin<cr>
" nmap <Leader>s :SplitjoinSplit<cr>
" 2}}}

" {{{2 LaTeX-Box
"---------------------------------------------------------------------
" Alternative: put something like this in your bashrc
" Then, autocompile texfiles with $ latexmk_ sometexfile.tex
" alias latexmk_='latexmk -pdf -pvc'
let g:LatexBox_viewer = 'open -a Skim'
" 0: Don't open quickfix, 2: Open but don't make it the active window
let g:LatexBox_quickfix = 0
" let g:main_tex_file = '~/Dev/dcop-bachelor-thesis/thesis/thesis.tex'
" Set tex to latex, otherwise filetype is regarded as "plaintex"
" with which most plugins won't work
let g:tex_flavor = "latex"
let g:LatexBox_latexmk_options = "-pvc -pdf"
" set cole=2
" hi Conceal guibg=black guifg=white
" 2}}}

" {{{2 Sparkup
"---------------------------------------------------------------------
let g:sparkupExecuteMapping='<c-o>'
let g:sparkupMappingInsertModeOnly=1
let g:sparkupNextMapping='<c-j>'
" 2}}}

" {{{2 Argumentative
"---------------------------------------------------------------------
" Experimental
" Shifting arguments with <, and >,
" Moving between argument boundaries with [, and ],
" New text objects a, and i,
" 2}}}

" {{{2 Maximizer
"---------------------------------------------------------------------
let g:maximizer_set_default_mapping = 0
" 2}}}

" {{{2 Markdown Settings
"---------------------------------------------------------------------
" 2}}}

" {{{2 EasyMotion
"---------------------------------------------------------------------
" Default leader <leader><leader>
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" JK motions: Line motions
map <space>j <Plug>(easymotion-j)
map <space>k <Plug>(easymotion-k)
" 2}}}

" {{{2 R Plugin
"---------------------------------------------------------------------
let g:vimrplugin_assign='<'

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
    " map the letter 'r' to send visually selected lines to R
    let g:vimrplugin_map_r = 1
    " see R documentation in a Vim buffer
    let vimrplugin_vimpager = "no""
endif
" 2}}}

" {{{2 Py-Mode settings
"---------------------------------------------------------------------
let g:pymode_rope = 0 " Disable Rope due to buggy behavior
" 2}}}

" {{{2 Eclim
"---------------------------------------------------------------------
" To make it play nicely with YCM
" let g:EclimCompletionMethod = 'omnifunc'
" 2}}}

" {{{2 Startify
"---------------------------------------------------------------------
let g:startify_bookmarks = [ '~/.vimrc', '~/Dev/void' ]
" 2}}}

" {{{2 YouCompleteMe
"---------------------------------------------------------------------
" Removed TAB form list of select_completion keys since UltiSnips uses that key.
" Select elemens by <C-n>, <C-p>

let g:ycm_auto_trigger = 0
let g:ycm_key_list_select_completion = ['<Down>'] " Tab removed
let g:ycm_key_list_previous_completion = ['<Up>'] " S-Tab removed
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_min_num_of_chars_for_completion = 2 " default 2
let g:ycm_min_num_identifier_candidate_chars = 0 " default 0
" Can make vim slower if tags file is on a network dir
let g:ycm_collect_identifiers_from_tags_files = 1
let g:pymode_rope_complete_on_dot = 0
let g:ycm_seed_identifiers_with_syntax = 1

" 2}}}

" {{{2 UltiSnips
"---------------------------------------------------------------------
" Default Keybindings
" g:UltiSnipsListSnippets                <c-tab>
" g:UltiSnipsJumpForwardTrigger          <c-j>
" g:UltiSnipsJumpBackwardTrigger         <c-k>
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsEditSplit='vertical'
" Edit snippets
nnoremap <space>es :UltiSnipsEdit<CR>

let g:snips_author="Robin Hafen"
let g:snips_email="robin.hafen@gmail.com"
let g:snips_github="https://github.com/hafenr"
" 2}}}

" {{{2 Syntastic
"---------------------------------------------------------------------
let g:syntastic_warning_symbol='⚠'
let g:syntastic_error_symbol='✗'
" Remember to actually install all the syntax errors and style checkers"
" pip install pyflakes pep8 pep257 flake8 pylint etc.
" npm install -g jslint coffeelint # js, html, and coffee
" npm install -g csslint
" npm install -g w3 # also html
" cabal install hlint
let g:syntastic_python_checkers = ['pyflakes', 'flake8']
let g:syntastic_haskell_checkers = ['hlint']
" 2}}}

" {{{2 Python Mode - temp removed
"---------------------------------------------------------------------
" See all default settings at: https://github.com/klen/python-mode
" Enable with :PyLintCheckerToggle
" let g:pymode_lint = 0
" let g:pymode_lint_ignore = "E501"
" 2}}}

" " {{{2 Tagbar
" "---------------------------------------------------------------------
" let g:tagbar_type_r = {
"     \ 'ctagstype' : 'r',
"     \ 'kinds'     : [
"         \ 'f:Functions',
"         \ 'g:GlobalVariables',
"         \ 'v:FunctionVariables',
"     \ ]
" \ }

" let g:tagbar_type_scala = {
"     \ 'ctagstype' : 'Scala',
"     \ 'kinds'     : [
"         \ 'p:packages:1',
"         \ 'V:values',
"         \ 'v:variables',
"         \ 'T:types',
"         \ 't:traits',
"         \ 'o:objects',
"         \ 'a:aclasses',
"         \ 'c:classes',
"         \ 'r:cclasses',
"         \ 'm:methods'
"     \ ]
" \ }

" let g:tagbar_type_markdown = {
" 	\ 'ctagstype' : 'markdown',
" 	\ 'kinds' : [
" 		\ 'h:Heading_L1',
" 		\ 'i:Heading_L2',
" 		\ 'k:Heading_L3'
" 	\ ]
" \ }

" let g:tagbar_type_coffee = {
"     \ 'ctagstype' : 'coffee',
"     \ 'kinds'     : [
"         \ 'c:classes',
"         \ 'm:methods',
"         \ 'f:functions',
"         \ 'v:variables',
"         \ 'f:fields',
"     \ ]
" \ }
" " 2}}}

" {{{2 Vim-slime
"---------------------------------------------------------------------
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
" 2}}}

" {{{2 Jedi
"---------------------------------------------------------------------
let g:jedi#use_tabs_not_buffers = 0
" let g:jedi#use_splits_not_buffers = "left"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_definitions_command = "<leader>d"
" let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = "<leader>n"
" let g:jedi#completions_command = "<C-Space>"
" let g:jedi#rename_command = "<leader>r"
" let g:jedi#show_call_signatures = "1"
" 2}}}

" {{{2 Startify
"---------------------------------------------------------------------
" |g:startify_session_dir|
" |g:startify_list_order|
" |g:startify_bookmarks|
" |g:startify_files_number|
" |g:startify_session_detection|
" |g:startify_session_autoload|
" |g:startify_session_persistence|
" |g:startify_skiplist|
" |g:startify_skiplist_server|
" |g:startify_change_to_dir|
" |g:startify_custom_indices|

let g:startify_custom_header = [
\ 'Folds:                ',
\ '----------------------',
\ 'move: zj zk           ',
\ 'open (rec): zo zO     ',
\ 'close (rec): zc zC    ',
\ '----------------------',
\ 'Indent text objects:',
\ 'Vii caii etc. ..."      ',
\ '----------------------',
\ 'move in changelist: g; and g,',
\ '                      ',
\ '                      ']

" |g:startify_custom_footer|
" |g:startify_restore_position|
" |g:startify_empty_buffer_key|
" |g:startify_enable_special|
" |g:startify_session_savevars|
" |g:startify_session_savecmds|
" |g:startify_disable_at_vimenter|
" 2}}}

" {{{2 HardTime
"---------------------------------------------------------------------
let g:hardtime_default_on = 0
let g:list_of_normal_keys = ['h', 'j', 'k', 'l', '<UP>', '<DOWN>', '<RIGHT>', '<LEFT>']
" 2}}}

" {{{2 EasyAlign
"---------------------------------------------------------------------
" Check if better than tabularize
" Start interactive EasyAlign in visual mode
" :EasyAlign */regex aligns on all matches of regex, 2/regex on every second etc.
vmap ,al <Plug>(EasyAlign)
" 2}}}

" {{{2 Ctrlp

" r: Try to search for a root directory (containing .git, .ctrlp, etc.)
" and set that dir as the working dir
" c: working directory
let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_match_window_reversed = 0
" let g:ctrlp_max_height = 10
let g:ctrlp_show_hidden = 1

" Dir mode settings:
" <cr> change the local working directory for CtrlP and keep it open.
" <c-t> change the global working directory (exit).
" <c-v> change the local working directory for the current window (exit).
" <c-x> change the global working directory to CtrlP's current local wd (exit)

" Default is search by full path. Switch with CTRL-d while in CtrlP prompt.
let g:ctrlp_by_filename = 0
let g:ctrlp_root_markers = ['.ctrlp']

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$',
  \ 'file': '\v\.(o|m4a|pdf|swp|pyc|wav|mp3|ogg|blend|dvi|fls|aux|blg|bbl|log|loa|lof|toc|fdb_latexmk|lot|)$|\~$'
  \ }

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

let g:ctrlp_extensions = [
    \ 'commandline'
    \ ]

" 2}}}

" {{{2 vim-textobj-user
call textobj#user#plugin('line', {
\   '-': {
\     'select-a-function': 'CurrentLineA',
\     'select-a': 'al',
\     'select-i-function': 'CurrentLineI',
\     'select-i': 'il',
\   },
\ })

function! CurrentLineA()
  normal! 0
  let head_pos = getpos('.')
  normal! $
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction

function! CurrentLineI()
  normal! ^
  let head_pos = getpos('.')
  normal! g_
  let tail_pos = getpos('.')
  let non_blank_char_exists_p = getline('.')[head_pos[2] - 1] !~# '\s'
  return
  \ non_blank_char_exists_p
  \ ? ['v', head_pos, tail_pos]
  \ : 0
endfunction
" 2}}} "

" {{{2 Sneak
"---------------------------------------------------------------------
let g:sneak#streak = 0
let g:sneak#use_ic_scs = 1
" 2}}}

" {{{2 Airline
" : %3p : %4l : %3c
if has('gui_running')
    let g:airline_powerline_fonts = 1
endif
let g:airline_section_y = airline#section#create(["cwd:%{split(getcwd(), '/')[-1]}% "])
set noshowmode
" 2}}}

" {{{2 Markology
 let g:markology_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
" 2}}}

" SuperTab {{{2 "
" let g:SuperTabMappingForward = '<C-n>'
" let g:SuperTabMappingBackward = '<C-p>'
" let g:SuperTabDefaultCompletionType = 'context'
" 2}}}
" 1}}}
"================================================================
" Custom functions and commands {{{
"================================================================

" " Command line with history - excecute commands by hitting enter
" " Swap default ':', '/' and '?' with cmdline-window equivalent.
" nnoremap : q:
" xnoremap : q:
" nnoremap / q/
" xnoremap / q/
" nnoremap ? q?
" xnoremap ? q?
" nnoremap q: :
" xnoremap q: :
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

function! RunCurrentFile()
    let current_filetype = &filetype
    if current_filetype == 'python'
        !python %
    else
        echom 'Filetype not found'
    endif
endfunc

" TODO, make a function that gets executed in augroup HTML
" which checks if there are {{ }} or {% %} inside a html file
" if so, :set ft=htmldjango else :set ft=html

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
command! StartR call StartR('R')

func! WordProcessorMode()
  setlocal formatoptions=1
  setlocal noexpandtab
  map j gj
  map k gk
  setlocal spell spelllang=en_us
  set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
  set complete+=s
  set formatprg=par
  setlocal wrap
  setlocal linebreak
endfu
com! WP call WordProcessorMode()

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
"================================================================
" End {{{
"================================================================
" Show insert cursor as yellow and normal mode
" cursor as light green
highlight Cursor guifg=black guibg=#00ff1e
highlight iCursor guifg=black guibg=cyan
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkon0
" }}}
"================================================================
