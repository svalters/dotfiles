" ------------------------------------------------------------------------------
" -> Notes
" ------------------------------------------------------------------------------

" Neovim's own defaults already cover what old vimrcs spell out: syntax
" highlighting, filetype plugins and indent, incsearch, hlsearch, utf-8,
" hidden buffers, silenced bells, mouse support and true color. Only settings
" that differ from those defaults belong in here.
"
"   :help nvim-defaults

" ------------------------------------------------------------------------------
" -> Editing
" ------------------------------------------------------------------------------

" Indent with two spaces.
set expandtab
set shiftwidth=2
set tabstop=2

" Do not wrap long lines.
set nowrap

" Keep undo history between sessions (stored in ~/.local/state/nvim/undo).
set undofile

" ------------------------------------------------------------------------------
" -> Search
" ------------------------------------------------------------------------------

" Case insensitive, unless the pattern contains an uppercase letter.
set ignorecase
set smartcase

" ------------------------------------------------------------------------------
" -> Interface
" ------------------------------------------------------------------------------

" Show line numbers.
set number

" Keep context visible around the cursor while scrolling.
set scrolloff=8

" Open new splits below and to the right.
set splitbelow
set splitright

" Prompt to save instead of failing when quitting with unsaved changes.
set confirm
