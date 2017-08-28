"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" background has to be set on terminal as 43-48-59
"plugins
"mappings
let mapleader = ","
let g:mapleader = ","
source ~/dotfiles/plugins.vim
if has('nvim')
	source ~/dotfiles/test.vim
	source ~/dotfiles/betterdefaults.vim
	source ~/dotfiles/pynavigate.vim
endif
"
set nocompatible
set t_Co=256
filetype plugin indent on


"THIS OVERRIDES THE COLORSCHEME (i think)
hi Normal ctermbg=NONE
highlight LineNr ctermfg=darkgrey
set background=dark
colorscheme nord

highlight LineNr ctermfg=darkgrey
syntax enable
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


nnoremap <silent> <ESC> :nohlsearch <CR>


