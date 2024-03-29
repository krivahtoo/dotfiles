set encoding=utf8

set guifont=JetBrainsMono\ Nerd\ Font\ 9

" Make sure numbering is set
set number

" Disable Swap file
set nobackup
set noswapfile

" More natural splitting
set splitbelow
set splitright

" Enable syntax highlighting
syntax enable 

set termguicolors

" Ignore annoying patterns
set wildignore=*.pyc,**/__pycache__/*,**/node_modules/*,.coverage.*,.eggs,*.egg-info/

" Ignore casing when performing completion
set wildignorecase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

call plug#begin()

Plug 'tpope/vim-sensible'

Plug 'bluz71/vim-nightfly-guicolors'

Plug 'lambdalisue/fern.vim'

Plug 'lambdalisue/nerdfont.vim'

Plug 'lambdalisue/fern-renderer-nerdfont.vim'

Plug 'lambdalisue/glyph-palette.vim'

Plug 'cdelledonne/vim-cmake'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'ryanoasis/vim-devicons'

call plug#end()

colorscheme nightfly

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:fern#renderer = "nerdfont"
