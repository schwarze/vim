set nocompatible               " be iMproved
language messages C

filetype off                   " must be off before Vundle has run

let g:activevimdir=fnamemodify($MYVIMRC, ":p:h")
let $LOCALHOME = substitute($HOME, "\\", "/", "g")
let $HOME=g:activevimdir

execute "set runtimepath^=".expand('<sfile>:p:h')."/.vim"
execute "set runtimepath^=".expand('<sfile>:p:h')."/vim"
execute "set runtimepath^=".expand('<sfile>:p:h')."/vim/after"

if !isdirectory($LOCALHOME."/vim")
    call mkdir($LOCALHOME."/vim", "p")
endif

if !isdirectory($LOCALHOME."/vim/after")
    call mkdir($LOCALHOME."/vim/after", "p")
endif

if !isdirectory($LOCALHOME."/.vim/doc")
    call mkdir($LOCALHOME."/.vim/doc", "p")
endif

if !isdirectory($LOCALHOME."/.vimtmp/swap")
    call mkdir($LOCALHOME."/.vimtmp/swap", "p")
endif

if !isdirectory($LOCALHOME."/.vimtmp/undo")
    call mkdir($LOCALHOME."/.vimtmp/undo", "p")
endif

if !isdirectory($LOCALHOME."/.vimtmp/local")
    call mkdir($LOCALHOME."/.vimtmp/local", "p")
endif

if !isdirectory($LOCALHOME."/.vimtmp/session")
    call mkdir($LOCALHOME."/.vimtmp/session", "p")
endif

if !isdirectory($LOCALHOME."/.vimtmp/ctrlpcache")
    call mkdir($LOCALHOME."/.vimtmp/ctrlpcache", "p")
endif

if !isdirectory($LOCALHOME."/.vimtmp/startup")
    call mkdir($LOCALHOME."/.vimtmp/startup", "p")
endif

execute "set dir=".$LOCALHOME."/.vimtmp/swap//"
execute "set undodir=".$LOCALHOME."/.vimtmp/undo//"

let g:netrw_home=$LOCALHOME ."/.vimtmp/local"
let g:startup_dir=$LOCALHOME."/.vimtmp/startup"

exec "cd ".g:startup_dir

set runtimepath+=~/.vim/bundle/Vundle.vim

if exists('+undofile')
    set undofile
endif


function! DefinePlugins ()
    call vundle#begin()

    Plugin 'gmarik/Vundle.vim'
    Plugin 'cecutil'

    Plugin 'abra/vim-abra'

    Plugin 'pelodelfuego/vim-swoop'
    "" Files
    Plugin 'scrooloose/nerdtree'
    Plugin 'jistr/vim-nerdtree-tabs'
    Plugin 'rking/ag.vim'
    Plugin 'dietsche/vim-lastplace'
    Plugin 'gelguy/Cmd2.vim'

    " Syntax
    Plugin 'scrooloose/syntastic'

    "Utility
    Plugin 'Align'
    Plugin 'SQLUtilities'
    Plugin 'tpope/vim-fugitive'
    Plugin 'vim-scripts/searchfold.vim'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'tpope/vim-surround'
    Plugin 'nathanaelkane/vim-indent-guides'
    Plugin 'zirrostig/vim-schlepp'
    Plugin 'cmdline-completion'
    Plugin 'IndexedSearch'
    "Plugin 'LargeFile'
    "Plugin 'matchparenpp'
    Plugin 'mbbill/undotree'
    Plugin 'mbriggs/mark.vim'
    Plugin 'tpope/vim-abolish'
    Plugin 'repeat.vim'
    Plugin 'speeddating.vim'
    Plugin 'milkypostman/vim-togglelist'
    Plugin 'terryma/vim-expand-region'
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'kana/vim-textobj-user'
    Plugin 'glts/vim-textobj-comment'
    Plugin 'kana/vim-textobj-entire'
    Plugin 'textobj-fold'
    Plugin 'textobj-indent'
    Plugin 'textobj-lastpat'
    Plugin 'textobj-line'
    Plugin 'textobj-syntax'
    Plugin 'textobj-verticalbar'
    Plugin 'ReplaceWithRegister'
    Plugin 'vim-textobj-quoted'
    Plugin 'The-NERD-Commenter'
    Plugin 'sk1418/Join'
    Plugin 'vim-scripts/Visual-Mark'
    Plugin 'vim-scripts/writebackup'
    Plugin 'mjbrownie/swapit'
    Plugin 'VisIncr'
    Plugin 'vim-scripts/ingo-library'
    Plugin 'vim-scripts/PatternsOnText'
    Plugin 'godlygeek/tabular'
    Plugin 'vim-scripts/NumUtils'
    Plugin 'moll/vim-bbye'
    Plugin 'joeytwiddle/sexy_scroller.vim'
    Plugin 'chrisbra/Recover.vim'
    Plugin 'majutsushi/tagbar'
    Plugin 'luochen1990/rainbow'
    Plugin 'tyru/open-browser.vim'
    Plugin 'arecarn/crunch.vim'
    Plugin 'deris/vim-rengbang'

    " CTRLP
    Plugin 'kien/ctrlp.vim'
    Plugin 'tacahiroy/ctrlp-funky'
    Plugin 'mattn/ctrlp-register'
    Plugin 'mattn/ctrlp-mark'
    Plugin 'sgur/ctrlp-extensions.vim'

    Plugin 'szw/vim-ctrlspace'

    " Formatters
    Plugin 'tpope/vim-jdaddy'

    " Language support
    "Plugin 'pangloss/vim-javascript'

    " Snippets
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'vim-scripts/tlib'
    Plugin 'garbas/vim-snipmate'
    Plugin 'honza/vim-snippets'

    Plugin 'ervandew/supertab'

    " Own stuff
    Plugin 'schwarze/schwarze-vim-snippets'

    call vundle#end()

    filetype plugin indent on     " and turn it back on!

    runtime macros/matchit.vim
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OS specific
if has('gui_macvim')
    let macvim_skip_cmd_opt_movement = 1
    set grepprg=grep\ -nR
    let g:ctrlp_mruf_case_sensitive = 1
elseif has('win32') || has('win64')
    try
        try
            set guifont=Consolas:h9
        catch
        endtry
        set grepprg=findstr\ /N\ /I\ /S
        let g:ctrlp_mruf_case_sensitive = 0
    catch
    endtry
endif

" The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 1
  let g:ag_highlight=1
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sessions:
let g:SessionSaveDirectory = $LOCALHOME."/.vimtmp/session"
let g:SessionPath = $LOCALHOME."/.vimtmp/session"
let g:SessionFilePrefix = ".vimsession_"
let g:SessionFileSuffix = ""

let loaded_matchparen = 1

let g:changes_autocmd=0
let g:session_autosave = 'no'

let s:cwhl=0

let g:swoopUseDefaultKeyMap = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS:
"Syntax:
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
            \ "mode": "passive",
            \ "active_filetypes": [],
            \ "passive_filetypes": [] }


let g:expand_region_text_objects = {
      \ 'iw' :0,
      \ 'iW' :0,
      \ 'i"' :0,
      \ 'i''':0,
      \ 'i]' :1,
      \ 'ib' :1,
      \ 'iB' :1,
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1,
      \ 'il' :0,
      \ 'ii' :0,
      \ 'ai' :0,
      \ 'ip' :0
      \ }

let g:toggle_list_no_mappings=1

let g:SuperTabDefaultCompletionType = "<C-x><C-p>"
let g:SuperTabLongestEnhanced=1

let g:searchfold_do_maps = 0

" Windows flicker prevention:
let g:SexyScroller_MaxTime = 1
let g:SexyScroller_CursorTime=0
let g:SexyScroller_ScrollTime=1
let g:SexyScroller_EasingStyle = 0
let g:SexyScroller_DetectPendingKeys = 1
let g:SexyScroller_MinLines=3
let g:SexyScroller_MinColumns=200

"let g:SexyScroller_MaxTime = 150
"let g:SexyScroller_CursorTime=2
"let g:SexyScroller_ScrollTime=5
"let g:SexyScroller_EasingStyle=1
"let g:SexyScroller_DetectPendingKeys=1
"let g:SexyScroller_MinLines=5
"let g:SexyScroller_MinColumns=200

" easymotion
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz1234567890'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_prompt = '{n}>>> '
let g:EasyMotion_landing_highlight = 1

" CTRLP
let g:ctrlp_cache_dir = $LOCALHOME."/.vimtmp/ctrlpcache"
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 1000
let g:ctrlp_max_depth = 3
let g:ctrlp_extensions = ['tag', 'line', 'changes', 'mixed', 'register', 'yankring', 'cmdline']
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_new_file = 't'
let g:ctrlp_map = '<C-S-Space>'

let g:ctrlp_prompt_mappings = {
            \ 'PrtBS()':              ['<bs>', '<c-]>'],
            \ 'PrtDelete()':          ['<del>'],
            \ 'PrtDeleteWord()':      ['<c-w>'],
            \ 'PrtClear()':           ['<c-u>'],
            \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
            \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
            \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
            \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
            \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
            \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
            \ 'PrtHistory(-1)':       ['<c-n>'],
            \ 'PrtHistory(1)':        ['<c-p>'],
            \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
            \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
            \ 'AcceptSelection("t")': ['<c-t>'],
            \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
            \ 'ToggleFocus()':        ['<s-tab>'],
            \ 'ToggleRegex()':        ['<c-r>'],
            \ 'ToggleByFname()':      ['<c-d>'],
            \ 'ToggleType(1)':        ['<c-f>', '<c-down>', '<right>'],
            \ 'ToggleType(-1)':       ['<c-b>', '<c-up>', '<left>'],
            \ 'PrtExpandDir()':       ['<tab>'],
            \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
            \ 'PrtInsert()':          ['<c-\>'],
            \ 'PrtCurStart()':        ['<c-a>'],
            \ 'PrtCurEnd()':          ['<c-e>'],
            \ 'PrtCurLeft()':         ['<c-h>', '<c-left>', '<c-^>'],
            \ 'PrtCurRight()':        ['<c-l>', '<c-right>'],
            \ 'PrtClearCache()':      ['<F5>'],
            \ 'PrtDeleteEnt()':       ['<F7>'],
            \ 'CreateNewFile()':      ['<c-y>'],
            \ 'MarkToOpen()':         ['<c-z>'],
            \ 'OpenMulti()':          ['<c-o>'],
            \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
            \ }

