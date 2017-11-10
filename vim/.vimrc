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
Plugin 'vim-syntastic/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'mxw/vim-jsx'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins. Or from terminal: $ vim +PluginInstall +qall
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" :PluginUpdate     - updates plugin
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



filetype plugin indent on  " required!

set bs=2
set expandtab                     " On pressing tab, insert 2 spacs
set tabstop=2                     " when indenting with '>', use 2 spaces width
set shiftwidth=2                  " show existing tab with 2 spaces width
set autoindent                    " copy indent to new line
set nolist                        " Forces spaces instead of tabs when pasting code
set number                        " set line numbers
set ruler                         " shows row and column number at bottom right corner

let mapleader = ","               " set mapleader ( or <Leader> ) to ','
let maplocalleader = ","
let &titlestring = @%             " update screen title
set title                         " update screen title


" Audio
set noerrorbells                  " don't beep

" Indenting
filetype plugin indent on         " indenting intelligence based on file type

" Editing
set backspace=indent,eol,start    " can erase past chars, autoindent, and newlines

" Extra information
set laststatus=2                  " for airline plugin
set number                        " show line numbers
set ruler                         " show row and column at bottom right
set showcmd                       " show info about the current command
set noshowmode                    " don't show --INSERT-- at bottom; unneeded with airline
set title                         " file name in title bar
set visualbell                    " flash command on error

" Search
set hlsearch                      " highlight search matches
set ignorecase                    " case insensitive
set incsearch                     " incremental search highlighting
set smartcase                     " only case insensitive when the search is all lowercase

" Spacing
set tabstop=2                     " number of spaces for tab
set shiftwidth=2                  " number of spaces for indentation
set expandtab                     " tabs are expanded into spaces
set softtabstop=2                 " number of spaces for tab in insert mode

" Theme
syntax enable
set background=dark
colorscheme solarized             " Solarized theme plugin github/altercation/vim-colors-solarized



" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif          

" Plugin:Nerdtree configuration begins >>>>
map <C-n> :NERDTreeToggle<CR>             " Ctrl + n to open tree view
map <S-Right> :tabn<CR>                   " Shift + <-- Nerdtree previous tab
map <S-Left>  :tabp<CR>                   " Shift + --> Nerdtree next tab
autocmd StdinReadPre * let s:std_in=1                                                                    " Automatically open tree view if no file chosen
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif                              " Automatically open tree view if no file chosen
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif    " Close VIM if only nerd tree is open
" <<<<< Nerdtree configuration ends


" Plugin:Syntastic Linter config begins >>>>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint src'  " point eslint to your local node_modules if eslint wasn't installed globally
let g:syntastic_javascript_eslint_exec='/bin/ls'
let g:syntastic_javascript_eslint_generic = 1
let g:syntastic_javascript_eslint_args = '-f compact'
" <<< Syntastic Linter config ends


" Plugin:vim-js-pretty-template (String Template) begins >>>
autocmd FileType javascript JsPreTmpl html
" <<<<Plugin:vim-js-pretty-template (String Template) ends 


" Plugin:vim-jsx config begins >>>
let g:jsx_ext_required = 0            " Works on files other than .jsx
" <<< Plugin:vim-jsx config ends

" Plugin:vim-javascript config begins >>>
let g:javascript_plugin_jsdoc = 1     " Enables syntax highlighting for JSDocs
hi def link jsObjectKey String        " Colorize Object keys. See: syntax/javascript.vim#L261
" <<< Plugin:vim-javascript config ends

" Shortcuts
nmap ; :Files<CR>               " ( , + t ) = Search files with fizz fuzz finder (fzf)
nmap <Leader>b :Buffers<CR>     " ( ; ) = Search files loaded in memory buffer with fizz fuzz finder (fzf)
nmap <Leader>t :Files<CR>      " ( , + t ) = Search files with fizz fuzz finder (fzf)
nmap <Leader>r :Tags<CR>        " ( , + r ) = Search tags with fizz fuzz finder (fzf)
