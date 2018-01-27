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

" Custom plugins...
" Ctrl-P - Fuzzy file search
" Plug 'kien/ctrlp.vim'
" Autocomplete for python
Plug 'davidhalter/jedi-vim'
"disable autocomplete for jedi
let g:jedi#completions_enabled = 0

" (Optional) Completion integration with deoplete.
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-jedi'
"let g:deoplete#enable_at_startup = 1
" let g:deoplete#omni#input_patterns = get(g:, 'deoplete#omni#input_patterns', {})
"let g:deoplete#enable_refresh_always = 1
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
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
	\ 'python':['pyls']
    \ }

    " \ 'javascript': ['javascript-typescript-stdio'],
    " \ 'javascript.jsx': ['javascript-typescript-stdio'],

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

nnoremap <C-p> :FZF <CR>
nnoremap <C-f> :Lines <CR>
nnorema <C-g> :Ag 


Plug 'roxma/nvim-completion-manager', {'do': 'npm install'}
set shortmess+=c
Plug 'roxma/ncm-flow'
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
Plug 'calebeby/ncm-css'

Plug 'junegunn/goyo.vim'
Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" if executable('pyls')
"     " pip install python-language-server
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->['pyls']},
"         \ 'whitelist': ['python'],
"         \ })
" endif
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" let g:LanguageClient_autoStart = 1
" set omnifunc=LanguageClient#complete
" let g:LanguageClient_diagnosticsEnable = 0
"
" let g:deoplete#enable_at_startup = 1
Plug 'scrooloose/nerdtree'

"auto pairs
Plug 'jiangmiao/auto-pairs'

" status bar mods
"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


"Nord vim color scheme
Plug 'arcticicestudio/nord-vim'

"Color
Plug 'morhetz/gruvbox'

"Dracula
Plug 'blueshirts/darcula'

Plug 'tpope/vim-surround'
"Comment easily with gcc"
Plug 'tomtom/tcomment_vim' 

Plug 'roxma/ncm-flow'


Plug 'alvan/vim-closetag'
Plug 'othree/html5.vim'
Plug 'sheerun/vim-polyglot'



" (Optional) Multi-entry selection UI.
Plug 'Shougo/denite.nvim'

" (Optional) Showing function signature and inline doc.
Plug 'Shougo/echodoc.vim'
Plug 'HiPhish/repl.nvim'
let g:repl={}
let g:repl['python'] = {
  		\ 'bin': 'ipython',
  		\ 'args': [],
 		\ 'syntax': '',
  		\ 'title': 'ipython',
 		\ 'preproc': {txt -> join(filter(split(txt, '\n'), {idx, val -> !empty(val)}), "\n")}
		\}

" Send the text of a motion to the REPL
nmap <leader>rs  <Plug>(ReplSend)
" Send the current line to the REPL
nmap <leader>rss <Plug>(ReplSendLine)
nmap <leader>rs_ <Plug>(ReplSendLine)
" Send the selected text to the REPL
vmap <C-j>  <Plug>(ReplSend)


"Git
Plug 'airblade/vim-gitgutter'
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
let g:AirlineTheme = 'gruvbox'




