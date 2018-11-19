map leader = " " 
let g:mapleader = " "
source ~/dotfiles/homeplugins.vim

nnoremap <leader>D :vs ~/dotfiles<cr>
" source ~/dotfiles/plsp.vim
if has('nvim')
	source ~/dotfiles/test.vim
	source ~/dotfiles/betterdefaults.vim
	source ~/dotfiles/pynavigate.vim
	source ~/dotfiles/webdevcustom.vim
	source ~/dotfiles/django.vim
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
" colorscheme sierra
colorscheme base16-ocean

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
set undofile

set noshowmode " neede for echodoc plugin

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
" let python_highlight_all = 1
set smartindent
set expandtab
set shiftwidth=4
set tabstop=8

nnoremap <silent> <ESC> :nohlsearch <CR>

nnoremap <leader>8 mv*#`v



"make space around line/par
nnoremap <leader>o mpo<ESC>kO<ESC>`p
nnoremap <leader>O mp}o<ESC>{O<ESC>`p




" swap two function args with cursor on the second
nnoremap <leader>s diwbbPa, <ESC>f,df <ESC>

au FileType html setl sw=2 sts=2 et
au FileType htmldjango setl sw=2 sts=2 et
au FileType javascript setl sw=2 sts=2 et | source ~/dotfiles/javascriptcustom.vim
au FileType java setl sw=2 sts=2 et | source ~/dotfiles/javahelpers.vim
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS




set signcolumn=yes

" Execute project spoecitif vimrcs
set exrc
set secure

set noshowcmd


" Command helpers
nnoremap ! :!



augroup nord-overrides
  autocmd!
  autocmd ColorScheme nord highlight Comment ctermfg=14
augroup END



