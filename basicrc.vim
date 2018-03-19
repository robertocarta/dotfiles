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
"""
augroup focus
    au!
    au TabLeave *  silent! wall
    silent! au FocusLost * silent! wall
    silent! au BufLeave *  silent! wall
    silent! au WinLeave * silent! wall
augroup END
"

set undofile
set autowriteall

"open quickfix everytime a quickfixcommand is used
"
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
augroup END

runtime macros/matchit.vim


map leader = " "
let g:mapleader = " "
"
set nocompatible
"set t_Co=256
set termguicolors
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

nnoremap <silent> <ESC> :nohlsearch <CR>

nnoremap <c-8> mv*#`v


au FileType html setl sw=4 sts=4 et
au FileType htmldjango setl sw=4 sts=4 et
au FileType javascript setl sw=4 sts=4 et
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS





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
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
	\ 'javascript': ['javascript-typescript-stdio'],
	\ 'javascript.jsx': ['javascript-typescript-stdio'],
	\ 'html': ['html-languageserver', '--stdio'],
	\ 'css': ['css-languageserver', '--stdio'],
	\ 'python':['pyls']
    \ }
"
"
"    " \ 'javascript': ['javascript-typescript-stdio'],
"    " \ 'javascript.jsx': ['javascript-typescript-stdio'],
"
"Plug '/usr/local/opt/fzf'
"Plug 'junegunn/fzf'
"Plug 'junegunn/fzf.vim'
Plug 'mkitt/browser-refresh.vim'
let g:RefreshRunningBrowserDefault = 'chrome'
"nnoremap <C-p> :FZF <CR>
"nnoremap <C-f> :Lines <CR>
"nnorema <C-g> :Ag 
"
"
if has('nvim')
	Plug 'roxma/nvim-completion-manager', {'do': 'npm install'}
	" Use fuzzy matching
	let g:cm_matcher = {'case': 'smartcase', 'module': 'cm_matchers.fuzzy_matcher'}
	autocmd FileType javascript,python,typescript,json,css,less,html,reason setlocal omnifunc=LanguageClient#complete
endif
"
"
"set shortmess+=c
"Plug 'roxma/ncm-flow'
"Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
"Plug 'calebeby/ncm-css'
"
"
"Plug 'burnettk/vim-angular'
"Plug 'othree/javascript-libraries-syntax.vim'
"
"autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 0
"autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 0
"autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
"autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
"autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
"
"
"
"
"Plug 'junegunn/goyo.vim'
"Plug 'prabirshrestha/async.vim'
"" Plug 'prabirshrestha/vim-lsp'
"" if executable('pyls')
""     " pip install python-language-server
""     au User lsp_setup call lsp#register_server({
""         \ 'name': 'pyls',
""         \ 'cmd': {server_info->['pyls']},
""         \ 'whitelist': ['python'],
""         \ })
"" endif
"" Plug 'prabirshrestha/asyncomplete.vim'
"" Plug 'prabirshrestha/asyncomplete-lsp.vim'
"" let g:LanguageClient_autoStart = 1
"" set omnifunc=LanguageClient#complete
"" let g:LanguageClient_diagnosticsEnable = 0
""
"" let g:deoplete#enable_at_startup = 1
"Plug 'scrooloose/nerdtree'

" auto pairs
Plug 'jiangmiao/auto-pairs'

" status bar mods
"
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"

"Nord vim color scheme
Plug 'arcticicestudio/nord-vim'

"Color
Plug 'morhetz/gruvbox'

"Dracula
Plug 'blueshirts/darcula'

Plug 'tpope/vim-surround'
"Comment easily with gcc"
Plug 'tomtom/tcomment_vim' 

"Plug 'roxma/ncm-flow'


Plug 'alvan/vim-closetag'
Plug 'othree/html5.vim'
Plug 'sheerun/vim-polyglot'
Plug 'jaxbot/browserlink.vim'

Plug 'joonty/vdebug'

" (Optional) Multi-entry selection UI.
"Plug 'Shougo/denite.nvim'

" (Optional) Showing function signature and inline doc.
"Plug 'Shougo/echodoc.vim'
"Plug 'HiPhish/repl.nvim'
"let g:repl={}
"let g:repl['python'] = {
"  		\ 'bin': 'ipython',
"  		\ 'args': [],
" 		\ 'syntax': '',
"  		\ 'title': 'ipython',
" 		\ 'preproc': {txt -> join(filter(split(txt, '\n'), {idx, val -> !empty(val)}), "\n")}
"		\}
"
"" Send the text of a motion to the REPL
"nmap <leader>rs  <Plug>(ReplSend)
"" Send the current line to the REPL
"nmap <leader>rss <Plug>(ReplSendLine)
"nmap <leader>rs_ <Plug>(ReplSendLine)
"" Send the selected text to the REPL
"vmap <C-j>  <Plug>(ReplSend)
"
"
""Git
"Plug 'airblade/vim-gitgutter'
":au VimEnter * :GitGutterDisable
"Plug 'tpope/vim-fugitive'
"
"
"
"filetype plugin indent on                   " required!
call plug#end()



"
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <leader>b :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>r :call LanguageClient_textDocument_rename()<CR>


colorscheme darcula
nnoremap <c-p> :e **/




map <leader>l :w\|:silent !reload-chrome<cr>
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EXTRACT VARIABLE (SKETCHY)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ExtractVariable()
    let name = input("Variable name: ")
    if name == ''
        return
    endif
    " Enter visual mode (not sure why this is needed since we're already in
    " visual mode anyway)
    normal! gv

    " Replace selected text with the variable name
    exec "normal c" . name
    " Define the variable on the line above
    exec "normal! O" . name . " = "
    " Paste the original selected text to be the variable value
    normal! $p
endfunction
nnoremap <leader>l :RRB <CR>
nnoremap <leader>e :RRB <CR>


" Toggle 'default' terminal
nnoremap <leader>t :call ChooseTerm("term-slider", 1)<CR>
" Start terminal in current pane
nnoremap <leader>T :call ChooseTerm("term-pane", 0)<CR>
 
function! ChooseTerm(termname, slider)
    let pane = bufwinnr(a:termname)
    let buf = bufexists(a:termname)
    if pane > 0
        " pane is visible
        if a:slider > 0
            :exe pane . "wincmd c"
        else
            :exe "e #"
        endif
    elseif buf > 0
        " buffer is not in pane
        if a:slider
            :exe "topleft split"
        endif
        :exe "buffer " . a:termname
    else
        " buffer is not loaded, create
        if a:slider
            :exe "topleft split"
        endif
        :terminal
        :exe "f " a:termname
    endif
endfunction

nnoremap - g_
vnoremap - g_

set signcolumn=yes
