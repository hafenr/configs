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
"|                                                                     |
"|                        SETTINGS & MAPPINGS                          |

"=======================================================================
" Initialization
"=======================================================================
let os = substitute(system('uname'), "\n", "", "")
let vimdir = '$HOME/.vim'
if has('gui_running')               " gvim options
    set clipboard=unnamed
    if os == "Darwin"
        set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14
        " Send option presses to macvim. Allows binding <M-x>
        " but won't allow typing special characaters anymore.
        " set macmeta
    elseif os == "Linux"
        set guifont=Ubuntu\ Mono\ derivative\ Powerline
    endif
    colorscheme mustang
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

"=======================================================================
" Plugins 
"=======================================================================
" Autoinstall vim-plug 
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.vim/plugged')
" General
Plug 'tpope/vim-commentary'            " Commenting operator gc
Plug 'Xuyuanp/git-nerdtree'            " Nerd tree with git integration
Plug 'Raimondi/delimitMate'            " Smart auto-completion of ([' etc.
Plug 'bling/vim-airline'               " Fancy status bar
Plug 'tpope/vim-fugitive'              " Git plugin
Plug 'tpope/vim-repeat'                " Repeat all kinds of stuff
Plug 'tpope/vim-surround'              " Surround motions
Plug 'tpope/vim-abolish'               " Add :S/repl/ace
Plug 'szw/vim-maximizer'               " Temporarily maximize window
Plug 'kien/ctrlp.vim'                  " Fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'PeterRincker/vim-argumentative'  " i, a, text objects; >, <, movement
Plug 'andymass/vim-matchup'            " More jumps for % (e.g. <Tag> or if/endif), text objs: a%, i%
Plug 'mbbill/undotree'                 " Undo history as a tree
Plug 'ivyl/vim-bling'                  " blink on / n N
Plug 'rking/ag.vim'                    " Silver searcher: faster vimgrep/grep:
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'honza/vim-snippets'              " Snippets
Plug 'Lokaltog/vim-easymotion'
Plug 'xolox/vim-misc'
Plug 'jpalardy/vim-slime'              " REPL interaction
Plug 'Yggdroot/indentLine'             " Insert vertical lines to show indentation levels
Plug 'airblade/vim-gitgutter'          " ]c [c
Plug 'mattn/gist-vim'                  " buffer or selection to gist with :Gist
Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'dbakker/vim-projectroot'
Plug 'ktonga/vim-follow-my-lead'
Plug 'mattn/webapi-vim'
Plug 'janko-m/vim-test'
Plug 'junegunn/vim-peekaboo'

" Colors
Plug 'https://github.com/freeo/vim-kalisi'
Plug 'jonathanfilip/vim-lucius'
Plug 'croaker/mustang-vim'
Plug 'noahfrederick/vim-hemisu'
Plug 'tomasr/molokai'
Plug 'junegunn/seoul256.vim'

" Additional functionality
Plug 'vim-scripts/IndexedSearch'
Plug 'junegunn/vim-easy-align'         " :'<,'>EasyAlign [*] DELIM or /regex/
Plug 'godlygeek/tabular'               " :'<,'>Tabularize /regex"
Plug 'vim-scripts/yaifa.vim'
Plug 'kana/vim-textobj-user'           " Needed for textobj-python
Plug 'bkad/CamelCaseMotion'
Plug 'sgur/vim-textobj-parameter'
Plug 'saihoooooooo/vim-textobj-space'
Plug 'mattn/vim-textobj-url'
Plug 'kana/vim-textobj-line'           " line text object (w/o trailing ^M): yal, yil etc.
Plug 'thinca/vim-textobj-between'
Plug 'hafenr/vim-textobj-dotseparated'
Plug 'hafenr/vim-textobj-underscore'
Plug 'milkypostman/vim-togglelist'     " toggle quickfix and location list
Plug 'editorconfig/editorconfig-vim'   " read .editorconfig files and set variables
Plug 'vim-scripts/renamer.vim'         " bulk rename by calling :Renamer
" R
Plug 'jalvesaq/Nvim-R', { 'for': 'r' }
" JavaScript, TypeScript
Plug 'jason0x43/vim-js-indent'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
" HTML, CSS/LESS
" Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim', { 'for': 'html' }                   " Expand html: ul>li*3<C-l>
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'groenewege/vim-less', { 'for': 'less' }
" Python
Plug 'michaeljsmith/vim-indent-object', { 'for': 'python' } " Indent-level as text obj.
Plug 'bps/vim-textobj-python', { 'for': 'python' }          " Provides class: ac, ic; Function: af, if
" Scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
" Nix
Plug 'LnL7/vim-nix'

