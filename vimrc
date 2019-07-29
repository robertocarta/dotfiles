source ~/dotfiles/homeplugins.vim

" source ~/dotfiles/plsp.vim
if has('nvim')
	source ~/dotfiles/test.vim
	source ~/dotfiles/betterdefaults.vim
	source ~/dotfiles/pynavigate.vim
	source ~/dotfiles/webdevcustom.vim
	source ~/dotfiles/django.vim
endif


" --------------------------------------------------------
" ------------------------- colors ---------------------
" --------------------------------------------------------
"
"
set nocompatible
set t_Co=256
set shortmess+=c
set termguicolors


"THIS OVERRIDES THE COLORSCHEME (i think)
" hi Normal ctermbg=NONE
highlight LineNr ctermfg=darkgrey
set background=dark
" colorscheme sierra

function! ColorDark()
        let g:curcolor="dark"
        set background=dark
        " colorscheme seagrey-dark
        colorscheme one
        " :highlight Normal ctermfg=NONE ctermbg=NONE
        let &t_ZH="\e[3m"
        let &t_ZR="\e[23m"
        highlight Comment cterm=italic
        highlight Comment cterm=italic
endfunction

function! ColorLight()
        let g:curcolor="light"
        " set termguicolors
        highlight Normal ctermfg=black ctermbg=white


        colorscheme one

        set background=light
        highlight Comment cterm=italic
        highlight Comment cterm=italic
endfunction


function! ToggleColor()
        if g:curcolor=="dark"
                call ColorLight()
        else
                call ColorDark()
        endif
endfunction

nnoremap <F12> :call ToggleColor()<cr>

call ColorDark()

" --------------------------------------------------------
" ------------------------- settings ---------------------
" --------------------------------------------------------

set exrc
set secure
set autoread                   " Automatically read a file changed outside of vim
set autowrite


set signcolumn=yes
set showcmd        " Show partial commands in status line and Selected characters/lines in visual mode
set noshowcmd
set showmode       " Show current mode in command-line
set showmatch      " Show matching brackets/parentthesis
set matchtime=5    " Show matching time
set report=0       " Always report changed lines
set pumheight=20   " Avoid the pop up menu occupying the whole screen

set clipboard+=unnamed

"""
augroup focus
    au!
    au TabLeave *  silent! wall
    silent! au FocusLost * silent! wall
    silent! au BufLeave *  silent! wall
    silent! au WinLeave * silent! wall
augroup END
"


"open quickfix everytime a quickfixcommand is used
"
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
augroup END


filetype plugin indent on
syntax enable
set noswapfile
set mouse=a

set ignorecase
set smartcase

set numberwidth=1
set cursorline
set keywordprg=":help"

set incsearch
set hlsearch

set laststatus=2
set undofile

set noshowmode " neede for echodoc plugin

set ttimeout
set ttimeoutlen=50


"split rules
set splitright
set splitbelow


 " Always use vertical diffs
 set diffopt+=vertical

"  Scrolling 

 set scrolloff=4       "Start scrolling when we're 8 lines away from
"  set sidescrolloff=15
 set sidescroll=1
 

""""""" python stuff 
set number showmatch


" indentation
set smartindent
set expandtab
set shiftwidth=4
set tabstop=8

" Execute project spoecitif vimrcs

" --------------------------------------------------------
" ------------------------- vanilla mappings -------------
" --------------------------------------------------------
map leader = " "
let g:mapleader = " "

vnoremap < <gv
vnoremap > >gv
nmap j gj
nmap k gk
vmap j gj
vmap k gki

nnoremap ) :call feedkeys("]m")<cr>
nnoremap ( :call feedkeys("[m")<cr>

nnoremap <leader>g :grep -r <cword> . --exclude-dir={.git,env,env1,env2,env3,venv,node_modules,data,.idea,'*/__pycache__'}

nnoremap <F2> :set number!<cr>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>p :pclose<cr>
nnoremap ! :!
nnoremap <leader>8 mv*#`v
nnoremap <silent> <ESC> :nohlsearch <CR>

nnoremap <leader>D :vs ~/dotfiles<cr>

nnoremap <F1> :windo set wrap!<cr>


" --------------------------------------------------------
" ------------------------- autocommands -------------
" --------------------------------------------------------

au FileType html setl sw=2 sts=2 et
au FileType htmldjango setl sw=2 sts=2 et
au FileType javascript setl sw=2 sts=2 et | source ~/dotfiles/javascriptcustom.vim
"needed?
au FileType javascript setl omnifunc=javascriptcomplete#CompleteJS

au FileType c setl sw=2 sts=2 et | source ~/dotfiles/cstyle.vim
au FileType cpp setl sw=2 sts=2 et | source ~/dotfiles/cstyle.vim
au FileType java setl sw=2 sts=2 et | source ~/dotfiles/javahelpers.vim
au FileType markdown setlocal nonumber
au FileType sql source ~/dotfiles/psql.vim
au TermOpen * setlocal nonumber








