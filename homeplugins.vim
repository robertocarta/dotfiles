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

if !empty(glob('~/dotfiles/tvsquared.vim'))
	source ~/dotfiles/tvsquared.vim
endif


call plug#begin('~/.vim/plugged')

" Custom plugins...
" Ctrl-P - Fuzzy file search
" Plug 'kien/ctrlp.vim'
" Autocomplete for python
" Plug 'davidhalter/jedi-vim'
"disable autocomplete for jedi
" let g:jedi#completions_enabled = 0

" (Optional) Completion integration with deoplete.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-jedi'
let g:deoplete#enable_at_startup = 1
" let g:deoplete#omni#input_patterns = get(g:, 'deoplete#omni#input_patterns', {})
"let g:deoplete#enable_refresh_always = 1

Plug 'Shougo/echodoc.vim'
let g:echodoc_enable_at_startup = 1
set completeopt-=preview

"
" Plug 'neomake/neomake'
"Plug 'w0rp/ale'
"let g:airline#extensions#ale#enabled = 1
" Disable ALE warnings about trailing whitespace.
"let g:ale_warn_about_trailing_whitespace = 0
"let g:ale_completion_enabled = 1


"let g:ale_linters = {
"\   'html': [],
"\   'javascript': ['eslint'],
"\   'python': ['flake8', 'pylint'],
"\}
"let g:ale_python_flake8_options='--select=F,W'

"let g:ale_sign_warning='.'
"hi ALEErrorSign ctermfg=red ctermbg=none
"let g:ale_sign_error='●'
"hi ALEWarningSign ctermfg=blue ctermbg=none
"
"
"
if has('nvim')
	Plug 'AndrewRadev/splitjoin.vim'
	"
	" Plug 'roxma/nvim-completion-manager', {'do': 'npm install'}
    "
	" Plug 'roxma/nvim-yarp' " dependency of ncm2
    " Plug 'ncm2/ncm2'
	" autocmd BufEnter * call ncm2#enable_for_buffer()
	" set completeopt=noinsert,menuone,noselect
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
		\ 'python':['pyls'],
		\ 'cpp': ['clangd'],
		\ 'c': ['clangd']
		\ }
endif

Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'

    " \ 'javascript': ['javascript-typescript-stdio'],
    " \ 'javascript.jsx': ['javascript-typescript-stdio'],

Plug '/usr/local/opt/fzf'
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

Plug 'junegunn/fzf.vim'

" Plug 'mkitt/browser-refresh.vim'
let g:RefreshRunningBrowserDefault = 'chrome'
nnoremap <C-p> :FZF <CR>
nnoremap <C-f> :Lines <CR>
nnoremap <C-g> :Ag <CR>
nnoremap <C-b> :Buffers <CR>



" Use fuzzy matching
" let g:cm_matcher = {'case': 'smartcase', 'module': 'cm_matchers.fuzzy_matcher'}
autocmd FileType javascript,python,typescript,json,css,less,html,reason setlocal omnifunc=LanguageClient#complete


set shortmess+=c


Plug 'othree/javascript-libraries-syntax.vim'

autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 0
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 0
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

"""""start""



Plug 'junegunn/goyo.vim'

let g:deoplete#enable_at_startup = 1
Plug 'scrooloose/nerdtree'
nnoremap <c-n> :NERDTreeToggle<CR>

"auto pairs
Plug 'jiangmiao/auto-pairs'

Plug 'vim-python/python-syntax'
" status bar mods
"
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
"
"
"Nord vim color scheme
Plug 'arcticicestudio/nord-vim'
"
" "Color
Plug 'morhetz/gruvbox'
"
" "Dracula
Plug 'blueshirts/darcula'
Plug 'phanviet/sidonia'
Plug 'AlessandroYorba/Sierra'
Plug 'hauleth/blame.vim'
Plug 'nightsense/seagrey'
Plug 'JarrodCTaylor/spartan'
Plug 'szorfein/fantasy.vim'



Plug 'tpope/vim-surround'
" Comment easily with gcc"
Plug 'tomtom/tcomment_vim' 
"
"
Plug 'alvan/vim-closetag'
Plug 'othree/html5.vim'
" Plug 'sheerun/vim-polyglot'
"
"
"
" (Optional) Multi-entry selection UI.
Plug 'Shougo/denite.nvim'

" (Optional) Showing function signature and inline doc.
" Plug 'Shougo/echodoc.vim'

Plug 'HiPhish/repl.nvim'
let g:repl={}
let g:repl['python'] = {
  		\ 'bin': 'ipython',
  		\ 'args': [],
 		\ 'syntax': '',
  		\ 'title': 'ipython',
 		\ 'preproc': {txt -> join(filter(split(txt, '\n'), {idx, val -> !empty(val)}), "\n")}
		\}
Plug 'bfredl/nvim-ipy'
nmap <leader>j vip<F5>
" Send the text of a motion to the REPL
nmap <leader>rs  <Plug>(ReplSend)
" Send the current line to the REPL
nmap <leader>rss <Plug>(ReplSendLine)
nmap <leader>rs_ <Plug>(ReplSendLine)
" Send the selected text to the REPL
vmap <C-j>  <Plug>(ReplSend)


"Git
" Plug 'airblade/vim-gitgutter'
" :au VimEnter * :GitGutterDisable
Plug 'tpope/vim-fugitive'



filetype plugin indent on                   " required!
call plug#end()



""""""" jedi-vim """""""
" don't mess up undo history
let g:jedi#show_call_signatures = "0"

let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"





"neomake
" autocmd! BufWritePost * Neomake
" let g:neomake_python_enabled_makers = ['pyflakes']
" let g:neomake_ft_maker_remove_invalid_entries = 1


"""""""airline
"let g:airline#extensions#tabline#enabled = 0
let g:AirlineTheme = 'minimalist'

" Python syntax settings
let g:python_highlight_class_vars=0
let g:python_space_error_highlight=0




nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <F4> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> <leader>b :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>r :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <leader>v :call call LanguageClient#textDocument_definition({'gotoCmd': 'vsplit'}) <CR>