call plug#end()

"=======================================================================
" Basic settings 
"=======================================================================
set clipboard^=unnamed
set nocompatible
set dictionary+=/usr/share/dict/words " Specify the builtin list of words for C-X C-K completion
set thesaurus+=~/.vim/extra/mthesaur.txt
set spelllang=en_us
set nospell
" set encoding="utf-8"
syntax on                           " enable syntax highlighting
filetype plugin on
filetype indent on
" Whitespace
set shiftwidth=4                    " number of spaces to autoindent
" set cryptmethod=blowfish2
set tabstop=4                       " # spaces shown for one TAB
set softtabstop=4                   " # spaces that are actually inserted/removed for a tab
set expandtab                       " insert spaces when hitting TAB (with above options)
set autoindent                      " enable autoindenting
set linebreak                       " vim will break lines at the chars given in 'set brakeat'
set shiftround
set backspace=indent,eol,start
set list
" set list listchars=tab:\ ,nbsp:·,trail:␣,extends:▸,precedes:◂
" set list listchars=tab:»·,trail:·,extends:$,nbsp:= " Display tabs and trailing whitespace
set listchars=tab:·\ ,nbsp:·,trail:•,extends:❯,precedes:❮
" set showbreak=......\|\             " show linebreaks with: ......| wrapped text
set textwidth=0                     " don't insert EOLs at linebreak
set relativenumber                  " view line numbers
set number                          " show current line number (others will still be relative)
set noshowmode
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
set noincsearch                       " incremental search: search as you type the query string
set ignorecase                      " ignores case while searching
set smartcase                       " if a search contains a upper case char, make search case sensitive
set diffopt=vertical                " always split vertical with :diffsplit otherfile
set tags=./.tags,.tags,./tags,tags
set wildignore+=*.o,*.obj,.git,*.class,target,project,build " ignore files for command-t
set wrap                            " wrap whole words
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
set cursorline                      " Highlight current line
let grepprg="ag\ --nocolor\ --nogroup\ --silent"
set showmatch                       " Highlight (blinking) matching [{( when inserting the closing )}]
let g:vim_json_conceal=0

"=======================================================================
" Auto commands 
"=======================================================================
augroup general
    autocmd!
    autocmd BufEnter .vimrc setlocal foldmethod=marker
augroup END

augroup terminal
    autocmd BufWinEnter,WinEnter term://* startinsert
    autocmd BufLeave term://* stopinsert
augroup END

augroup filetypes
    autocmd!
    autocmd BufNewFile,BufRead,BufFilePre *.md set filetype=markdown
    autocmd BufNewFile,BufRead,BufFilePre *.ts set filetype=typescript
    autocmd BufNewFile,BufRead,BufFilePre *.tsx set filetype=typescript.tsx
    autocmd BufNewFile,BufRead,BufFilePre *.jsx set filetype=javascript.jsx
    " autocmd BufWritePost *.scala silent :EnTypeCheck
augroup END

" ftplugin ignored for some reason
augroup rust_mappings
    autocmd!
    autocmd FileType rust nnoremap <buffer><silent> <space>id :CocCommand rust-analyzer.openDocs<CR>
augroup END

augroup misc
    autocmd!
    " Automatically open qfix list
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost    l* nested lwindow
    " Automatically delete trailing whitespace
    " autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
    autocmd FileType qf
          \ nnoremap <buffer><silent> q :close<CR> |
          \ map <buffer><silent> <F4> :close<CR> |
          \ map <buffer><silent> <F8> :close<CR>
augroup END

augroup python_settings
    autocmd!
    autocmd FileType python setlocal foldmethod=indent foldnestmax=2
    autocmd FileType python setlocal shiftwidth=4 tabstop=4
augroup END

