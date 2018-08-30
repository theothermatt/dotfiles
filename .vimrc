" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set undofile		" keep an undo file (undo changes after closing)
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

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

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Run :PlugInstall after adding to this list.
call plug#begin('~/.vim/plugged')

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
Plug 'elixir-editors/vim-elixir'

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

" Sort out the status line so it's readable when not focused.
hi StatusLine ctermfg=231 ctermbg=241 cterm=bold guifg=#f8f8f2 guibg=#64645e gui=bold
hi StatusLineNC ctermfg=231 ctermbg=241 cterm=NONE guifg=#d8d8d2 guibg=#3c3c36 gui=NONE

au FileType markdown set tw=79 autoindent

map <C-n> :NERDTreeToggle<CR>
:hi ColorColumn ctermbg=darkgrey guibg=darkgrey
colorscheme monokai
if has("gui_running")
	set guioptions-=T
endif

nnoremap <C-p> :Files<CR>

nnoremap <silent> <F9> :TagbarToggle<CR>

set scrolloff=2

set ignorecase
set smartcase
