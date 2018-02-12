map leader = " "
let g:mapleader = " "
source ~/dotfiles/homeplugins.vim
if has('nvim')
	source ~/dotfiles/test.vim
	source ~/dotfiles/betterdefaults.vim
	source ~/dotfiles/pynavigate.vim
	source ~/dotfiles/webdevcustom.vim
endif
"
set nocompatible
set t_Co=256
set termguicolors
" set guicursor=n-c:block-Cursor/lCursor-blinkon0,i-v-ci:block-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
filetype plugin indent on


"THIS OVERRIDES THE COLORSCHEME (i think)
hi Normal ctermbg=NONE
highlight LineNr ctermfg=darkgrey
set background=dark
colorscheme darcula

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
setlocal shiftwidth=4
setlocal tabstop=4

nnoremap <silent> <ESC> :nohlsearch <CR>

nnoremap <c-8> mv*#`v



"make space around line/par
nnoremap <leader>o mpo<ESC>kO<ESC>`p
nnoremap <leader>O mp}o<ESC>{O<ESC>`p




" swap two function args with cursor on the second
nnoremap <leader>s diwbbPa, <ESC>f,df <ESC>

au FileType html setl sw=4 sts=4 et
au FileType htmldjango setl sw=4 sts=4 et
au FileType javascript setl sw=4 sts=4 et
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