" Auto-remove trailing whitespace on save
autocmd BufWritePre *.py :%s/\s\+$//e
" 

"======================================================================
" Mappings 
"=======================================================================
" Basic  "
let mapleader='\<space>'
let maplocalleader = ","
nnoremap ; :
xnoremap ; :
nnoremap : ;
xnoremap : ;
nnoremap <space>w :w<CR>
nnoremap <space>. :source ~/.vimrc<CR>
cnoremap jk <CR>
nnoremap ,r :%s/<C-r><C-w>//g<Left><Left>
" nnoremap <silent> <space>e :Neomake!<CR>
nmap <space>j <Plug>(easymotion-prefix)j
nmap <space>k <Plug>(easymotion-prefix)k
" Insert file name
nnoremap ,f i=expand('%:t:r')<CR><ESC>
" Select most recently pasted text
nnoremap gV `[v`]
" Append a comment
nnoremap <C-a> A  <C-r>=&comments[1]<CR>
nmap K i<CR><Esc>d^==kg_lD
noremap <S-F4> :s/ASDF/\=line('.')-line("'<")"<CR>
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
" It allows emacs-like navigation in command mode and insert mode
" The reason I didn't include the full plugin was that some of
" its meta-mappings messed with my keyboard layout
" BEGIN vim-rsi snippet
inoremap        <C-A> <C-O>^
cnoremap        <C-A> <Home>
inoremap <expr> <C-B> getline('.')=~'^\s*$'&&col('.')>strlen(getline('.'))?"0\<Lt>C-D>\<Lt>Esc>kJs":"\<Lt>Left>"
cnoremap        <C-B> <Left>
inoremap <expr> <C-D> col('.')>strlen(getline('.'))?"\<Lt>C-D>":"\<Lt>Del>"
cnoremap <expr> <C-D> getcmdpos()>strlen(getcmdline())?"\<Lt>C-D>":"\<Lt>Del>"
inoremap <expr> <C-E> col('.')>strlen(getline('.'))?"\<Lt>C-E>":"\<Lt>End>"
inoremap <expr> <C-F> col('.')>strlen(getline('.'))?"\<Lt>C-F>":"\<Lt>Right>"
cnoremap <expr> <C-F> getcmdpos()>strlen(getcmdline())?&cedit:"\<Lt>Right>"
" END vim-rsi snippet
" EasyAlign
vnoremap <silent> <Enter> :EasyAlign<cr>
" Git
nnoremap <space>gg :Git<CR>
nnoremap <space>gs :Git<CR>
nnoremap <space>gp :Git push<CR>
nnoremap j gj
nnoremap k gk

" Quickfix
nmap <script> <silent> <space>a :call ToggleLocationList()<CR>
nmap <script> <silent> <space>q :call ToggleQuickfixList()<CR>