" Nerdtree
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeBookmarksFile = $LOCALHOME."/.vimtmp/local/NERDTreeBookmarks"
"let g:NERDTreeMapToggleZoom = "-"
"let g:NERDTreeMapChdir = "x"
let g:NERDTreeMapCloseDir = "c"
let g:NERDTreeMapCloseChildren = "C"
let g:NERDTreeMapHelp = "?"
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeWinPos = "right"
let g:NERDTreeCascadeOpenSingleChildDir = 1

let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_autofind = 1
let g:nerdtree_tabs_smart_startup_focus = 2
let g:nerdtree_tabs_focus_on_files = 0

let g:indent_guides_default_mapping = 0

let g:ctrlspace_cache_dir = $LOCALHOME."/.vimtmp/local/.cs_cache"
let g:ctrlspace_unicode_font = 0
let g:ctrlspace_use_tabline = 1

let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_compact = 1

let g:rainbow_active = 0

let  g:Schlepp#dupTrimWS = 1

let g:multi_cursor_start_key='<C-d>'
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-e>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_exit_from_visual_mode=0
let g:DrChipTopLvlMenu = "Plugin."

let g:undotree_SetFocusWhenToggle = 1

let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Parameters
let g:mapleader=" "
let g:maplocalleader=" "
let s:completeopt_default=&completeopt
let g:scratch_height = 20
let g:HighlightCurrentWordToggled = 0
let &listchars = "tab:\u00bb ,trail:\u00b7,eol:\u0020,extends:\u0020,precedes:\u0020,nbsp:\u00b7"

set autoread
set autochdir
set backspace=indent,eol,start
set breakat+=\|
set browsedir=buffer
set cmdheight=2
set complete=.,w,b,u,i
set completeopt=menu,longest
set confirm
set cpo-=<
set cryptmethod=blowfish
set display=lastline,uhex
set efm+=%f
set encoding=utf-8
set expandtab
set fcs=vert:\ ,fold:\
set fileencodings=ucs-bom,utf-8,default,latin1
set fo=qr
set foldcolumn=1
set foldmethod=manual
set nogdefault
"set guicursor+=a:blinkon0
set guioptions=rcAb
set hidden
set history=100
set hlsearch
set ignorecase smartcase
set incsearch
set km=startsel
set laststatus=2
set lazyredraw
"set linespace=0
set list
set modelines=0
set mouse=a
set mousemodel=extend
set mouseshape=n:arrow,i:arrow,r:arrow,v:arrow,o:arrow,s:updown,sd:updown,m:no,ml:up-arrow,vs:leftright,vd:leftright
set autoindent
set nobackup writebackup
set cindent
set cursorline
set nocursorcolumn
set noerrorbells
set nofoldenable
set nojoinspaces
set nomodeline
set nomore
set noruler
set noshellslash
set noshowcmd
set noshowmatch
set noshowmode
set nostartofline
set number
set printexpr=system('open\ -a\ Preview\ '.v:fname_in)\ +\ v:shell_error
set printoptions=paper:A4,number:y,syntax:n,duplex:long
set report=2
set sessionoptions=buffers,tabpages
set shiftwidth=4
set shortmess+=aoOtTI
set showbreak=
set showtabline=0
set sidescroll=1
set sidescrolloff=1
"set nosmartindent
set smarttab
set softtabstop=4
set spelllang=en_us
set splitbelow
set splitright
set swapfile
set switchbuf=usetab
set tabline=
set tabstop=4
set tagrelative
set tags=./**/tags,tags,tags;
set termencoding=utf-8
set textwidth=0
set title titlestring=%{getcwd()}
set titlelen=0
set ttyfast
set ttyscroll=3
set undolevels=1000
set updatetime=500
set vb t_vb=
set virtualedit=all
set visualbell
set wak=no
set wcm=<C-Z>
set wildmenu
set wildmode=full
set wrap
set ww=<,>,[,],b,s,~

exe "set viminfo='100,s100,:100,/100,@100,h,rA:,rB:,f1,!,n".$LOCALHOME."/.vimtmp/local/viminfo"

let g:IsVundleInstalled = isdirectory(expand($LOCALHOME."/.vim/bundle/Vundle.vim/.git"))

if g:IsVundleInstalled
    call DefinePlugins()
endif

