set autoread                   " Automatically read a file changed outside of vim
set autowrite
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
set clipboard+=unnamed
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Delete>

nnoremap ) :call feedkeys("]m")<cr>
nnoremap ( :call feedkeys("[m")<cr>

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

nnoremap <leader>g :lgrep -r <cword> . --exclude-dir={.git,env,node_modules,data,.idea,'*/__pycache__'}\|grep -v Binary<cr>

nnoremap <F2> :set number!<cr>