" Navigating quickfix list (gets populated by e.g. vimgrep/ag)
nnoremap ]q     :cnext<CR>
nnoremap ]Q     :cfirst<CR>
nnoremap [q     :cprevious<CR>
nnoremap [Q     :clast<CR>

" Navigating the location list (gets populated by e.g. Syntastic)
nnoremap ]a     :lnext<CR>
nnoremap ]A     :lfirst<CR>
nnoremap [a     :lprevious<CR>
nnoremap [A     :llast<CR>

" Buffers, files, tags
nnoremap <C-p>    :Files<CR>
nnoremap <space>r :Buffers<CR>
nnoremap <space>; :Commands<CR>
nnoremap <space>g :Tags<CR>

" Searching
nnoremap <space>ps :LAg ""<Left>
nnoremap <space>pa :Ag ""<Left>
nnoremap <space>sa :%s//g<Left><Left>
nnoremap <space>su :%s///g<Left><Left>
nnoremap <silent> <space>p/ :call SearchWordWithAg()<CR>
vnoremap <silent> <space>pa :call SearchVisualSelectionWithAg()<CR>

" NERD Tree
nnoremap <space>pt :NERDTreeToggle<CR>
nnoremap <space>pf :NERDTreeFind<CR>

" Dirs
nnoremap <space>dl :lcd %:p:h<CR>
nnoremap <space>dc :cd %:p:h<CR>
nnoremap <space>dd :CtrlPDir<CR>

" Toggle features
nnoremap <space>ti :IndentLinesToggle<CR>

" Windows
nnoremap <C-w>m :MaximizerToggle<CR>
vnoremap <C-w>m :MaximizerToggle<CR>gv

" Command-Arrow to resize current buffer by +/- 5
" :vert res +5 <CR> and then repeat last ex-command with @: @@ @@ @@
nnoremap <C-w>< 10<C-w><
nnoremap <C-w>> 10<C-w>>
nnoremap <C-w>- 10<C-w>-
nnoremap <C-w>+ 10<C-w>+

"=======================================================================
" Terminal settings 
"=======================================================================
" Mappings for neovim
if has('nvim')
    " ESC escapes :term (can't send ESC to terminal
    " processes anymore)
    " tnoremap <C-[> <C-\><C-n>
    " Select something visually and then t
    " sends it to the next window which should be
    " :term
    :xnoremap t y<C-w>wpA<CR><C-\><C-n><C-w>w
    nnoremap <silent> <space>tt :tabnew<CR>:terminal<CR>
    nnoremap <space><F1> :execute 'terminal ranger ' . expand('%:p:h')<CR>
    nnoremap <space><F2> :terminal ranger<CR>
    " Opening splits with terminal in all directions
    nnoremap <space>th :leftabove  vnew<CR>:terminal<CR>
    nnoremap <space>tl :rightbelow vnew<CR>:terminal<CR>
    nnoremap <space>tk :leftabove  new<CR>:terminal<CR>
    nnoremap <space>tj :rightbelow new<CR>:terminal<CR>

    au TermOpen * tnoremap <Esc> <C-\><C-n>
    au FileType fzf tunmap <Esc>

    tnoremap <C-\><C-\> <C-\><C-n>:bd!<CR>

    tnoremap <C-w>h <C-\><C-n><C-w>h
    tnoremap <C-w>j <C-\><C-n><C-w>j
    tnoremap <C-w>k <C-\><C-n><C-w>k
    tnoremap <C-w>l <C-\><C-n><C-w>l
    tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>
endif

"=======================================================================
" Abbreviations 
"=======================================================================
" recursive search with :e
" :e r/filename
" cabbrev r ./**
cabbrev stat ~/Dropbox/CBB/StatMethods
iab ipdb import ipdb; ipdb.set_trace()
" 
"=======================================================================
" Plugin settings 
"=======================================================================
 
"  COC
"-----------------------------------------------------------------------
" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

let g:coc_global_extensions = ['coc-tsserver']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Show documentation in preview window.
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Highlight the symbol and its references when holding the cursor.
" Formatting selected code.
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>ia :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>ie :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>ic :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>io :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>is :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>ij :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>ik :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>ip :<C-u>CocListResume<CR>
" Apply AutoFix to problem on the current line.
nmap K :call   <SID>show_documentation()<CR>
" Navigation
" - Use `[d` and `]d` to navigate diagnostics
" - Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <space>it <Plug>(coc-type-definition)
nmap <space>iq <Plug>(coc-codeaction)
nmap <space>it <Plug>(coc-type-definition)
nmap <space>ii <Plug>(coc-implementation)
nmap <space>ir <Plug>(coc-references)
nmap <C-]>     <Plug>(coc-definition)
nmap <space>gd <Plug>(coc-definition)
" Code actions
nmap <space>ir <Plug>(coc-rename)
nmap <space>ix <Plug>(coc-fix-current)
xmap <space>if <Plug>(coc-format-selected)
nmap <space>if <Plug>(coc-format-selected)
nmap <space>if <Plug>(coc-references)
nmap <space>im <Plug>(coc-implementation)
nmap <space>id <Plug>(coc-diagnostic-info)
nmap <space>ir <Plug>(coc-rename)

" augroup typescript_mappings
    " autocmd!
    " autocmd FileType typescript,typescript.tsx nnoremap <buffer><silent> <C-]> :call CocActionAsync('jumpDefinition')<CR>
    " autocmd FileType typescript,typescript.tsx nnoremap <buffer><silent> K :call <SID>show_documentation()<CR>
    " autocmd FileType typescript,typescript.tsx nmap <buffer><silent> <C-]> <Plug>(coc-definition)
    " autocmd FileType typescript,typescript.tsx nmap <buffer><silent> <space>id <Plug>(coc-definition)
    " autocmd FileType typescript,typescript.tsx nmap <buffer><silent> <space>if <Plug>(coc-references)
    " autocmd FileType typescript,typescript.tsx nmap <buffer><silent> <space>im <Plug>(coc-implementation)
    " autocmd FileType typescript,typescript.tsx nmap <buffer><silent> <space>ii <Plug>(coc-diagnostic-info)
    " autocmd FileType typescript,typescript.tsx nmap <buffer><silent> <space>ir <Plug>(coc-rename)
    " autocmd FileType typescript,typescript.tsx nmap <buffer><silent> <space>it <Plug>(coc-type-definition)
" augroup END

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

"  delimitMate
"-----------------------------------------------------------------------
let delimitMate_expand_cr = 1

"  indentLine
"-----------------------------------------------------------------------
" Enable with :IndentLinesToggle
let g:indentLine_char = '┆'

"  Maximizer
"-----------------------------------------------------------------------
let g:maximizer_set_default_mapping = 0

"  Ag
"-----------------------------------------------------------------------
set grepprg=ag\ --column " then navigate qf window with ]q and [q

"  Vim-slime
"-----------------------------------------------------------------------
let g:slime_target = "tmux"
let g:slime_python_ipython = 1

"  EasyAlign
"-----------------------------------------------------------------------
" Start interactive EasyAlign in visual mode
" :EasyAlign */regex aligns on all matches of regex, 2/regex on every second etc.

" Netrw  "
"-----------------------------------------------------------------------
let g:netrw_preview = 1 " p previews file in vertical split
let g:netrw_altv = 0  " Split to the right

" easytags  "
"-----------------------------------------------------------------------
" ctags -R --languages=typescript --exclude=node_modules .
let g:easytags_async = 1
let g:easytags_dynamic_files = 1

"  Ctrlp
"-----------------------------------------------------------------------
let g:ctrlp_map = '<space>pl'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1
let g:ctrlp_cmdpalette_execute = 1
" Default is search by full path. Switch with CTRL-d while in CtrlP prompt.
" let g:ctrlp_by_filename = 0
let g:ctrlp_root_markers = ['.ctrlp']

let g:ctrlp_custom_ignore = {
\   'dir':  '\v(\.git|\.hg|\.svn|\.yardoc|public/images|public/system|resources/public/js|target|node_modules|bower_components)$',
\   'file': '\v\.(o|m4a|pdf|swp|pyc|wav|mp3|ogg|blend|dvi|fls|aux|blg|bbl|log|loa|lof|toc|fdb_latexmk|lot|js.map|min.js|min.css|)$|\~$'
\   }

" Save cache across sessions => much faster. Refresh with F5.
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrl_user_command = 'ag %s -l --nocolor --hidden -g ""'

"  Airline
"-----------------------------------------------------------------------
" : %3p : %4l : %3c
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'
let g:airline_section_y = airline#section#create(["cwd:%{split(getcwd(), '/')[-1]}% "])
let g:airline_section_z = '%2p%% %2l/%L:%2v'
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_exclude_preview = 1

"  Typescript
"-----------------------------------------------------------------------
" : %3p : %4l : %3c
let g:typescript_compiler_use_tsconfig = 1

"  FZF
"-----------------------------------------------------------------------
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

"=======================================================================
" Custom functions and commands 
"=======================================================================
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

" Edit vimrc
command! Rc e ~/.vimrc

" Change between tab sizes
function! SetTabSize(number)
    exec "setlocal expandtab tabstop=" . a:number
    exec "setlocal shiftwidth=" . a:number
    exec "setlocal softtabstop=" . a:number
endfunc
command! -nargs=1 Tab call SetTabSize(<f-args>)

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction

function! SearchWordWithAg()
  execute 'Ag' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'Ag' selection
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction
 
"=======================================================================
" Cursor config 
"=======================================================================
" Show insert cursor as yellow and normal mode cursor as light green.
highlight Cursor guifg=black guibg=#00ff1e
highlight iCursor guifg=black guibg=cyan
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkon0
