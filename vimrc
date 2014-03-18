=====================================================================
"                   __     _____ __  __ ____   ____
"                   \ \   / /_ _|  \/  |  _ \ / ___|
"                    \ \ / / | || |\/| | |_) | |
"                     \ V /  | || |  | |  _ <| |___
"                      \_/  |___|_|  |_|_| \_\\____|
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"                                 QZR
"=====================================================================
" General {{{
"=====================================================================
let os = substitute(system('uname'), "\n", "", "")

" For Vundle
set nocompatible
filetype off

" Let Vundle manage Vundle
set rtp+=~/.vim/vundle_managed/vundle/
call vundle#rc("$HOME/.vim/vundle_managed")
call pathogen#infect("pathogen_managed/*")
" }}}
"=====================================================================
" Plugins {{{
"=====================================================================
" Essential
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Valloric/YouCompleteMe'
Bundle 'jpalardy/vim-slime'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'
Bundle 'jwhitley/vim-matchit'
Bundle 'wellle/targets.vim'
Bundle 'szw/vim-maximizer'
Bundle 'PeterRincker/vim-argumentative'
Bundle 'Raimondi/delimitMate'

" By language
" Julia
Bundle 'JuliaLang/julia-vim'
" LaTeX
Bundle 'LaTeX-Box-Team/LaTeX-Box'
" HTML, CSS/LESS, JS
Bundle 'ap/vim-css-color'
Bundle 'ervandew/screen'
Bundle 'groenewege/vim-less'
Bundle 'tristen/vim-sparkup'
Bundle "lepture/vim-jinja"

" Python
Bundle 'https://github.com/ivanov/vim-ipython'
" Bundle 'klen/python-mode'
" Bundle 'davidhalter/jedi-vim'
" Scala
Bundle 'spiroid/vim-ultisnip-scala'
" Clojure
Bundle 'guns/vim-clojure-static'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'tpope/vim-fireplace'
" Markdown
Bundle 'nelstrom/vim-markdown-folding'
Bundle 'tpope/vim-markdown'

" Other
Bundle 'majutsushi/tagbar'
Bundle 'mhinz/vim-startify'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tomasr/molokai'
Bundle 'vim-scripts/matlab.vim'
Bundle 'takac/vim-hardtime'
Bundle 'junegunn/vim-easy-align'
Bundle 'flazz/vim-colorschemes'
" Dash integration
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'justinmk/vim-sneak'
Bundle 'Lokaltog/vim-easymotion'
" }}}
"=====================================================================
" Startup {{{
"=====================================================================
filetype plugin indent on           " enable all filetype events

if has('gui_running')               " gvim options
    if os == "Darwin"
        set guifont=Monaco:h18
        set macmeta                 " Option as Meta
    elseif os == "Linux"
        set guifont=Deja\ Vu\ Sans\ Mono\ 10
    endif
    colorscheme obsidian2
else                                " terminal
    " set t_Co=256                    " set 256 colors for terminal
    " set term=screen-256color
    set background=dark
    " runtime! plugin/guicolorscheme.vim
    colorscheme muon
    " colorscheme corn
endif

" Default python imports
py import vim, sys
py from vim import buffers, windows, command, current, error

" }}}
"=====================================================================
" Basic Settings {{{
"=====================================================================
set clipboard=unnamed
" Specify the builtin list of words for C-X C-K completion
set dictionary+=/usr/share/dict/words
set thesaurus+=~/.vim/extra/mthesaur.txt
set spelllang=en_us
set nospell
" set complete+=k                     " Enable dictionary completion with C-N C-P
" set complete+=]                     " Search tags as well
set encoding=utf-8
syntax on                           " enable syntax highlighting
set shiftwidth=4                    " number of spaces to autoindent
set tabstop=4                       " number of spaces for a tabstop
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
set cfu=youcompleteme#Complete
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
" }}}
"=====================================================================
" Autocommands {{{
"=====================================================================
" Alternative to autotags:
" au BufWritePost *.R,*.r,*.py,*.scala,*.clj,*.coffee silent! !ctags -R &
autocmd BufEnter .vimrc setlocal foldmethod=marker

"---------------------------------------------------------------------
" Default
"---------------------------------------------------------------------
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

"---------------------------------------------------------------------
" HTML, XML
"---------------------------------------------------------------------
" augroup auhtml
"     autocmd Filetype html,xml,xsl source ~/.vim/plugin/closetag.vim
" augroup END

"---------------------------------------------------------------------
" Clojure
"---------------------------------------------------------------------
augroup auclojure
    autocmd!
    au FileType clojure RainbowParenthesesActivate
    au FileType clojure RainbowParenthesesLoadRound
    au FileType clojure RainbowParenthesesLoadSquare
    au FileType clojure RainbowParenthesesLoadBraces
