"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" background has to be set on terminal as 43-48-59
"plugins
source ~/dotfiles/plugins.vim
"
set nocompatible
set t_Co=256
filetype plugin indent on


"THIS OVERRIDES THE COLORSCHEME (i think)
hi Normal ctermbg=NONE
highlight LineNr ctermfg=darkgrey
set background=dark
colorscheme gruvbox

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

"split rules
set splitright
set splitbelow

"mappings
let mapleader = ","
let g:mapleader = ","

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


"Don't know what the following is
"if has("autocmd")
"    au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
"    au InsertEnter,InsertChange *
"            \ if v:insertmode == 'i' | 
"            \   silent execute '!echo -ne "\e[5 q"' | redraw! |
"            \ elseif v:insertmode == 'r' |
"            \   silent execute '!echo -ne "\e[3 q"' | redraw! |
"            \ endif
"          au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
"  endif


  " "




