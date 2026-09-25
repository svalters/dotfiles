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

" Search file contents with ripgrep, which respects .gitignore, and send the hits
" to the quickfix list: :grep pattern, then :copen.
if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case
  set grepformat=%f:%l:%c:%m
endif

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

" ------------------------------------------------------------------------------
" -> Colors
" ------------------------------------------------------------------------------

augroup transparency
  autocmd!
  autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE
  autocmd ColorScheme * highlight NormalNC guibg=NONE ctermbg=NONE
  autocmd ColorScheme * highlight NormalFloat guibg=NONE ctermbg=NONE
  autocmd ColorScheme * highlight SignColumn guibg=NONE ctermbg=NONE
  autocmd ColorScheme * highlight LineNr guibg=NONE ctermbg=NONE
  autocmd ColorScheme * highlight CursorLineNr guibg=NONE ctermbg=NONE
  autocmd ColorScheme * highlight FoldColumn guibg=NONE ctermbg=NONE
  autocmd ColorScheme * highlight EndOfBuffer guibg=NONE ctermbg=NONE
augroup END

silent! colorscheme habamax
