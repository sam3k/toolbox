set nocompatible   " be iMproved
filetype off       " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin load sample
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



filetype plugin indent on  " required!

set bs=2
set ts=4
set sw=4
set number
" shows row and column number at bottom right corner
set ruler


" Audio
set noerrorbells      " don't beep
" Indenting
filetype plugin indent on   " indenting intelligence based on file type
set autoindent              " copy indent to new line
" Editing
set backspace=indent,eol,start " can erase past chars, autoindent, and newlines
" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Extra information
set laststatus=2      " for airline plugin
set number            " show line numbers
set ruler             " show row and column at bottom right
set showcmd           " show info about the current command
set noshowmode        " don't show --INSERT-- at bottom; unneeded with airline
set title             " file name in title bar
set visualbell        " flash command on error

" Search
set hlsearch          " highlight search matches
set ignorecase        " case insensitive
set incsearch         " incremental search highlighting
set smartcase         " only case insensitive when the search is all lowercase

" Spacing
set expandtab         " tabs are expanded into spaces
set tabstop=4         " number of spaces for tab
set shiftwidth=4      " number of spaces for indentation
set softtabstop=4     " number of spaces for tab in insert mode

" For solarized plugin (color scheme)
" https://github.com/altercation/vim-colors-solarized
syntax enable
set background=dark
colorscheme solarized


" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" Nerdtree configuration begins >>>>
map <C-n> :NERDTreeToggle<CR>                                                                            " Ctrl + n to open tree view
autocmd StdinReadPre * let s:std_in=1                                                                    " Automatically open tree view if no file chosen
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif                              " Automatically open tree view if no file chosen
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif    " Close VIM if only nerd tree is open
" <<<<< Nerdtree configuration ends
