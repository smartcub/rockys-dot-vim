" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'skwp/greplace.vim'
Plug 'wincent/command-t'
" Plug 'msanders/snipmate.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'

""""""""""""""""""""""""""""""""""""
""""""""""  Status Bar  """"""""""""
""""""""""""""""""""""""""""""""""""
" Air-line
" {
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
" }


""""""""""""""""""""""""""""""""""""
"""""""""  Color Schemes  """"""""""
""""""""""""""""""""""""""""""""""""
" Molokai
Plug 'tomasr/molokai'
let g:molokai_original = 1

" Solarized
Plug 'altercation/vim-colors-solarized'
let g:color_name='solarized'
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast='normal'
let g:solarized_visibility='normal'

" Initialize plugin system
call plug#end()
