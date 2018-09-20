set undofile		" keep an undo file (undo changes after closing)
set history=50		" keep 50 lines of command line history

" These lines stop Vim putting backup files everywhere, and just have it write
" a backup file before doing a file write, and then delete it once the write
" is successful.
set nobackup
set writebackup
set backupcopy=auto

" Where to put swap files.
set directory=~/.backup//,.
" Where to put backup files.
set backupdir=~/.backup//,.
" Where to put undo files.
set undodir=~/.backup//,.

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" Run :PlugInstall after adding to this list.
call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'mattn/emmet-vim'
Plug 'crusoexia/vim-monokai'
Plug 'elmcast/elm-vim'
Plug 'majutsushi/tagbar'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/fzf.vim'

call plug#end()

let g:xml_syntax_folding=1
set nu
set tabstop=8
set softtabstop=4
set expandtab
set shiftwidth=4
set breakindent
set colorcolumn=80
set splitright
set splitbelow

au FileType markdown set tw=79 autoindent

map <C-n> :NERDTreeToggle<CR>

:hi ColorColumn ctermbg=darkgrey guibg=darkgrey
colorscheme monokai

" Sort out the status line so it's readable when not focused.
" Needs to be after the call to colorscheme.
hi StatusLine ctermfg=231 ctermbg=241 cterm=bold guifg=#f8f8f2 guibg=#64645e gui=bold
hi StatusLineNC ctermfg=231 ctermbg=241 cterm=NONE guifg=#d8d8d2 guibg=#3c3c36 gui=NONE

nnoremap <silent> <F9> :TagbarToggle<CR>

set scrolloff=2

set ignorecase
set smartcase

let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
let g:UltiSnipsSnippetDir=[$HOME.'/.config/nvim/UltiSnips']