function! DefineMapping()
    try
        AlignMapsClean
    catch
    endtry
    "***************************************
    " yunk maps
    map €swp <Plug>SaveWinPosn
    map €rwp <Plug>RestoreWinPosn
    nmap €mm <Plug>MarkSet
    nmap €ms <Plug>MarkSet
    nmap €mu <Plug>MarkClear
    nmap €mr <Plug>MarkRegex
    nmap €mc <Plug>MarkAllClear
    nmap €m<down> <Plug>MarkSearchNext
    nmap €m<up> <Plug>MarkSearchPrev
    nmap €m/ <Plug>MarkSearchAnyNext
    nmap €m? <Plug>MarkSearchAnyPrev
    nmap €m* <Plug>MarkSearchCurrentNext
    nmap €m# <Plug>MarkSearchCurrentPrev
    " crunch
    map €cl <Plug>CrunchEvalLine
    map €cb <Plug>CrunchEvalBlock

    imap <S-Del> <C-o>dd
    nnoremap <k3> <C-U>
    nnoremap <kPoint> <C-D>

    function! s:CustomFuzzySearch(string)
      let pattern = ""
      let ignore_case = g:Cmd2__complete_ignorecase ? '\c' : ''
      let char = matchstr(a:string, ".", byteidx(a:string, 0))
      let pattern = '\V' . ignore_case
      let pattern .= '\<\%(\[agls]\:\)\?'
      let pattern .= '\%(\%(\k\*\[._\-#]\)\?' . char . '\|\k\*\%(' . char . '\&\L\)\)'
      if g:Cmd2__complete_fuzzy
        let result = ''
        let i = 1
        while i < len(a:string)
          let char = matchstr(a:string, ".", byteidx(a:string, i))
          let result .= '\%(' . '\%(\k\*\[._\-#]\)\?' . char . '\|'
          let result .= '\k\*\%(' . char . '\&\L\)' . '\)'
          let i += len(char)
        endwhile
        let pattern .= result
      else
        let pattern .= a:string
      endif
      let pattern .= g:Cmd2__complete_end_pattern
      return pattern
    endfunction

    let g:Cmd2_options = {
          \ '_complete_ignorecase': 1,
          \ '_complete_uniq_ignorecase': 0,
          \ '_complete_pattern_func':
                \ function('s:CustomFuzzySearch'),
          \ '_complete_start_pattern':
                \ '\<\(\[agls]\:\)\?\(\k\*\[_\-#]\)\?',
          \ '_complete_fuzzy': 1,
          \ '_complete_string_pattern': '\v\k(\k|\.)*$',
          \ '_complete_loading_text': '...',
          \ }

    let g:Cmd2_cmd_mappings = {
      \ 'iw': {'command': 'iw', 'type': 'text', 'flags': 'Cpv'},
      \ 'ip': {'command': 'ip', 'type': 'line', 'flags': 'pv'},
      \ 'ap': {'command': 'ap', 'type': 'line', 'flags': 'pv'},
      \ '^': {'command': '^', 'type': 'normal!', 'flags': 'r'},
      \ "CF": {'command': function('Cmd2#ext#complete#Main'),
          \ 'type': 'function'},
      \ "CB": {'command': function('Cmd2#ext#complete#Main'),
          \ 'type': 'function'},
      \ 'w': {'command': 'Cmd2#functions#Cword',
          \ 'type': 'function', 'flags': 'Cr'},
      \ }

    cmap <C-RETURN> <Plug>Cmd2
    cmap <expr> <Tab> Cmd2#ext#complete#InContext() ? "\<Plug>Cmd2CF" : "\<Tab>"
    cmap <expr> <S-Tab> Cmd2#ext#complete#InContext() ? "\<Plug>Cmd2CB" : "\<S-Tab>"

    set wildcharm=<Tab>

    let g:Cmd2_loop_sleep=0
    let g:Cmd2_cursor_blink=0

    nmap <silent> zs :setlocal spell!<CR>
    nmap <silent> zn ]s
    nmap <silent> zp [s

    " Shortcut keys
    inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
    inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"

    imap <C-S-Tab> <Plug>snipMateShow
    smap <C-S-Tab> <Plug>snipMateShow

    nmap z/ <Plug>SearchFoldNormal
    nmap z( <Plug>SearchFoldInverse
    nmap z) <Plug>SearchFoldRestore

    "Swoop
    nmap <leader>7 :call Swoop()<CR>
    vmap <leader>7 :call SwoopSelection()<CR>
    nmap <leader>/ :call SwoopMulti()<CR>
    vmap <leader>/ :call SwoopMultiSelection()<CR>
    nmap <S-Space>/ :call SwoopMulti()<CR>
    vmap <S-Space>/ :call SwoopMultiSelection()<CR>


    "map <leader>0 <Plug>(easymotion-prefix)
    map <leader><leader>7 <Plug>(easymotion-sn)
    omap <leader><leader>7 <Plug>(easymotion-tn)

    "nnoremap <silent> <C-p> :CtrlPMixed<CR>
    " Schlepp
    vmap <silent> <S-M-up> <Plug>SchleppUp
    vmap <silent> <S-M-down> <Plug>SchleppDown
    vmap <silent> <S-M-left> <Plug>SchleppLeft
    vmap <silent> <S-M-right> <Plug>SchleppRight
    vmap <silent> <leader><up> <Plug>SchleppDupUp
    vmap <silent> <leader><down> <Plug>SchleppDupDown
    vmap <silent> <leader><left> <Plug>SchleppDupLeft
    vmap <silent> <leader><right> <Plug>SchleppDupRight

    nnoremap <silent> <C-S-Space> :CtrlPMixed<CR>
    nnoremap <silent> <leader>p :CtrlPMenu<CR>
    nnoremap <silent> <leader>p<space> :CtrlPMixed<CR>
    nnoremap <silent> <leader>pp :CtrlPLastMode<CR>
    nnoremap <silent> <leader>pb :CtrlPBuffer<CR>
    nnoremap <silent> <leader>pf :CtrlPFunky<CR>
    nnoremap <silent> <leader>pr :CtrlPRegister<CR>
    nnoremap <silent> <leader>pm :CtrlPMark<CR>
    nnoremap <silent> <leader>pc :CtrlPChange<CR>
    nnoremap <silent> <leader>pu :CtrlPUndo<CR>
    nnoremap <silent> <leader>pl :CtrlPMRUFiles<CR>
    nnoremap <silent> <leader>py :CtrlPYankring<CR>
    nnoremap <silent> <leader>pd :CtrlPCmdline<CR>

    nnoremap <silent><M-PageDown> :CtrlSpaceGoNext<CR>
    inoremap <silent><M-PageDown> <C-o>:CtrlSpaceGoNext<CR>
    nnoremap <silent><M-PageUp> :CtrlSpaceGoPrevious<CR>
    inoremap <silent><M-PageUp> <C-o>:CtrlSpaceGoPrevious<CR>
    nnoremap <silent><C-N> :CtrlSpaceTabLabel<CR>

    vnoremap / :S<SPACE>
    vnoremap . :B<SPACE>

    "nnoremap <silent><leader>v :LAg! "\b<C-R><C-W>\b"<CR>:lw<CR>
    nnoremap <S-Space>V :LAg!<space>
    "vnoremap <silent><leader>v :SearchListGrep<CR>

    nnoremap <silent> <leader>v :set opfunc=<SID>AckMotion<CR>g@
    xnoremap <silent> <leader>v :<C-U>call <SID>AckMotion(visualmode())<CR>

    nnoremap <silent> K :exec "LineBreakAt " . getline('.')[col('.')-1]<CR>
    nnoremap <S-Space>K :LineBreakAt<space>
    vnoremap K :VisualLineBreakAt<CR>

    map <leader>c <Plug>NERDComToggleComment
    nmap <silent> <C-s> ysiw

    map <C-F1> :silent! shell<CR>:echo<CR>
    imap <C-F1> <ESC>:silent! shell<CR>:echo<CR>

    map <F1> [
    map <F2> ]
    map! <F1> [
    map! <F2> ]
    map <F3> {
    map <F4> }
    map! <F3> {
    map! <F4> }

    map <F5> <
    map <F6> >
    map! <F5> <
    map! <F6> >
    map <F7> (
    map <F8> )
    map! <F7> (
    map! <F8> )

    map <F9> <bar>
    map <F10> ~
    map! <F9> <bar>
    map! <F10> ~
    map <F11> /
    map <F12> \
    map! <F11> /
    map! <F12> \

    "nnoremap <silent> <F12> :Fullscreen<CR>

    nnoremap <silent> <leader><BS> :emenu <C-Z>
    nnoremap <silent> <leader>l :set relativenumber!<CR>
    nnoremap <silent> <leader>L :set cursorcolumn!<CR>
    nnoremap <silent> <S-Space>L :set cursorcolumn!<CR>
    nnoremap <silent> <leader>n :ScratchToggle<CR>
    nnoremap <silent> <leader>b :tabe<CR>
    nnoremap <silent> <leader>B :bw<CR>
    nnoremap <silent> <S-Space>B :bw<CR>
    nmap <silent> <Leader>i <Plug>IndentGuidesToggle
    nnoremap <silent> <S-Space><S-Space>B :Bdelete<CR>
    nnoremap <silent> <leader><RETURN> :update<CR>
    nnoremap <silent> <S-Space><S-RETURN> :w<CR>:SyntasticCheck<CR>
    nnoremap <silent> <leader>- :NERDTreeToggle<CR>
    nnoremap <silent> <leader>_ :NERDTreeFind<CR>
    nnoremap <silent> <S-Space>_ :NERDTreeFind<CR>
    nnoremap <silent> <leader>. :TagbarToggle<CR>
    nnoremap <silent> <leader><M-b> :tab ball<CR>
    nnoremap <silent> <leader><C-b> :tab ball<CR>
    nnoremap <silent> <M-SPACE><M-b> :tab ball<CR>
    nnoremap <silent> <M-SPACE><M-B> :tabclose<CR>

    "** DiffMode ***************************
    nnoremap <silent> d<CR> :call ToggleDiff()<CR>
    nnoremap <silent> du :diffupdate<CR>
    nnoremap <silent> d<space> :call ToggleDiffOrig()<CR>
    nnoremap <silent> d<up> [c
    nnoremap <silent> d<down> ]c
    nnoremap <silent> d<left> :diffget<CR>
    nnoremap <silent> d<right> :diffput<CR>

    nnoremap <silent> <expr> <leader>y ToggleVirtualEdit()

    nnoremap <silent> <expr> <leader>w ToggleWrap()
    nnoremap <silent> <expr> <leader>ww ToggleWrap()

    nnoremap <leader>C :Count<CR>
    nnoremap <S-space>C :Count<CR>
    nnoremap <space><space>C :%Count<CR>
    nnoremap <S-space><S-space>C :%Count<CR>
    vnoremap <leader>C :Count<CR>
    vnoremap <S-space>C :Count<CR>

    nnoremap <silent> <leader>x :set invlist<CR>

    nnoremap <silent> <leader>u :UndotreeToggle<CR>

    nnoremap <silent> <leader>q @q
    vnoremap <silent> <leader>q :norm @q<CR>

    nnoremap <silent> <leader>, :Cleanup<CR>

    nmap <silent> <Leader>fb =aB
    nmap <silent> <Leader>fp =ap
    nmap <silent> <Leader>fj gqaj
    nmap <silent> <leader>fs :SQLU_Formatter<CR>
    vmap <silent> <leader>fs :SQLU_Formatter<CR>
    nmap <silent> <leader>fx :call XmlPretty()<CR>

    nmap <Plug>SwapItFallbackIncrement <Plug>SpeedDatingUp
    nmap <Plug>SwapItFallbackDecrement <Plug>SpeedDatingDown

    imap <C-w>q <C-o><C-w>q<ESC>
    imap <C-w><C-q> <C-o><C-w>q<ESC>

    "** Mac mapping **********************************************************************************
    if has('gui_macvim')
        noremap! <D-Left> <Home>
        noremap! <D-Right> <End>
        noremap! <D-Up> <C-Home>
        noremap! <D-Down> <C-End>
        inoremap <D-BS> 
        noremap! <D-Left> <Home>
        noremap! <D-Right> <End>
        noremap! <D-Up> <C-Home>
        noremap! <D-Down> <C-End>
        noremap! <M-D-Up> <PageUp>
        noremap! <M-D-Down> <PageDown>
        noremap! <D-7> {
        noremap! <D-8> [
        noremap! <D-9> ]
        noremap! <D-0> }
        noremap! <D-ß> \
        noremap! <D-#> <bar>
        noremap! <D-lt> <bar>
        noremap! <D-+> ~
        vnoremap <D-7> {
        vnoremap <D-8> [
        vnoremap <D-9> ]
        vnoremap <D-0> }
        vnoremap <D-ß> \
        vnoremap <D-#> <bar>
        vnoremap <D-lt> <bar>
        vnoremap <D-+> ~
        lnoremap <D-7> {
        lnoremap <D-8> [
        lnoremap <D-9> ]
        lnoremap <D-0> }
        lnoremap <D-ß> \
        lnoremap <D-#> <bar>
        lnoremap <D-lt> <bar>
        lnoremap <D-+> ~
        onoremap <D-7> {
        onoremap <D-8> [
        onoremap <D-9> ]
        onoremap <D-0> }
        onoremap <D-ß> \
        onoremap <D-#> <bar>
        onoremap <D-lt> <bar>
        onoremap <D-+> ~
        nnoremap <silent> <D-ß><D-ß> viW:B s!/!\\!ge<CR>
        vnoremap <silent> <D-ß><D-ß> :B s!/!\\!ge<CR>
        nnoremap <silent> <D-ß><D-ß><D-ß> viW:B s!\\!\\\\!ge<CR>
        vnoremap <silent> <D-ß><D-ß><D-ß> :B s!\\!\\\\!ge<CR>
        nnoremap <silent> <D-ß>/ viW:B s!\\!/!ge<CR>
        vnoremap <silent> <D-ß>/ :B s!\\!/!ge<CR>
        nnoremap <silent> <D-ß><D-ß>/ viW:B s!\\\\!/!ge<CR>
        vnoremap <silent> <D-ß><D-ß>/ :B s!\\\\!/!ge<CR>
        nnoremap <silent> <D-ß>// viW:B s!//!/!ge<CR>
        vnoremap <silent> <D-ß>// :B s!//!/!ge<CR>
    endif


    nnoremap <silent> <leader>z zfi{
    nnoremap <silent> <leader>Z zd
    nnoremap <silent> <S-space>Z zD
    nnoremap <silent> <expr> <leader>fa ToggleAutoread()

    nmap <silent> <kminus> :Changedirup<CR>
    nmap <silent> <kplus> :Changedir<CR>

    nmap <silent> <kDivide> :e<CR>
    nmap <silent> <kMultiply> :update<CR>
    nmap <silent> <C-kminus> :Clipfile<CR>
    nmap <silent> <S-kplus> <C-w>+
    nmap <silent> <S-kminus> <C-w>-
    imap <silent> <S-kplus> <C-o><C-w>+
    imap <silent>  <S-kminus> <C-o><C-w>-
    nnoremap Q/ q/
    nnoremap Q: q:
    nnoremap , :
    nnoremap ; q:
    nnoremap QÖ q:
    nnoremap ä @
    nnoremap Ä @@
    nnoremap ö /
    nnoremap Ö q/
    vnoremap , :
    vnoremap ; q:
    vnoremap QÖ q:
    vnoremap ä @
    vnoremap Ä @@
    vnoremap ö /
    vnoremap Ö q/

    nnoremap - "
    nnoremap _ "
    nnoremap + *

    xnoremap + :call StarRange__keepReg()<CR>gv"*y/\V<C-R>=StarRange__substituteSpecialChars(@*)<CR><CR>:call StarRange__restoreReg()<CR>:echo<CR>
    xnoremap * :call StarRange__keepReg()<CR>gv"*y/\V<C-R>=StarRange__substituteSpecialChars(@*)<CR><CR>:call StarRange__restoreReg()<CR>:echo<CR>
    xnoremap # :call StarRange__keepReg()<CR>gv"*y?\V<C-R>=StarRange__substituteSpecialChars(@*)<CR><CR>:call StarRange__restoreReg()<CR>:echo<CR>
    nnoremap <silent> <leader>+ :SearchList<CR>
    nnoremap <silent> <leader># :SearchListLast<CR>
    vnoremap <silent> <leader>+ :SearchListVisual<CR>
    "nnoremap <leader>/ :SearchListLast<CR>
    "nnoremap <S-Space>/ :SearchListLast<CR>
    nnoremap <leader>& :%Subvert/
    nnoremap <S-Space>& :%Subvert/
    nnoremap g+ g*

    "GIT stuff
    nnoremap <leader>gs :Gstatus<CR>
    nnoremap <leader>gc :Gcommit<CR>
    nnoremap <leader>gu :Gpull<CR>
    nnoremap <leader>gp :Git push<CR>
    nnoremap <leader>gf :Gfetch<CR>
    nnoremap <leader>gg :Ggrep<CR>
    nnoremap <leader>gl :Glog<CR>
    nnoremap <leader>gr :Gread<CR>
    nnoremap <leader>gw :Gwrite<CR>
    nnoremap <leader>gb :Gblame<CR>
    nnoremap <leader>gd :Gdiff<CR>

    nnoremap <S-space>R vip:RengBangConfirm<CR>
    vnoremap <S-space>R :B RengBangConfirm<CR>
    nnoremap <leader>s :SnipEdit<CR>
    nnoremap <leader>r :RainbowToggle<CR>

    nmap <leader>o <Plug>(openbrowser-search)
    vmap <leader>o <Plug>(openbrowser-search)

    nnoremap <silent> z<Space> za
    nnoremap <silent> Z<Space> zA
    nnoremap <silent> ZR zR
    nnoremap <silent> ZE eR
    vnoremap <silent> z<Space> zf

    noremap <silent> <BS><BS> mZ
    vnoremap <silent> <BS><BS> mZ
    onoremap <silent> <BS><BS> mZ
    noremap <silent> <BS><CR> `Z
    vnoremap <silent> <BS><CR> `Z
    onoremap <silent> <BS><CR> `Z
    noremap <silent> <S-BS><S-CR> 'Z
    vnoremap <silent> <S-BS><S-CR> 'Z
    onoremap <silent> <S-BS><S-CR> 'Z
    noremap <silent> m<CR> mZ
    vnoremap <silent> m<CR> mZ
    onoremap <silent> m<CR> mZ
    vnoremap <silent> <BS> `
    noremap <silent> <BS> `
    onoremap <silent> <BS> `

    vmap <C-right> <Plug>(expand_region_expand)
    vmap <C-left> <Plug>(expand_region_shrink)

    nnoremap <silent> <M-Insert> `[v`]
    vnoremap <silent> <M-Insert> <ESC>`[v`]
    nnoremap <silent> <S-M-Insert> `[=`]
    vnoremap <silent> <S-M-Insert> <ESC>`[=`]
    inoremap <silent> <S-M-Insert> <ESC>`[=`]i
    nnoremap <silent> <C-Insert> "*yy
    vnoremap <silent> <S-Insert> "-d"*P
    nnoremap <silent> <S-Insert> "*P
    cnoremap <C-S-INS> <c-r>=escape(@0, '.^$/\\')<cr>

    nnoremap <silent> <S-Del> dd
    inoremap <silent> <S-Del> <C-o>dd
    nnoremap <silent> <M-Del> viwhdl
    inoremap <silent> <M-Del> <ESC>viwhdli
    nnoremap <silent> <C-Del> viwd
    inoremap <silent> <C-Del> <ESC>viwdi

    nnoremap <silent> <leader><leader>. :Changedir<CR>
    nnoremap <silent> <leader><leader>: :Changedirup<CR>
    nnoremap <silent> <S-Space><S-Space>: :Changedirup<CR>

    nnoremap <silent> <C-u> U
    nnoremap <silent> U :redo<CR>

    nnoremap <silent> <M-Left> g;
    nnoremap <silent> <M-Right> g,

    nnoremap <silent> <C-M-Left> g-
    nnoremap <silent> <C-M-Right> g+
    inoremap <silent> <C-M-Left> <C-o>g-
    inoremap <silent> <C-M-Right> <C-o>g+
    vnoremap <silent> <C-M-Left> <ESC>g-gv
    vnoremap <silent> <C-M-Right> <ESC>g+gv

    inoremap <silent> <C-M-UP> <C-o>:call <SID>FindNextChange("k")<CR>
    inoremap <silent> <C-M-DOWN> <C-o>:call <SID>FindNextChange("j")<CR>
    vnoremap <silent> <C-M-UP> <ESC>:call <SID>FindNextChange("k")<CR>
    vnoremap <silent> <C-M-DOWN> <ESC>:call <SID>FindNextChange("j")<CR>
    nnoremap <silent> <C-M-UP> :call <SID>FindNextChange("k")<CR>
    nnoremap <silent> <C-M-DOWN> :call <SID>FindNextChange("j")<CR>

    inoremap <silent> <C-UP> <C-o>gk
    inoremap <silent> <C-DOWN> <C-o>gj
    noremap <silent> <C-UP> gk
    noremap <silent> <C-DOWN> gj
    noremap <M-home> g0
    noremap <M-end> g$
    inoremap <M-home> <c-o>g0
    inoremap <M-end> <c-o>g$
    nnoremap <C-y> ggVG
    nnoremap <k4> ggVG
    nnoremap <C-k4> ggVG
    inoremap <C-k4> <C-o>ggVG

    noremap <expr> <Home> (col('.') == matchend(getline('.'), '^\s*')+1 ? '0' : '^')
    noremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$' : 'g_')
    vnoremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$h' : 'g_')
    imap <Home> <C-o><Home>

    nnoremap <silent> <k1> m`"*yiw``
    vnoremap <silent> <k1> m`"*y``
    nnoremap <silent> <C-k1> m`"*yiw``
    vnoremap <silent> <C-k1> m`"*y``
    inoremap <silent> <C-k1> <C-o>m`<C-o>"*yiw<C-o>``
    nnoremap <silent> <k2> m`"*yaw``
    vnoremap <silent> <k2> m`"*y``
    nnoremap <silent> <C-k2> m`"*yaw``
    vnoremap <silent> <C-k2> m`"*y``
    inoremap <silent> <C-k2> <C-o>m`<C-o>"*yaw<C-o>``
    nnoremap <silent> <k0> m`viw"*pb``
    vnoremap <silent> <k0> m`"*p``
    nnoremap <silent> <C-k0> m`viw"*pb``
    vnoremap <silent> <C-k0> m`"*p``
    inoremap <silent> <C-k0> <C-o>m`<C-o>viw"*p<C-o>b<C-o>``


    nmap <leader>a :Tabularize /
    vmap <leader>a :Tabularize /
    nmap <S-Space>A= :Tabularize /=<CR>
    vmap <S-Space>A= :Tabularize /=<CR>
    nmap <S-Space>A: :Tabularize /:<CR>
    vmap <S-Space>A: :Tabularize /:<CR>

    nnoremap <silent> <M-+> @@
    vnoremap <silent> <M-q> :norm @@<CR>
    nnoremap <silent> <M-+> @@
    vnoremap <silent> <M-q> :norm @@<CR>
    nmap <silent> - "
    vmap <silent> - "
    nmap <silent> _ "
    vmap <silent> _ "
    nmap <silent> \\ viW:B s!/!\\!ge<CR>
    vmap <silent> \\ :B s!/!\\!ge<CR>
    nmap <silent> \\\ viW:B s!\\!\\\\!ge<CR>
    vmap <silent> \\\ :B s!\\!\\\\!ge<CR>
    nmap <silent> \/ viW:B s!\\!/!ge<CR>
    vmap <silent> \/ :B s!\\!/!ge<CR>
    nmap <silent> \\/ viW:B s!\\\\!/!ge<CR>
    vmap <silent> \\/ :B s!\\\\!/!ge<CR>
    nmap <silent> \// viW:B s!//!/!ge<CR>
    vmap <silent> \// :B s!//!/!ge<CR>
    nnoremap <silent> <C-tab> <c-w>w
    nnoremap <silent> <S-C-tab> <c-w>W
    nnoremap <silent> <S-tab> <C-o>
    nnoremap <silent> gf <C-W>gf
    vnoremap <silent> gf <C-W>gf
    nnoremap <silent> gb `[v`]
    nnoremap <silent> gp "*p
    nnoremap <silent> gP "*P
    vnoremap <silent> gy "*y
    vnoremap <silent> gY "*Y
    vnoremap <silent> < <gv
    vnoremap <silent> > >gv
    vnoremap ( <Esc>/\V\C
    nnoremap ( /\V\C
    nnoremap ) :Subvert/
    nnoremap & :%s/\V\C\<<C-R><C-W>\>/
    nnoremap <silent> <M-7> q/i
    nnoremap <silent> <M--> q/i
    nnoremap <silent> <M-.> q:i
    nnoremap <silent> <char-0x221e> q:i
    nnoremap <silent> <leader>gv `[v`]
    nnoremap <silent> <leader><del> m`:s/\s*$//g<CR>``:nohlsearch<CR>
    "nnoremap <silent> <C-bs> `z
    "nnoremap <silent> <C-return> mz
    nnoremap <silent> <S-return> `.
    inoremap <silent> <S-return> <C-O>`.
    nnoremap <silent> <S-bs> `.
    inoremap <silent> <S-bs> <C-O>`.

    vmap <RETURN> :B<space>
    nmap <silent> <kEnter> :NERDTreeFind<CR>

    nmap <silent> <C-w><CR> :exe 'resize '.line('$')<CR>
    nmap <silent> <C-w><C-CR> :exe 'resize '.line('$')<CR>
    "inoremap <silent> <C-w> <c-o>dw
    "inoremap <silent> <C-e> <c-o>de
    "inoremap <silent> <C-s> <c-o>db
    "inoremap <silent> <C-b> <c-o>dB

    nmap <silent> <leader><leader>p :call PasteJointCharacterwise(v:register, "P")<CR>

    nmap <leader>h :ReSyntax<CR>

    imap <C-e> <C-r>=
    nmap <C-e> i<C-r>=
    vmap <silent> <C-e> s<C-r>=<C-r>-<CR>


    nnoremap <silent> <expr> T TagfileCreate()
    nmap tt :ltag  <bar> lopen<left><left><left><left><left><left><left><left>
    nmap <silent> tn :tnext<CR>
    nmap <silent> tp :tNext<CR>
    nmap <silent> tr :trewind<CR>
    nmap <silent> tf :trewind<CR>
    nmap <silent> tl :tlast<CR>
    nmap <silent> tw :call ToggleLocationList()<CR>


    nnoremap <silent> <leader><leader><up> :cNext<CR>
    nnoremap <silent> <leader><leader><down> :cnext<CR>
    nnoremap <silent> <leader><leader><right> :copen<CR>
    nnoremap <silent> <leader><leader><left> :cclose<CR>

    nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>
    nmap <script> <silent> <leader>t :call ToggleLocationList()<CR>
    nmap <script> <silent> <leader><leader>+ :call ToggleLocationList()<CR>
    nmap <script> <silent> <leader><leader>- :call ToggleQuickfixList()<CR>
    nmap <script> <silent> <leader><leader># :call ToggleQuickfixList()<CR>

    nnoremap <silent> <leader><right> :ltag <C-R><C-W><CR>
    nnoremap <silent> <leader><left> <C-t>
    nnoremap <silent> <leader><up> :lNext<CR>
    nnoremap <silent> <leader><down> :lnext<CR>

    "** plugin mappings ******************************************
    nmap <leader>m <plug>MarkSet
    vmap <leader>m <plug>MarkSet
    nmap <leader>M <plug>MarkAllClear
    vmap <leader>M <plug>MarkAllClear
    nmap <s-space>M <plug>MarkAllClear
    vmap <s-space>M <plug>MarkAllClear

    nmap <silent> <expr> t1 SetIndent(1)
    nmap <silent> <expr> t2 SetIndent(2)
    nmap <silent> <expr> t3 SetIndent(3)
    nmap <silent> <expr> t4 SetIndent(4)
    nmap <silent> <expr> t5 SetIndent(5)
    nmap <silent> <expr> t6 SetIndent(6)
    nmap <silent> <expr> t7 SetIndent(7)
    nmap <silent> <expr> t8 SetIndent(8)
    nmap <silent> <expr> t9 SetIndent(9)
    nmap <silent> t0 :retab<CR>
    vmap <silent> <expr> t1 SetIndent(1)
    vmap <silent> <expr> t2 SetIndent(2)
    vmap <silent> <expr> t3 SetIndent(3)
    vmap <silent> <expr> t4 SetIndent(4)
    vmap <silent> <expr> t5 SetIndent(5)
    vmap <silent> <expr> t6 SetIndent(6)
    vmap <silent> <expr> t7 SetIndent(7)
    vmap <silent> <expr> t8 SetIndent(8)
    vmap <silent> <expr> t9 SetIndent(9)
    vmap <silent> t0 :retab<CR>

    nmap <silent> <leader>ddl :DDL<CR>
    nmap <silent> <leader>dbl :DBL<CR>
    nmap <silent> <leader>dbe :DBE<CR>
    nmap <silent> <leader>dbc :CBL<CR>

    nmap m<left> <Plug>Vm_toggle_sign
    nmap m<right> <Plug>Vm_toggle_sign
    nmap m<up> <Plug>Vm_goto_prev_sign
    nmap m<down> <Plug>Vm_goto_next_sign

    nnoremap <C-f> :MultipleCursorsFind<space>

    cmap <C-space> <Plug>CmdlineCompletionForward
    cmap <C-tab> <Plug>CmdlineCompletionForward
    cmap <C-S-tab> <Plug>CmdlineCompletionBackward
    cmap <C-S-space> <Plug>CmdlineCompletionBackward
    "cmap <C-RETURN> <C-R><C-W>
    cmap <S-RETURN> <C-R><C-W>
    cmap <S-Space> %20

    nnoremap <silent> <leader>ff :Banner<CR>
    ":OpenBrowser http://www.patorjk.com/software/taag/#f=Big&t=
    nnoremap <leader>fl :for i in range(1,10) <bar> put =printf('%d', i) <bar> endfor<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>

    nnoremap <C-return> :call ToggleCurrentWordHL()<CR>
    " Only in visual mode...
    vmap  q :call Uniq()<CR>
    vmap  Q :call Uniq('ignore whitespace')<CR>

    nmap <silent> <M-S-Up> :<C-u>call MoveUp()<CR>
    nmap <silent> <M-S-Down> :<C-u>call MoveDown()<CR>
    imap <silent> <M-S-Up> <C-o>:<C-u>call MoveUp()<CR>
    imap <silent> <M-S-Down> <C-o>:<C-u>call MoveDown()<CR>
    vmap <silent> <M-S-Up> :<C-u>call MoveVisualUp()<CR>
    vmap <silent> <M-S-Down> :<C-u>call MoveVisualDown()<CR>
endfunction

call DefineMapping()

"======[ Order-preserving uniqueness ]=========================

" Normalize the whitespace in a string...
function! TrimWS (str)
    " Remove whitespace fore and aft...
    let trimmed = substitute(a:str, '^\s\+\|\s\+$', '', 'g')

    " Then condense internal whitespaces...
    return substitute(trimmed, '\s\+', ' ', 'g')
endfunction

" Reduce a range of lines to only the unique ones, preserving order...
function! Uniq (...) range
    " Ignore whitespace differences, if asked to...
    let ignore_ws_diffs = len(a:000)

    " Nothing unique seen yet...
    let seen = {}
    let uniq_lines = []

    " Walk through the lines, remembering only the hitherto unseen ones...
    for line in getline(a:firstline, a:lastline)
        let normalized_line = '>' . (ignore_ws_diffs ? TrimWS(line) : line)
        if !get(seen,normalized_line)
            call add(uniq_lines, line)
            let seen[normalized_line] = 1
        endif
    endfor

    " Replace the range of original lines with just the unique lines...
    exec a:firstline . ',' . a:lastline . 'delete'
    call append(a:firstline-1, uniq_lines)
endfunction

"***********************************************************

function! GetCurrentWord()
    let c   = col ('.')
    let l   = line('.')
    let ll  = getline(l)
    let ll1 = strpart(ll,0,c)
    let ll1 = matchstr(ll1,'\w*$')
    if strlen(ll1) == 0
        return ll1
    else
        let ll2 = strpart(ll,c,strlen(ll)-c)
        let ll2 = strpart(ll2,0,match(ll2,'$\|\W'))
        return ll1.ll2
    endif
endfunction


function! PasteJointCharacterwise(regname, pastecmd)
    if &modifiable
        let reg_type = getregtype(a:regname)
        call setreg(a:regname, '', "ac")
        exe 'normal "'.a:regname . a:pastecmd
        call setreg(a:regname, '', "a".reg_type)
        exe 'normal `[v`]J'
    endif
endfunction

function! MoveUp()
    call MoveUpWithArgs(".", "")
endfunction

function! MoveDown()
    call MoveDownWithArgs(".", "")
endfunction

function! MoveVisualUp()
    call MoveUpWithArgs("'<", "'<,'>")
    normal gv
    execute 'normal! 1|'
endfunction

function! MoveVisualDown()
    call MoveDownWithArgs("'>", "'<,'>")
    normal gv
    execute 'normal! 1|'
endfunction

function! MoveUpWithArgs(line, range)
    call MoveUpDown(a:range . 'move ' . (line(a:line) - v:count1 - 1 < 0 ? '0' : a:line . ' -' . (v:count1 + 1)))
endfunction

function! MoveDownWithArgs(line, range)
    call MoveUpDown(a:range . 'move ' . (line(a:line) + v:count1 > line('$') ? '$' : a:line . ' +' . v:count1))
endfunction

function! MoveUpDown(arg)
    execute 'silent! ' . a:arg
endfunction


" ******* Commands **************************************************
com! -complete=command K :exe(':s/\(\V'.getline(".")[col(".")-1].'\m\)\s*/\1\r/')<bar>exe('nohlsearch')
com! -bar -bang W :WriteBackup<bang>
com! -nargs=+ -complete=command ToTab call ToTab(<q-args>)
com! -nargs=+ -complete=command ToWin call ToWin(<q-args>)
com! -range -complete=command Count :<line1>,<line2>s///gin
com! -complete=command DiffOrig new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
com! -complete=command DiffOrigOff wincmd t | diffoff | wincmd b | diffoff | bw
com! -complete=command DiffAll windo set diff scrollbind scrollopt+=hor nowrap | wincmd t
com! -complete=command DiffAllFolded windo diffthis
com! -complete=command DiffNone diffoff!
com! -complete=command WinSplit2 :vnew | wincmd t
com! -range=% DDL :<line1>,<line2>g/^\(.*\)\n\_.*\%(^\1$\)/d<bar>exe('nohlsearch')<bar>exe("norm `'")
com! -range=% DBL :<line1>,<line2>g/^\s*$/d<bar>exe('nohlsearch')<bar>exe("norm `'")
com! -range=% DBE :<line1>,<line2>s/\s\+$//g<bar>exe('nohlsearch')<bar>exe("norm `'")
com! -range=% CBL :<line1>,<line2>s/^\n\+/\r<bar>exe('nohlsearch')<bar>exe("norm `'")
com! -complete=command ReSyntax :if exists("syntax_on") | syntax off | else | call s:SetColors() | endif | redraw
com! -complete=command Changedir :cd %:p:h|pwd
com! -complete=command ChangedirToTagsfile :exe('cd '.fnamemodify(tagfiles()[0],':p:h'))|pwd
com! -complete=command Changedirup :cd ..|pwd
com! -complete=command Changedirlast :cd -|pwd
com! -complete=command Cleanup :nohlsearch | execute "SyntasticReset" | echo
com! -complete=command NewScratchWindow :new |silent! 0f!|set buftype=nofile|set bufhidden=hide|setlocal noswapfile
com! -complete=command DeleteNoNameBuffers call DelNonameBuf()
com! -complete=command Clipfile :if has('win32') | let @*=substitute(expand("%:p"), "/", "\\", "g") | else | let @*=expand("%:p") | endif
com! -complete=command Helpcompile :helptags $VIMRUNTIME/doc
com! -complete=command FindControlChars /[^[:blank:][:space:][:print:]]
com! -complete=command MacroSave call s:SaveMacro_func()
com! -complete=command MS call s:SaveMacro_func()
com! -complete=command MacroLoad call s:LoadMacro_func()
com! -complete=command ML call s:LoadMacro_func()
com! -complete=command MacroDelete call s:DeleteMacro_func()
com! -complete=command MD call s:DeleteMacro_func()
com! -nargs=0 Scratch call s:ScratchBufferOpen(0)
com! -nargs=0 SplitScratch call s:ScratchBufferOpen(1)
com! -nargs=0 ScratchToggle call s:ScratchToggle()
com! -nargs=0 Fullscreen :winpos 0 0|set lines=999|set columns=999
com! -complete=command SearchList :exec 'lvim /\V\<'. escape(GetCurrentWord(), '\/') .'\>/ %'|lopen
com! -complete=command SearchListLast :exec 'lvim // %'|lopen
com! -range -complete=command SearchListVisual :exe("norm <C-u>") | let save_reg = @z | exec 'norm gv"zy' | exec 'lvim /\V'.@z.'/ %' | let @z = save_reg | lopen
com! -range -complete=command SearchListGrep :exe("norm <C-u>") | let save_reg = @z | exec 'norm gv"zy' | exec 'LAg! "'.@z.'"' | let @z = save_reg | lopen
com! -range -nargs=+ -com=command    B  <line1>,<line2>call VisBlockCmd(<q-args>)
com! -range -nargs=* -com=expression S  <line1>,<line2>call VisBlockSearch(<q-args>)
com! -complete=command SnipEdit :exec 'sp ' . $LOCALHOME . '/.vim/bundle/schwarze-vim-snippets/snippets/' . (&ft==''?'_':&ft) . '.snippets'
com! -complete=command Update call s:Update()
com! -complete=command LinkVimRc call s:LinkVimRc()
com! -complete=command Banner echo 'Fetching banner...' | exec 'silent sp http://ascii-text.com/online-ascii-banner-text-generator/big/' . GetCurrentWord() | exec '%s/^\_.*<pre>\(\_.\{-}\)<\/pre>\_.*$/\1/' | nohlsearch | let save_reg = @z | exec 'norm gg"zyG' | close | exec 'norm diw"zP' | let @z = save_reg
com! -bang -nargs=* -range LineBreakAt <line1>,<line2>call LineBreakAt('<bang>', <f-args>)
com! -range -complete=command VisualLineBreakAt :exe("norm <C-u>") | let save_reg = @z | exec 'norm gv"zy' | exec 'LineBreakAt '.@z | let @z = save_reg

function! SetIndent(idnt)
    exe "set tabstop=".a:idnt
    exe "set shiftwidth=".a:idnt
endfunction

function! TagfileCreate()
    echo "Creating tags file in " . getcwd() . "..."
    execute "silent call system('ctags -R')"
    echo "Tags file created"
endfunction

function! DelNonameBuf()
    let l:tbnr = tabpagenr()
    tabdo windo if (empty(bufname("%"))) | bw! | endif
exe "tabnext" . l:tbnr
endfunction


function! ToTab(cmd)
    set nonumber
    redir => message
    silent! execute a:cmd
    redir END
    set number
    tabnew
    silent! put!=message
    0delete
    set nomodified
    $delete
    0goto
    nohls
endfunction

function! ToWin(cmd)
    set nonumber
    redir => message
    silent! execute a:cmd
    set number
    redir END
    new
    silent! put!=message
    0delete
    set nomodified
    $delete
    0goto
    nohls
endfunction

"************************************************************

let g:move_stay_in_column   = 1   " Will not stop on shorter lines than the one we started on
let g:move_skip_empty_lines = 1   " Never stop on an empty line (if also unifying, never stop on whitespace)
let g:move_unify_whitespace = 1   " Tab, space and empty-line are all considered the same.
let g:move_once_at_start    = 1   " Don't stop on the very next line just because it has a different char from the current!

function! s:FindNextChange(moveKey)
    let startCol = wincol()
    let unwantedChar = s:GetCharUnderCursor()
    if g:move_once_at_start
        exec "normal "a:moveKey
    endif
    let nextCharUnderCursor = s:GetCharUnderCursor()
    if nextCharUnderCursor != unwantedChar
        let unwantedChar = nextCharUnderCursor
    endif
    let lastRow = line(".")
    while 1
        exec "normal ".a:moveKey
        let newCol = wincol()
        let newRow = line(".")
        let newCharUnderCursor = s:GetCharUnderCursor()
        if newRow == lastRow
            " Failed to move; better stop trying!  (probably reached a boundary)
            break
        endif
        if g:move_skip_empty_lines && newCharUnderCursor == ""
            " Do nothing, continue to next line
        elseif g:move_stay_in_column && newCol != startCol
            " Likewise
        else
            if newCharUnderCursor != unwantedChar
                break
            endif
        endif
        let lastRow = newRow
    endwhile
endfunction

function! s:GetCharUnderCursor()
    let c = strpart(getline("."), col(".") - 1, 1)
    if g:move_unify_whitespace && (c==" " || c=="\t")
        let c = ""
    endif
    return c
endfunction


"************************************************************

function! ToggleDiff()
    if &diff
        windo diffoff!
        wincmd t
        echo "DiffMode off"
    else
        windo set diff scrollbind scrollopt+=hor nowrap
        wincmd t
        echo "DiffMode on"
    endif
endfunction


function! ToggleDiffOrig()
    if &diff
        wincmd t
        diffoff
        wincmd b
        diffoff
        bw
    else
        new
        set bt=nofile
        r #
        0d_
        diffthis
        wincmd p
        diffthis
    endif
endfunction


function! ToggleVirtualEdit()
    if &virtualedit == ""
        set virtualedit=all
        echo "virtualedit on"
    else
        set virtualedit=""
        echo "virtualedit off"
    endif
endfunction


function! ToggleWrap()
    if &wrap
        setlocal nolinebreak
        setlocal nowrap
        echo "no wrap"
    else
        setlocal nolinebreak
        setlocal wrap
        echo "wrap"
    endif
endfunction


function! ToggleAutoread()
    if &ar
        setlocal noar
        echo "no autoread"
    else
        setlocal ar
        echo "autoread on"
    endif
endfunction

function! ToggleCurrentWordHL()
    if s:cwhl
        2match none
        let s:cwhl=0
    else
        exec '2match User2 /\V\<'. escape(GetCurrentWord(), '\/') .'\>/'
        let s:cwhl=1
    endif
endfunction


function! MoveCurrentTab(value)
    if a:value == 0
        return
    endif
    let move = a:value - 1
    let move_to = tabpagenr() + move
    if move_to < 0
        let move_to = 0
    endif
    exe 'tabmove '.move_to
endfunction

"** XML *************************************************************************
" generates whitespace
function! Whitespace(indent)
    let tabstop = 4

    return repeat(' ', a:indent * tabstop)
endfunction

" Trim whitespace from beginning and end of val. optionally include other
" characters to trim from the beginning and end with 2nd and 3rd params
function! Trim(val, ...)
    let startchars = ''
    let endchars = ''
    if(len(a:000) > 0)
        let startchars = a:000[0]
    endif
    if(len(a:000) > 1)
        let endchars = a:000[1]
    endif

    let start = "^[ \t" . startchars . "]*"
    let end = "[ \t" . endchars . "]*$"

    let val = substitute(a:val, start, '', '')
    let val = substitute(val, end, '', '')

    return val
endfunction

function! XmlPretty(...)
    let buf = ''

    if(len(a:000) > 0 && type(a:000[0]) == type(''))
        let buf = a:000[0]
    else
        let bufnum = bufnr("%")

        let firstline = 1
        let lastline = len(getbufline(bufnum, 1, "$"))
        if len(a:000) > 0 && type(a:000[0]) == type(0)
            let firstline = a:000[0]
        endif
        if len(a:000) > 1 && type(a:000[1]) == type(0)
            let lastline = a:000[1]
        endif

        let linearray = getbufline(bufnum, firstline, lastline)

        " Get the buffer into one string
        for index in range(lastline - firstline + 1)
            let o = getline(index +  firstline)
            let buf = buf . o
        endfor
    endif

    " Generate indexes of all of the xml tags in the buffer
    let regex = "<?\\?\\(\\/\\)\\?\\([a-zA-Z0-9-._:]*\\)\\(\\( [a-zA-Z_:][a-zA-Z0-9.-_:]*=\\(\\('[^']\\+'\\)\\|\\(\"[^\"]\\+\"\\)\\)\\)*\\)\\? *\\(\\/\\)\\??\\?>"
    let match = {'start': 0, 'end': 0, 'len': 0, 'endnode': 0, 'selfterm': 0}
    let matches = [match]
    while match['start'] > -1
        call add(matches, match)

        let start = match(buf, regex, matches[-1]['end'])
        if start > -1
            let rawmatch = matchlist(buf, regex, matches[-1]['end'])

            let nodename = rawmatch[2]
            let end = start + len(rawmatch[0])
            let endnode = len(rawmatch[1])
            let selfterm = len(rawmatch[8])
        endif

        let match = {'nodename': nodename, 'start': start, 'end': end, 'len': end - start, 'endnode': endnode, 'selfterm': selfterm}
    endwhile

    " remove first entry - it was a dummy
    call remove(matches, 0, 1)

    " Generate array of new lines
    let lines = []
    let indent = 1

    " Copy text before the first tag
    if matches[0]['start'] > firstline
        let text = strpart(buf, firstline, matches[0]['start'])
        call add(lines, text)
    endif

    for x in range(len(matches))
        let match = matches[x]
        let part = strpart(buf, match['start'], match['len'])
        if x != 0
            " Copy text between the last tag and this tag
            if (matches[x]['start'] - matches[x-1]['end']) > 1
                let text = strpart(buf, matches[x-1]['end'], matches[x]['start'] - matches[x-1]['end'])

                " trim
                let text = substitute(text, "^[ \t]*", '', '')
                let text = substitute(text, "[ \t]*$", '', '')

                if len(text)
                    " Treat contents of <style> tag as css and invoke css
                    " pretty-print
                    if(tolower(match['nodename']) == 'style' && exists("*CssPretty"))
                        let csslines = CssPretty(text)
                        for x in range(len(csslines))
                            call add(lines, Whitespace(indent) . csslines[x])
                        endfor
                    else
                        call add(lines, Whitespace(indent) . text)
                    endif
                endif
            endif
        endif

        if match['selfterm']
            call add(lines, Whitespace(indent) . part)
        elseif match['endnode']
            let indent = indent - 1
            call add(lines, Whitespace(indent) . part)
        else
            call add(lines, Whitespace(indent) . part)
            let indent = indent + 1
        endif

    endfor

    " just return the lines if requested
    if len(a:000) > 2 || (len(a:000) > 0 && type(a:000[0]) == type([])) || (len(a:000) > 1 && type(a:000[1]) == type([]))
        return lines
    " or if this function was invoked with a string as its first argument
    elseif len(a:000) > 0 && type(a:000[0]) == type('')
        return lines
    endif

    " Otherwise, rewrite the buffer by first removing all lines from the buffer in the specified range, inclusive
    for x in range(lastline - firstline + 1)
        call setline(x+firstline, '')
    endfor
    call cursor(lastline, 1)
    for x in range(lastline - firstline + 1)
        exe 'normal ' . "a\b\e"
    endfor

    " and appending into the buffer
    let line = firstline - 1
    for x in range(len(lines))
        call append(line, lines[x])
        let line = line + 1
    endfor

    return

    " Remove any further lines in the buffer
    if(len(linearray) >= line)
        for x in range(len(linearray) - line + 1)
            call setline(x+line, '')
        endfor
        call cursor(len(linearray), 1)
        for x in range(len(linearray) - line + 1)
            exe 'normal ' . "a\b\e"
        endfor
    endif
endfunction


" *** Persistent macros ********************************************************

function! s:SaveMacro_func()
    if !isdirectory($HOME."/.vim/macros")
        call mkdir($HOME."/.vim/macros")
    endif
    silent cd! $HOME/.vim/macros
    let l:macroslot=input('Save macro of slot: ', 'q')
    if (l:macroslot == '')
        silent cd! -
        return
    endif
    let l:macroname=input('Name for macro @'.l:macroslot.': ', '', 'file')
    if (l:macroname == '')
        silent cd! -
        return
    endif
    let l:tempmac = [getreg(l:macroslot)]
    call writefile(tempmac, l:macroname, 'b')
    silent cd! -
endfunction

function! s:LoadMacro_func()
    silent cd! $HOME/.vim/macros
    let l:macroslot=input('Load macro to slot: ', 'q')
    if (l:macroslot == '')
        silent cd! -
        return
    endif
    let l:macroname=input('Name of macro @'.l:macroslot.': ', '', 'file')
    let l:isMacro = filereadable(l:macroname)
    if (l:isMacro == 0)
        silent cd! -
        return
    endif
    let l:macro_content = readfile(l:macroname,'b')
    call setreg(l:macroslot,l:macro_content[0])
    silent cd! -
endfunction


function! s:DeleteMacro_func()
    silent cd! $HOME/.vim/macros
    let l:macroname=input('Delete macro named: ', '', 'file')
    let l:isMacro = filereadable(l:macroname)
    if (l:isMacro == 0)
        silent cd! -
        return
    endif
    call delete(l:macroname)
    silent cd! -
endfunction

" *** Scratch ******************************************************************

let ScratchBufferName = "__Scratch__"


function! s:ScratchBufferOpen(new_win)
    let split_win = a:new_win

    if !split_win && &modified
        let split_win = 1
    endif

    let scr_bufnum = bufnr(g:ScratchBufferName)
    if scr_bufnum == -1
        if split_win
            exe g:scratch_height . "new " . g:ScratchBufferName
        else
            exe "edit " . g:ScratchBufferName
        endif
    else
        let scr_winnum = bufwinnr(scr_bufnum)
        if scr_winnum != -1
            if winnr() != scr_winnum
                exe scr_winnum . "wincmd w"
            endif
        else
            if split_win
                exe g:scratch_height . "split +buffer" . scr_bufnum
            else
                exe "buffer " . scr_bufnum
            endif
        endif
    endif
endfunction


function! s:ScratchMarkBuffer()
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    setlocal buflisted
endfunction


function! s:ScratchToggle()
    if expand('%') == g:ScratchBufferName
        quit
    else
        SplitScratch
    endif
endfunction

" StarRange

let g:StarRange__reg = ''

function! StarRange__keepReg()
    let g:StarRange__reg = @*
endfunction

function! StarRange__restoreReg()
    let @* = g:StarRange__reg
endfunction

function! StarRange__substituteSpecialChars(str)
    let result = escape(a:str, '\')
    let result = substitute(result, '/', '\\/', 'g')
    let result = substitute(result, '\r\n\|\r\|\n', '\\n', 'g')
    return result
endfunction


" VIS
if exists("g:vis_WantSlashSlash") && g:vis_WantSlashSlash
    vn // <esc>/<c-r>=VisBlockSearch()<cr>
endif
vn ?? <esc>?<c-r>=VisBlockSearch()<cr>


fun! VisBlockCmd(cmd) range
    sil! keepj norm `<
    let curposn = SaveWinPosn(0)
    let vmode   = visualmode()

    call s:SaveUserSettings()

    if vmode == 'V'
        exe "keepj '<,'>".a:cmd

    else
        let begcol   = s:VirtcolM1("<")
        let endcol   = s:VirtcolM1(">")
        if vmode != 'v'
            if begcol > endcol
                let begcol  = s:VirtcolM1(">")
                let endcol  = s:VirtcolM1("<")
            endif
        endif

        let begline  = a:firstline
        let endline  = a:lastline
        if begline > endline
            let begline = a:lastline
            let endline = a:firstline
        endif
        sil! keepj norm! gv"ad

        keepj $
        keepj pu_
        let lastline= line("$")
        sil! keepj norm! "ap
        let curline = line(".")
        ka
        keepj $
        exe "keepj ". curline.',$'.a:cmd

        exe "keepj ".lastline
        exe "keepj norm! 0".vmode."G$\"ad"

        exe "sil! keepj ".lastline.',$d'

        exe "keepj ".begline
        if begcol > 1
            exe 'sil! keepj norm! '.begcol."\<bar>\"ap"
        elseif begcol == 1
            norm! 0"ap
        else
            norm! 0"aP
        endif

        let begcol= begcol+1
        let endcol= endcol+1
        exe "sil keepj ".begline
        exe 'sil keepj norm! '.begcol."\<bar>".vmode
        exe "sil keepj ".endline
        exe 'sil keepj norm! '.endcol."\<bar>\<esc>"
        exe "sil keepj ".begline
        exe 'sil keepj norm! '.begcol."\<bar>"
    endif

    call s:RestoreUserSettings()
    call RestoreWinPosn(curposn)

endfun

fun! VisBlockSearch(...) range
    let keepic= &ic
    set noic

    if a:0 >= 1 && strlen(a:1) > 0
        let pattern   = a:1
        let s:pattern = pattern
    elseif exists("s:pattern")
        let pattern= s:pattern
    else
        let pattern   = @/
        let s:pattern = pattern
    endif
    let vmode= visualmode()

    let firstline  = line("'<")
    let lastline   = line("'>")
    let firstcolm1 = s:VirtcolM1("<")
    let lastcolm1  = s:VirtcolM1(">")

    if(firstline > lastline)
        let firstline = line("'>")
        let lastline  = line("'<")
        if a:0 >= 1
            keepj norm! `>
        endif
    else
        if a:0 >= 1
            keepj norm! `<
        endif
    endif

    if vmode != 'v'
        if firstcolm1 > lastcolm1
            let tmp        = firstcolm1
            let firstcolm1 = lastcolm1
            let lastcolm1  = tmp
        endif
    endif

    let firstlinem1 = firstline  - 1
    let lastlinep1  = lastline   + 1
    let firstcol    = firstcolm1 + 1
    let lastcol     = lastcolm1  + 1
    let lastcolp1   = lastcol    + 1

    if vmode == 'V'
        let srch= '\%(\%>'.firstlinem1.'l\%<'.lastlinep1.'l\)\&'
    elseif vmode == 'v'
        if firstline == lastline || firstline == lastlinep1
            let srch= '\%(\%'.firstline.'l\%>'.firstcolm1.'v\%<'.lastcolp1.'v\)\&'
        else
            let srch= '\%(\%(\%'.firstline.'l\%>'.firstcolm1.'v\)\|\%(\%'.lastline.'l\%<'.lastcolp1.'v\)\|\%(\%>'.firstline.'l\%<'.lastline.'l\)\)\&'
        endif
    else
        let srch= '\%(\%>'.firstlinem1.'l\%>'.firstcolm1.'v\%<'.lastlinep1.'l\%<'.lastcolp1.'v\)\&'
    endif

    if a:0 <= 1
        call search(srch.pattern)
        let @/= srch.pattern

    elseif a:0 == 2
        call search(srch.pattern,a:2)
        let @/= srch.pattern
    endif

    let &ic= keepic

    return srch
endfun

fun! s:VirtcolM1(mark)

    if virtcol("'".a:mark) <= 1
        return 0
    endif

    if &ve == "block"
        set ve=all
    endif

    exe "keepj norm! `".a:mark."h"

    let vekeep = &ve
    let vc     = virtcol(".")
    let &ve    = vekeep

    return vc
endfun

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

fun! s:SaveUserSettings()
    let s:keep_lz    = &lz
    let s:keep_fen   = &fen
    let s:keep_fo    = &fo
    let s:keep_ic    = &ic
    let s:keep_magic = &magic
    let s:keep_sol   = &sol
    let s:keep_ve    = &ve
    let s:keep_ww    = &ww
    let s:keep_cedit = &cedit
    set lz magic nofen noic nosol ww= fo=nroql2 cedit&
    let raggedright= 0
    norm! `>
    let rrcol = col(".")
    while line(".") >= line("'<")
        if col(".") != rrcol
            let raggedright = 1
            break
        endif
        if line(".") == 1
            break
        endif
        norm! k
    endwhile
    if raggedright
        set ve=all
    else
        set ve=
    endif

    let s:rega= @a

endfun

fun! s:RestoreUserSettings()
    let @a     = s:rega
    let &cedit = s:keep_cedit
    let &fen   = s:keep_fen
    let &fo    = s:keep_fo
    let &ic    = s:keep_ic
    let &lz    = s:keep_lz
    let &sol   = s:keep_sol
    let &ve    = s:keep_ve
    let &ww    = s:keep_ww
endfun

function! LineBreakAt(bang, ...) range
  let save_search = @/
  if empty(a:bang)
    let before = ''
    let after = '\ze.'
    let repl = '&\r'
  else
    let before = '.\zs'
    let after = ''
    let repl = '\r&'
  endif
  let pat_list = map(deepcopy(a:000), "escape(v:val, '/\\.*$^~[')")
  let find = empty(pat_list) ? " " : join(pat_list, '\|')
  let find = before . '\%(' . find . '\)' . after
  " Example: 10,20s/\%(arg1\|arg2\|arg3\)\ze./&\r/ge
  execute a:firstline . ',' . a:lastline . 's/'. find . '/' . repl . '/ge'
  let @/ = save_search
endfunction

function! Multiple_cursors_before()
    if exists('*SwoopFreezeContext') != 0
        call SwoopFreezeContext()
    endif
endfunction

function! Multiple_cursors_after()
    if exists('*SwoopUnFreezeContext') != 0
        call SwoopUnFreezeContext()
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:Update()
    execute "cd " . $LOCALHOME . "/vim"
    execute "silent call system('git checkout -- .')"
    execute "silent call system('git pull')"
    call s:LinkVimRc()
    PluginClean!
    PluginInstall
endfunction

function! s:LinkVimRc()
    if has('gui_macvim')
        try
            execute "silent call delete('".$LOCALHOME."/.vimrc')"
        catch
        endtry
        execute "silent call system('ln -s ".$LOCALHOME."/vim/.vimrc ".$LOCALHOME."/.vimrc')"
    elseif has('win32') || has('win64')
        let $WINLOCALHOME = substitute($LOCALHOME, "/", "\\", "g")
        try
            execute "silent call delete('".$WINLOCALHOME."/.vimrc')"
        catch
        endtry
        execute "silent call system('mklink /H ".$WINLOCALHOME."\\.vimrc ".$WINLOCALHOME."\\vim\\.vimrc')"
    endif
endfunction

function! s:SetColors()
    syntax enable
    syntax sync fromstart
    syntax on

    set background=dark
    try
        colorscheme abra
    catch
    endtry
    hi clear NonText
    hi NonText guifg=bg
    hi clear CursorLineNr
    hi link CursorLineNr CursorLine
    hi clear IncSearch
    hi link IncSearch StatusLine
    hi clear MatchParen
    hi link MatchParen CursorLineNr
    hi clear SignColor
    hi link SignColor CursorLine
    hi clear SignColumn
    hi link SignColumn CursorLine
    hi clear CursorColumn
    hi link CursorColumn CursorLine
    hi clear Folded
    hi link Folded CursorLine
    hi clear FoldColumn
    hi link FoldColumn CursorLine
    hi clear Visual
    hi link Visual StatusLine
    hi clear User1
    hi link User1 CursorLine
    hi clear User2
    hi User2 guifg=Red gui=NONE

    hi def MarkWord1  ctermbg=Cyan     ctermfg=Black  guibg=#8CCBEA    guifg=Black
    hi def MarkWord2  ctermbg=Green    ctermfg=Black  guibg=#A4E57E    guifg=Black
    hi def MarkWord3  ctermbg=Yellow   ctermfg=Black  guibg=#FFDB72    guifg=Black
    hi def MarkWord4  ctermbg=Red      ctermfg=Black  guibg=#FF7272    guifg=Black
    hi def MarkWord5  ctermbg=Magenta  ctermfg=Black  guibg=#FFB3FF    guifg=Black
    hi def MarkWord6  ctermbg=Blue     ctermfg=Black  guibg=#9999FF    guifg=Black
endfunction

function! s:FinalizeStartup()
    if !g:IsVundleInstalled
        echo "Installing package manager via GIT..."
        hi clear NonText
        hi NonText guifg=bg
        let target=$LOCALHOME."/.vim/bundle/Vundle.vim"
        if has('win32') || has('win64')
            let target = substitute(target, "/", "\\", "g")
        endif
        execute "silent call system('git clone https://github.com/gmarik/Vundle.vim.git ".target."')"
        call DefinePlugins()
        echo "Installing plugins via Vundle..."
        :PluginInstall
        close
    else
        call DefinePlugins()
    endif

    filetype plugin indent on
    source $VIMRUNTIME/menu.vim

    call s:SetColors()

    let &stl="%1* %{ctrlspace#statusline_tab_segment()} %0* %t %=%{fugitive#statusline()} %8b 0x%-8B#%n%(|%Y%)|%{&encoding}%{\"|\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}|%{&fileformat}%(|%R%)%(|%M%)%{(&ar?\"\":\"*\")} %10o %7.(%c%V%) %-20.(%10l/%L%) %1* %4P "

    if has("gui_running")
        :Fullscreen
    else
        colorscheme delek
    endif
endfunction


if has("autocmd")
    augroup vimrcEx
        au!
        "au CursorHold * exec '2match CursorLineNr /\V\<'. escape(GetCurrentWord(), '\/') .'\>/'
        au GUIEnter * set vb t_vb=
        au CmdwinEnter * nnoremap <silent> <Esc> :q<CR>|redraw
        au CmdwinLeave * nunmap <Esc>
        au BufEnter * set cpoptions+=y fo=qr cino=
        au BufEnter * set cindent indentexpr=
        au BufNewFile __Scratch__ call s:ScratchMarkBuffer()
        au BufWritePost .vimrc source %
        au BufWritePost .snippets call ReloadSnippets(&ft)
        au VIMEnter * call s:FinalizeStartup()
    augroup END
endif

filetype plugin indent on