augroup END

"---------------------------------------------------------------------
" Python
"---------------------------------------------------------------------
augroup aupython
    autocmd!
    autocmd FileType python setlocal foldmethod=indent foldnestmax=2
    autocmd FileType python setlocal shiftwidth=4 tabstop=4
    " autocmd FileType python set omnifunc=pythoncomplete#Complete
    " autocmd FileType python setlocal ofu=jedi#completions
    autocmd BufWritePost *.py silent! !ctags -R --exclude=.git --exclude=lib --exclude=external --languages=python
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

augroup audarwin
    autocmd!
    autocmd BufRead,BufNewFile *.drw set filetype=darwin
augroup END


"---------------------------------------------------------------------
" Markdown
"---------------------------------------------------------------------
augroup aumarkdown
    autocmd!
    autocmd FileType markdown iabbr ddx \frac{d}{dx}
    autocmd FileType markdown iabbr ddt \frac{d}{dt}
    " autocmd FileType markdown inoremap $ $$<Left>
    autocmd FileType markdown setlocal spell spelllang=en_us
    " autocmd FileType markdown inoremap $$ $$<CR>$$<ESC>O
    " autocmd FileType markdown let b:AutoPairs['$'] = '$'
    " autocmd FileType markdown set foldmethod=marker
    " autocmd FileType markdown set foldmarker=-------------------------------------------------------------------------------,*******************************************************************************
augroup END
" }}}
"=====================================================================
" Mappings {{{
"=====================================================================
let mapleader=","
let maplocalleader = ","

" nnoremap <space> /
nnoremap <S-space> :noh<CR>

nnoremap <leader>g :Gstatus<CR>

" let g:user_emmet_leader_key = '<c-o>'

