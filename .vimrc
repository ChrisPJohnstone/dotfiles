" Turn on syntax highlighting & and color scheme
colorscheme slate
syntax on

highlight StatusLine ctermfg=black ctermbg=magenta
highlight StatusLineNC ctermfg=black ctermbg=magenta

" Style pane split
highlight VertSplit ctermfg=magenta ctermbg=None

" ------------------------------ "

" Syntax corrections for unsupported file types
augroup SyntaxHighlighting
    autocmd!
    autocmd BufNewFile,BufRead *.md set filetype=text
    autocmd BufNewFile,BufRead *.q set filetype=sql
augroup END

" Display line number & highlight line cursor is on
set cursorline
set scrolloff=100
set number
augroup RelativeNumberToggle
    autocmd!
    autocmd BufEnter,FocusGained,WinEnter * if &number | set relativenumber | endif
    autocmd BufLeave,FocusLost,WinLeave   * if &number | set norelativenumber | endif
augroup END

" Add a vertical ruler at char 80 & make it light grey
augroup LineLengthMarkers
    autocmd!
    autocmd BufNewFile,Bufread *.py set colorcolumn=80
    autocmd BufNewFile,BufRead *.sql set colorcolumn=120
augroup END
highlight ColorColumn ctermbg=8

" Always show status bar
set laststatus=2

" Set tab length to 4 & use spaces
set shiftwidth=4
set tabstop=4
set expandtab
set smartindent

" Highlight matches while searching
set hlsearch

" Tabable options when autocompleting in command mode
" set wildmenu
set wildmode=longest

" For all those times you hit a button and you're not sure what it was
set showcmd

" Macro for encasing
let @1 = "ciw\"\<C-R>\"\"\<ESC>bh"
