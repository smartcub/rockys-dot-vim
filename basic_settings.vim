""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""" Basic Settings """"""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Rocky Liu
"
" Version:
"       0.1 - Jan/05/2018
" Sections:
"       -> Common Settings
"       -> VIM user interfaces
"       -> Visuals Settings
"       -> Text, tab and indent related
"       -> Visual mode related
"       -> Key mappings
"       -> Status Line
"       -> Spell checking
"       -> Misc
"       -> Build in functions

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Common Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {
    set nocompatible                	" We want the latest Vim settings/options.
    syntax enable
    
    
    let mapleader = ','			" The default leader is \, but a period(comma) is much better.
    let g:mapleader = ','                   " With map leader it's possible to do extra key combinations.
    
    set number			    	" Let's activate line numbers.
    set linespace=4				" GUI vim specific line-height.
    " Linebreak on 100 characters
    set lbr
    set tw=100                      	" Set the maximum width of text that can be inserted.
    set tabstop=8                      	" Set tabstop to a reasonable value
    set expandtab                           " Set using spaces instead of tabs
    set softtabstop=4                       " Set the width we apply when hitting the tab key in insert mode
    set shiftwidth=4 			" Set the width of indent in normal mode
    "set lines=25 columns=120
    " set autowriteall 			" Automatically write the file when switching buffers.
    set history=1000                        " Set how many lines of history VIM has to remember
    set so=7                                " Set 7 lines to the cursor - when moving vertically using j/k
    set showcmd                             " Show typed command in status bar
    set nowrap                              " Dont wrap lines
    set mouse=a                             " Use mouse in all modes
    
    filetype plugin on                      " Always ensure enable filetype plugins
    filetype indent on                      " Same as above
    
    "--------------------------Searching---------------------------"
    set hlsearch
    set incsearch
    
    "----------------------Split Management------------------------"
    set splitbelow
    set splitright
" }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encodings
" {
    if g:select_supported_lang == 1
        " Avoid garbled charaters in Chinese language windows OS
        let $LANG='zh_CN.UTF-8'
        set langmenu=zh_CN.UTF-8
    else
        let $LANG='en_US'
        set langmenu=en_US
    endif
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    " Config encoding format for file opening
    set fileencodings=ucs-bom,utf-8,gb2312,gb18030,gbk,cp936,big5,latin1,euc-jp,euc-kr
    set fileencoding=utf-8

    " Avoid garbled output of the console
    set termencoding=utf-8

    " Tips in Chinese language
    language messages zh_CN.utf-8

    " Help in Chinese languages
    set helplang=cn

    " Use twice the width of ASCII characters
    set ambiwidth=double
" }

" Turn on the Wild menu
set wildmenu

" Avoid files when compiling
" {
    " NOTE: If you do debugging with compiled files, plz close it
    " Ignore compiled files
    if 1
        set wildignore=*.o,*~,*.pyc,*.so,*.a,*.obj,*.swp,*.class
        if has("win16") || has("win32")
            set wildignore+=.git\*,.hg\*,.svn\*
        else
            set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
        endif
    endif
" }

" Appearances
"/
"/ Setting of the VIM appearences. Remember put these settings
"/ follow the 'colorscheme' setting, or these will be overwrite!
"/
" {
    " Always show current position
    set ruler
    
    " Force height of the command bar to 1
    set cmdheight=1
    
    " A buffer becomes hidden when it is abandoned
    set hid
    
    " Configure arrow(left/right) keys & backspace so they act as they should act
    set backspace=indent,eol,start 		" Make backspace behave like every other editor.
    set whichwrap+=<,>,h,l                  " Cursor left/right can move to the previous/next line.
    
    " Ignore case while searching
    set ignorecase
    
    " When searching try to be smart about cases
    set smartcase
    
    " Do not redraw while executing macros(good performance config)
    set lazyredraw
    
    " For regular expressions turn magic on
    set magic
    
    " Show matching brackets when text indicator is over them
    set showmatch
    
    " How many tenths of a second to blink when matching brackets
    set mat=2
    
    " No annoying sound on errors
    set noerrorbells visualbell t_vb=	" No damn bells, so turn it OFF!
    set tm=500
    
    " Properly disable sound on errors on MacVim
    if has("gui_macvim")
        autocmd GUIEnter * set vb t_vb=
    endif

    
    
    " We'll fake a custom left padding for each window
    if 1
        hi LineNr guibg=bg
        hi tabline guibg=bg
        hi tabline ctermbg=darkblue
        " hi LineNr ctermbg=LightCyan
        hi LineNr ctermfg=LightCyan
    
        "-----------------Will set the spaces for every line
        " set foldcolumn=1
    
        hi foldcolumn guibg=bg
    
        " Get rid of ugly split borders.
        hi vertsplit guifg=cyan guibg=red
        hi vertsplit ctermfg=cyan ctermbg=red
    endif
"/
"/ END of VIM appearences
"/
" }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"----------------------Visuals Settings------------------------
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {
    " Use 256 colors. This is useful in Gnome Terminal Vim.
    " NOTE: it's t_Co, NOT t_CO or t_co!!!
    if $COLORTERM == 'gnome-terminal'
        set t_Co=256
    endif
    
    if has('gui_running')
        "colorscheme atom-dark
        set background=dark
        colorscheme solarized
        set guifont=Fira\ Code\ Light\ 16
    else
        try
    	"colorscheme desert
    	color molokai
        catch
        endtry
    endif
    
    " This option specifies when the line with tab page labels will be displayed:
    "    0: never
    "    1: only if there at least two tab pages
    "    2: always
    set showtabline=2
    
    " Setting for macOS, DO NOT open this under other system!
    "set macligatures                         
    
    " We want pretty symbols, when available
    
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    
    " When 'e' is missing a non-GUI tab pages line may be used.
    " This tells vim DO NOT show GUI tabs above, a non-GUI one is OK.
    " NOTE: Advanced Feature
    if has("gui_running")
        set guioptions-=e
        set guitablabel=%N/\ %t\ %M
    " Let's make gvim more comfortable: Toggle Menu & ToolBar by <F11>
        set guioptions-=m
        set guioptions-=T
    endif
    
    " For GUI vim, use <F11> to toggle MenuBar & ToolBar
    " NOTE: Advanced Feature
    map <silent> <F11> :if &guioptions=~#'T'<BAR>
                            \set guioptions-=T<BAR>
                            \set guioptions-=m<BAR>
                        \else<BAR>
                            \set guioptions+=T<BAR>
                            \set guioptions+=m<BAR>
                        \endif<CR>
    	
    
    
    " Set utf8 as standard encoding and en_US as the standard language
    set encoding=utf8
    
    "Use Unix as the standard file type
    set ffs=unix,dos,mac
    
    " Highlight current line / current column
    " NOTE: Advanced feature
    if 1
        au WinLeave * set nocursorline nocursorcolumn
        au WinEnter * set cursorline cursorcolumn
        set cursorline cursorcolumn
    endif
" }

" Text, tab and indent related
" {
    " Be smart when using tabs ;)
    set smarttab
    
    " Auto indent / Smart indent / Wrap lines
    " NOTE: Dont wrap lines! It conflict with "set nowrap"
    set ai si "wrap
    
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Visual mode press * or # searches for the current selection
    " Super useful! From an idea
    vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
    vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
" }




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------Key mappings-------------------------"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {
    " Smart way to move between split windows
    nmap <C-J> <C-W><C-J>
    nmap <C-K> <C-W><C-K>
    nmap <C-H> <C-W><C-H>
    nmap <C-L> <C-W><C-L>

    " imap means mapping for insert mode, nmap means mapping for normal mode
    " Make it easy to edit the Vimrc file.
    if 0    " same as else, but command map dont show colors, so I use else instead
        nmap <Leader><Leader>ev :tabedit $MYVIMRC<CR>
        nmap <Leader><Leader>sv :so $MYVIMRC<CR>
        nmap <Leader><Leader>eb :exe "tabnew ".g:cvimrcp."basic_settings.vim"<CR>
    else
        execute "nnoremap <Leader><Leader>ev :tabedit " .$MYVIMRC ."<CR>"
        execute "nnoremap <Leader><Leader>sv :so " .$MYVIMRC ."<CR>"
        execute "nnoremap <Leader><Leader>eb :tabnew ".g:cvimrcp .g:basicFileName ."<CR>"
        execute "nnoremap <Leader><Leader>pl :tabnew ".g:cpluginsp .g:vimPlugInsList ."<CR>"
    endif
    
    " Add simple highlight removal.
    nmap <Leader><Leader><space> :nohlsearch<CR>
    
    " Make NERDTree easier to toggle.
    nmap wm :NERDTreeToggle<CR>
    
    " Quick search in tags
    nmap <Leader>f :tag<space>
    
    " Hot-key for tag previous(ctags)
    nmap <F6> :tp<CR>
    
    " Hot-key for tag next(ctags)
    nmap <F7> :tn<CR>
    
    " Useful mappings for managing tabs
    map <ESC>to :tabonly<CR>
    map <ESC>tc :tabclose<CR>
    map <ESC>tn :tabnext<CR>
    map <ESC>tp :tabprevious<CR>
    
    " Opens a new tab with the current buffer's path
    " Super usefull when editing files in the same directory
    map <ESC>te :tabedit <c-r>=expand("%:p:h")<CR>/
    
    " Let '<ESC>tl' toggle between this and the Last accessed Tab
    " NOTE: Advanced feature
    let g:lasttab = 1
    nmap <ESC>tl :exe "tabn ".g:lasttab<CR>
    au TabLeave * let g:lasttab = tabpagenr()
    
    " Switch CWD(current working directory) to the directory of the open path
    " NOTE: also a another way to automatically imply this function, details locate **1
    map <ESC>cd :cd %:p:h<CR>:pwd<CR>
    
    " Eggcache vim
    nnoremap ; :
    noremap W w
    noremap WQ wq
    noremap Wq wq
    noremap Q q
    noremap Qa qa
    noremap QA qa
" }
" DO NOT open this feature right now!
if 0
" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {
    " Most prefer to automatically switch to the current file directory when a 
    " new buffer is opened; to prevent this behavior, add the following to your
    " vim_global_env.vim file: 
    "   let g:rocky_no_autochdir = 1
    " {
        " Enabled by default
        if !exists('g:rocky_no_autochdir')
            " Alway switch to the current file directory
            autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
        endif
    " }

    " Clean redundant spaces in the tail of following type of files
    " *.txt/*.js/*.py/*.wiki/*.sh/*.coffee
    " {
        if has("autocmd")
            autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
        endif
    " }
    
    " Return to last edit position when opening files (You want this!)
    " {
        " This one is also working good
        " autocmd BufReadPost *
        "       \ if !exists("g:leave_my_cursor_position_alone") |
        "       \   if line("'\"") > 0 && line("'\"") <= line("$") |
        "       \       exe "normal g'\"" |
        "       \   endif |
        "       \ endif
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exec "normal! g'\"" | endif
    " }
" }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {
    " Always show the status line
    set laststatus=2
    
    " Format the status line
    set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
" }


" Air-line
" {
    " Basic settings
    " {
        let g:airline_theme = 'molokai'
        let g:airline_powerline_fonts = 1
    " }

    " Tabline
    " {
        " Enable/Disable enhanced tabline.
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_extensions = ['branch', 'tabline']

        " Configure whether buffer numbers should be shown. 
        let g:airline#extensions#tabline#buffer_nr_show = 1

        " enable/disable displaying open splits per tab (only when tabs are opened). 
        let g:airline#extensions#tabline#show_splits = 1

        " configure separators for the tabline only
        let g:airline#extensions#tabline#left_sep = ' '
        let g:airline#extensions#tabline#left_alt_sep = '|'
        " defines the name of a formatter for how buffer names are displayed.
        let g:airline#extensions#tabline#formatter = 'unique_tail'
    " }

    " Shortcuts for switching buffer
    nnoremap <tab> :bn<CR>
    nnoremap <s-tab> :bp<CR>

    " Enable/Disable detection of whitespace errors.
    let g:airline#extensions#whitespace#enabled = 0
    " Customize the whitespace symbol.
    let g:airline#extensions#whitespace#symbol = '!'

    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
    
    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.maxlinenr = ''

" }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {
    " Press ,ss will toggle and untoggle spell checking
    map <silent><leader>ss :setlocal spell!<CR>
    
    " Shortcuts using <leader>
    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=
" }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {
    " Remove the Windows  - when the encodings gets messed up
    noremap <leader>m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm
    
    " Toggle paste mode on & off
    map <leader>pp :setlocal paste!<CR>
" }

"--------------------------Plugins-----------------------------"
"/
"/ CtrlP
"/
" {
    let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
    let g:ctrlp_match_window = 'top,order:btt,min:1,max:30,results:30'
    
    " Set this to 1 if you want CtrlP to scan for dotfiles and dotdirs:
    " (hidden files or hidden dirs)
    let g:ctrlp_show_hidden = 1
    
    " Should FIXME!!!
    " {
        nmap <C-A-P> :CtrlP<CR>
        nmap <C-A-M> :CtrlPMRU<CR>
        nmap <C-A-B> :CtrlPBufTag<CR>
    " }
" }
"/
"/ End of CtrlP
"/

"/
"/ NERDTree
"/
" {
    " Display hidden files by default
    let NERDTreeShowHidden  = 1
    " Tell the NERD Tree DO NOT replease the netrw autocommands
    " set NERDTreeHijackNetrw to ZERO the we can continue using
    " dash("-") to explore local directories. ^_^
    let NERDTreeHijackNetrw = 0
" }
"/
"/ End of NERDTree
"/

"/
"/ Greplace.vim
"/
" {
    set grepprg=ag			" We want to use Ag for the search.
    let g:grep_cmd_opts = '--line-numbers --noheading'
" }
"/
"/ END of Greplace.vim
"/


"/
"/ Command-T(A tool just like CtrlP)
"/
"NOTE: should FIXME!!!
nmap <C-A-T> :CommandT<CR> 
"/
"/ END of Command-T
"/

"/
"/ Vim-Autoformat
"/
" {
    nmap <silent> <F5> :Autoformat<CR>
    " set Vim-autoformat in verbose-mode, it will output errors on formatters that failed.
    let g:autoformat_verbosemode=1
    " define code style to allman(more details astyle --help) and insert space padding around operators.
    let g:formatdef_allman = '"astyle --style=allman --pad-oper"'
    " Use allman style for C++
    let g:formatters_cpp = ['allman']
    " Use allman style for C
    let g:formatters_c =['allman']
" }
"/
"/ END of Vim-Autoformat
"/

"/
"/ Others
"/
" Sort selected lines in order of shortest to longest during visual mode.
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d \\  -f2-" }'<CR>
"/
"/ END of others
"/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Build in functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {
    function! CmdLine(str)
        exe "menu Foo.Bar :" . a:str
        emenu Foo.Bar
        unmenu Foo
    endfunction

    " Visual Selection
    function! VisualSelection(direction, extra_filter) range
        let l:saved_reg = @"
        execute "normal! vgvy"
    
        let l:pattern = escape(@", "\\/.*'$^~[]")
        let l:pattern = substitute(l:pattern, "\n$", "", "")
    
        if a:direction == 'gv'
            call CmdLine("Ack '" . l:pattern . "' " )
        elseif a:direction == 'replace'
            call CmdLine("%s" . '/'. l:pattern . '/')
        endif
    
        let @/ = l:pattern
        let @" = l:saved_reg
    endfunction
    
    function! HasPaste()
        if &paste
            return 'PASTE MODE  '
        endif
        return ''
    endfunction

    " Delete trailing white space on save, useful for some filetypes ;)
    function! CleanExtraSpaces()
        let save_cursor = getpos('.')
        let old_query = getreg('/')
        silent! %s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
    endfunction
" }
