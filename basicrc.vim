set showcmd        " Show partial commands in status line and Selected characters/lines in visual mode
set showmode       " Show current mode in command-line
set showmatch      " Show matching brackets/parentthesis
set matchtime=5    " Show matching time
set report=0       " Always report changed lines
set pumheight=20   " Avoid the pop up menu occupying the whole screen
" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
nmap j gj
nmap k gk
vmap j gj
vmap k gki

set undofile
set autowriteall

"open quickfix everytime a quickfixcommand is used
"

runtime macros/matchit.vim


map leader = " "
let g:mapleader = " "
"
set nocompatible
"set t_Co=256
" set termguicolors
" set guicursor=n-c:block-Cursor/lCursor-blinkon0,i-v-ci:block-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
filetype plugin indent on
syntax enable


"THIS OVERRIDES THE COLORSCHEME (i think)
hi Normal ctermbg=NONE
highlight LineNr ctermfg=darkgrey
"set background=dark

set noswapfile
set ignorecase
set smartcase
set numberwidth=1
set autoread
set cursorline
set keywordprg=":help"
set ttimeout
set ttimeoutlen=50
set incsearch
set hlsearch
set laststatus=2
set mouse=a

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


"split rules
set splitright
set splitbelow


 " Always use vertical diffs
 set diffopt+=vertical

"  Scrolling

 set scrolloff=8         "Start scrolling when we're 8 lines away from
 set sidescrolloff=15
 set sidescroll=1


""""""" python stuff
syntax enable
set number showmatch
let python_highlight_all = 1
set smartindent
set noexpandtab
setlocal shiftwidth=4
setlocal tabstop=4

nnoremap <silent> <ESC><ESC> :nohlsearch <CR>

nnoremap <c-8> mv*#`v


au FileType html setl sw=4 sts=4 et
au FileType htmldjango setl sw=4 sts=4 et
au FileType javascript setl sw=4 sts=4 et




"install vim-plug if we don't already have it
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute '!mkdir -p ~/.vim/plugged'
    execute '!mkdir -p ~/.vim/autoload'
    execute '!mkdir -p ~/.local/share/nvim/site/autoload '

    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif


call plug#begin('~/.vim/plugged')

"


Plug 'tpope/vim-surround'
"Comment easily with gcc"
Plug 'tomtom/tcomment_vim'

"Plug 'roxma/ncm-flow'


call plug#end()




nnoremap <c-p> :e **/