nnoremap ,ll :lopen<CR>
nnoremap ]l :lnext<CR>
nnoremap [l :lp<CR>

nmap gs <Plug>SneakForward
xmap gs <Plug>VSneakForward
nmap gS <Plug>SneakBackward
xmap gS <Plug>VSneakBackward
let g:EasyMotion_leader_key = '<space>'

nnoremap <silent><C-w>m :MaximizerToggle<CR>
vnoremap <silent><C-w>m :MaximizerToggle<CR>gv
" Don't set the default mapping (F3)

nnoremap <F8> :NextColo<CR>
nnoremap <F9> :PrevColo<CR>

inoremap <C-b> <C-o>h
inoremap <C-f> <C-o>l
inoremap <C-e> <C-o>$

nnoremap Q @q
nnoremap <F3> :NumbersToggle<CR>

" Look up word under cursor with Dash
nnoremap gK :Dash<CR>

" Reload vimrc
nnoremap <leader>so :so ~/.vimrc<CR>

" Faster scrolling
nnoremap <C-e> 2<C-e>2j
nnoremap <C-y> 2<C-y>2k

" Window splitting
nnoremap <leader>vs :vs<CR>
nnoremap <leader>sp :sp<CR>

" :Forcesave will save the file as su
command! Forcesave w !sudo tee % > /dev/null

" Change the working directoty to dir of file in buffer
nmap <silent> ,cd :lcd %:h<CR>

" Scroll by visual lines
nnoremap j gj
nnoremap k gk

" Y copies to EOL much like D, C etc. yy is still for yanking a whole line
nmap Y y$

" Forward delete in insert mode
inoremap <C-Del> <C-\><C-O>D

" Scroll another window
nmap <M-e> <C-w>w<C-e><C-w>w
nmap <M-y> <C-w>w<C-y><C-w>w
nmap <M-d> <C-w>w<C-d><C-w>w
nmap <M-u> <C-w>w<C-u><C-w>w

" Close window ...
" to the left
noremap <silent> <A-w>h :wincmd h<CR>:close<CR>
" below
noremap <silent> <A-w>j :wincmd j<CR>:close<CR>
" above
noremap <silent> <A-w>k :wincmd k<CR>:close<CR>
" to the right
noremap <silent> <A-w>l :wincmd l<CR>:close<CR>
" ... of current window

" Show jump list
nnoremap <leader>jl :jumps<CR>

" Show changes list
" navigation: <nr>g;  <nr>g,
nnoremap <leader>cl :changes<CR>

" Show registers
nnoremap <leader>re :reg<CR>

" Map jk to escape in insert mode
imap jk <Esc>

" M-k will create an empty line above the cursor, M-j under the cursor
nnoremap <M-k> maO<esc>`a
nnoremap <M-j> mao<esc>`a

" :HardTimeToggle<CR>
nnoremap <F5> :GundoToggle<CR>

" toggle show vertical and horizontal line at cursor position
" useful for keeping track of indentation in python files
" nmap <C-\> :set invcursorcolumn invcursorline<CR>

" Toggle highlighting
" nnoremap <C-\> :set hlsearch! hlsearch?<CR>
" Temporarily disable highlighting (until next search)
nnoremap <C-\> :noh<CR>
" nnoremap <C-space> :
nnoremap <C-space> :w<CR>
" cnoremap <enter> <nop>
" nnoremap : <nop>

" Especially useful when searching with / or ?.
" This will also disable highlighting for a easy <space> `search` <C-space> workflow
cnoremap <C-space> <CR>:noh<CR>
" Insert space at cursor position without leaving normal mode
" nnoremap <C-space> i <ESC>

" Copy paste from/to system clipboard
vnoremap <leader>y "+y
vnoremap <leader>p "+p

" Copy paste from secondary system clipboard
" (highlighted text, normal paste via mouse3)
nnoremap <leader><leader>y "*y
nnoremap <leader><leader>p "*p

nnoremap <leader>Y "+yy

" Allow command line editing with emacs keybindings
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-d> <Delete>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" c_CTRL-F is remapped to c_CTRL-H for 'history'
cnoremap <C-h> <C-f>

" jk exits command mode
cnoremap jk <C-c>

" Navigate quickfix list
nnoremap ,qf :cope<CR>
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

" CtrlP
" While in prompt: C-b and C-f switch search modes
" C-j C-k allow navigation in results list
" <CR> opens file in current window
" <C-v> opens file in vertical split
" <C-s> opens file in horizontal split
let g:ctrlp_map = '<C-p>'

" The command executed by the above mapping
let g:ctrlp_cmd = 'CtrlPMixed'
" All modes with prefix 'f' for 'fuzzy'
nnoremap <leader>fm :CtrlPMixed<CR>
nnoremap <leader>ff :CtrlPMRUFiles<CR>
nnoremap <leader>fl :CtrlPLine<CR>
nnoremap <leader>ft :CtrlPTag<CR>
nnoremap <leader>fd :CtrlPBookmarkDir<CR>
nnoremap <leader>fb :CtrlPBuffer<CR>

" AKAs
nnoremap <leader>ls :CtrlPBuffer<CR>
nnoremap <leader>ta :CtrlPTag<CR>

let g:ctrlp_root_markers = ['.ctrlp']
" While in directory mode:
" <cr> change the local working directory for CtrlP and keep it open.
" <c-t> change the global working directory (exit).
" <c-v> change the local working directory for the current window (exit).
" <c-x> change the global working directory to CtrlP's current local
nnoremap ,pd :CtrlPDir<CR>

"
" LateX-Box
nnoremap ,xv :LatexView<CR>
nnoremap ,xc :Latexmk<CR>

" NERDTree
" Open NERDTree at the location of the current file
nnoremap ,q :NERDTreeFind<CR>
nnoremap ,w :NERDTreeClose<CR>

" Tagbar
nnoremap ,to :TagbarToggle<CR>
nnoremap ,tt :TagbarOpenAutoClose<CR>

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

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
vnoremap  <Up>     <NOP>
vnoremap  <Down>   <NOP>
vnoremap  <Left>   <NOP>
vnoremap  <Right>  <NOP>
nnoremap  <Up>     <NOP>
nnoremap  <Down>   <NOP>
nnoremap  <Left>   <NOP>
nnoremap  <Right>  <NOP>
cnoremap  <Up>     <NOP>
cnoremap  <Down>   <NOP>
cnoremap  <Left>   <NOP>
cnoremap  <Right>  <NOP>
" }}}
"=====================================================================
" Abbreviations {{{
"=====================================================================
" recursive search with :e
" :e r/filename
" cabbrev r ./**
" iabbrev over <esc>BdWi\frac{<esc>pxi}{
" }}}
"=====================================================================
" Plugin settings {{{
"=====================================================================
"---------------------------------------------------------------------
" LaTeX-Box
"---------------------------------------------------------------------
let g:LatexBox_viewer = 'open -a Skim'
" 0: Don't open quickfix, 2: Open but don't make it the active window
let g:LatexBox_quickfix = 0
" let g:main_tex_file = '~/Dev/dcop-bachelor-thesis/thesis/thesis.tex'
" Set tex to latex, otherwise filetype is regarded as "plaintex"
" with which most plugins won't work
let g:tex_flavor = "latex"
" let g:LatexBox_latexmk_options = "-pvc -pdfps"
set cole=2
hi Conceal guibg=black guifg=white

"---------------------------------------------------------------------
" Sparkup
"---------------------------------------------------------------------
let g:sparkupExecuteMapping='<c-o>'
let g:sparkupMappingInsertModeOnly=1
let g:sparkupNextMapping='<c-j>'

"---------------------------------------------------------------------
" Argumentative
"---------------------------------------------------------------------
" Experimental
" Shifting arguments with <, and >,
" Moving between argument boundaries with [, and ],
" New text objects a, and i,
"---------------------------------------------------------------------

" Maximizer
"---------------------------------------------------------------------
let g:maximizer_set_default_mapping = 0

"---------------------------------------------------------------------
" Markdown Settings
"---------------------------------------------------------------------
let g:vim_markdown_folding_disabled=1

"---------------------------------------------------------------------
" EasyMotion
"---------------------------------------------------------------------
" Default leader <leader><leader>

"---------------------------------------------------------------------
" R Plugin
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

"---------------------------------------------------------------------
" Py-Mode settings
"---------------------------------------------------------------------
let g:pymode_rope = 0 " Disable Rope due to buggy behavior

"---------------------------------------------------------------------
" Eclim
"---------------------------------------------------------------------
" To make it play nicely with YCM
" let g:EclimCompletionMethod = 'omnifunc'

"---------------------------------------------------------------------
" Startify
"---------------------------------------------------------------------
let g:startify_bookmarks = [ '~/.vimrc', '~/Dev/void' ]

"---------------------------------------------------------------------
" YouCompleteMe
"---------------------------------------------------------------------
" Removed TAB form list of select_completion keys since UltiSnips uses that key.
" Select elemens by <C-n>, <C-p>

let g:ycm_auto_trigger = 1
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_min_num_of_chars_for_completion = 2 " default 2
let g:ycm_min_num_identifier_candidate_chars = 0 " default 0
" Can make vim slower if tags file is on a network dir
let g:ycm_collect_identifiers_from_tags_files = 1
let g:pymode_rope_complete_on_dot = 0

"---------------------------------------------------------------------
" UltiSnips
"---------------------------------------------------------------------
" Default Keybindings
" g:UltiSnipsListSnippets                <c-tab>
" g:UltiSnipsJumpForwardTrigger          <c-j>
" g:UltiSnipsJumpBackwardTrigger         <c-k>
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsEditSplit='vertical'

"---------------------------------------------------------------------
" Syntastic
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

"---------------------------------------------------------------------
" Python Mode - temp removed
"---------------------------------------------------------------------
" See all default settings at: https://github.com/klen/python-mode
" Enable with :PyLintCheckerToggle
" let g:pymode_lint = 0
" let g:pymode_lint_ignore = "E501"

"---------------------------------------------------------------------
" Tagbar
"---------------------------------------------------------------------
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

"---------------------------------------------------------------------
" Vim-slime
"---------------------------------------------------------------------
let g:slime_target = "tmux"

"---------------------------------------------------------------------
" Jedi
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

"---------------------------------------------------------------------
" Startify
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


"---------------------------------------------------------------------
" HardTime
"---------------------------------------------------------------------
let g:hardtime_default_on = 0
let g:list_of_normal_keys = ['h', 'j', 'k', 'l', '<UP>', '<DOWN>', '<RIGHT>', '<LEFT>']

"---------------------------------------------------------------------
" EasyAlign
"---------------------------------------------------------------------
" Check if better than tabularize
" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign with a Vim movement
nmap <Leader>a <Plug>(EasyAlign)

"---------------------------------------------------------------------
" Ctrlp
"---------------------------------------------------------------------
let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_match_window_reversed = 0
" let g:ctrlp_max_height = 10

" Default is search by full path. Switch with CTRL-d while in CtrlP prompt.
let g:ctrlp_by_filename = 0
let g:ctrlp_root_markers = ['.ctrlp']

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$',
  \ 'file': '\v\.(o|m4a|pdf|swp|pyc|wav|mp3|ogg|blend|dvi|fls|aux|blg|bbl|log|loa|lof|toc|fdb_latexmk|lot|)$|\~$'
  \ }

"---------------------------------------------------------------------
" Sneak
"---------------------------------------------------------------------
let g:sneak#streak = 0
let g:sneak#use_ic_scs = 1

"---------------------------------------------------------------------
" PowerLine
"---------------------------------------------------------------------
" let g:Powerline_symbols = 'fancy'

"---------------------------------------------------------------------
" SuperTab
"---------------------------------------------------------------------
" let g:SuperTabMappingForward = '<C-n>'
" let g:SuperTabMappingBackward = '<C-p>'
" let g:SuperTabDefaultCompletionType = 'context'
" }}}
"=====================================================================
" Custom functions and commands {{{
"=====================================================================

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

" }}}
"=====================================================================


let delimitMate_expand_cr = 1

