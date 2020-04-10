" ------------------------------------------------------------------------------
" -> General
" ------------------------------------------------------------------------------

" Set timeout for vim action
set timeoutlen=300

" Enable filetype options
filetype plugin on
filetype indent on

" Set spellcheck language
set spell spelllang=en_us

" ------------------------------------------------------------------------------
" -> Plug
" ------------------------------------------------------------------------------

" Pull plug plugin if doesn't exist
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Initialize plug install
call plug#begin('~/.config/nvim/plugged')

" General
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Looks
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

" Git
Plug 'mhinz/vim-signify'

" Programming
Plug 'tpope/vim-commentary'

" Language specific
Plug 'scrooloose/syntastic'

" Add plugins to &runtimepath
call plug#end()

" ------------------------------------------------------------------------------
" -> Plug: NerdTree
" ------------------------------------------------------------------------------

" NerdTree options
let NERDTreeAutoDeleteBuffer = 1  " Non valid buffer removal
let NERDTreeShowBookmarks = 1     " Show bookmarks
let NERDTreeQuitOnOpen = 1        " Quit NerdTree after opening file
let NERDTreeShowHidden = 1        " Show hidden files/folders

" Key mapping
map <C-e> :NERDTreeToggle<CR>

" ------------------------------------------------------------------------------
" -> Plug: Solarized
" ------------------------------------------------------------------------------

" Solarized options
let g:solarized_termcolors = 256  " Color range
"let g:solarized_termtrans = 1     " Transparency

" ------------------------------------------------------------------------------
" -> Plug: Airline
" ------------------------------------------------------------------------------

" Airline options
let g:airline_theme = 'solarized'   " Airline theme
let g:airline_powerline_fonts = 1   " Powerline fonts

" Tabline options
let g:airline#extensions#tabline#enabled = 1      " Display tabline
let g:airline#extensions#tabline#fnamemod = ':t'  " Buffer name format

" ------------------------------------------------------------------------------
" -> Colors and Fonts
" ------------------------------------------------------------------------------

syntax enable           " Enable syntax highlighting
colorscheme solarized   " Set colorscheme
set background=dark     " Set background theme
set encoding=utf-8      " Set utf-8 as standard encoding
set ffs=unix,dos,mac    " Use Unix as the standard file type
set showtabline=1       " Show tabline

" ------------------------------------------------------------------------------
" -> Mapping
" ------------------------------------------------------------------------------

" Map buffer keys
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>

" Space open/closes folds
nnoremap <space> za

" ------------------------------------------------------------------------------
" -> Formatting
" ------------------------------------------------------------------------------

set title       " Automatically set windows title
set nowrap      " Do not wrap long lines
set expandtab   " Use spaces instead of tabs

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Set char limit guide
set colorcolumn=80

" ------------------------------------------------------------------------------
" -> Nvim user interface
" ------------------------------------------------------------------------------

" No annoying sound on errors
set noerrorbells
set novisualbell

" Enable backups
set backup

" Undo
set undofile  " Maintain undo history between sessions

" General
set hidden  " Allow buffer switching without saving
set number  " Show line numbers

" Search
set ignorecase  " Case insensitive search
set smartcase   " If uppercase letter, it is case sensitive
set incsearch   " Move the cursor to the matched string
set hlsearch    " Highlight search results

" Show matching brackets when text indicator is over them
set showmatch

" Save backup info in tmp
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//
