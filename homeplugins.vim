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

" Advanced syntax highlighting for python
Plug 'numirias/semshi'
let g:semshi#excluded_hl_groups = [ 'local','attribute', 'builtin', 'parameter',  'imported' ]
let g:semshi#mark_selected_nodes = 0

function! MyCustomHighlights()
    hi semshiSelected        cterm=bold gui=bold
endfunction
autocmd FileType python call MyCustomHighlights()


" Plug 'Shougo/echodoc.vim'
" let g:echodoc_enable_at_startup = 1
set completeopt-=preview

Plug 'liuchengxu/vista.vim'
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction


" Position to open the vista sidebar. On the right by default.
" Change to 'vertical topleft' to open on the left.
let g:vista_sidebar_position = 'vertical botright'

" Width of vista sidebar.
let g:vista_sidebar_width = 30

" Set this flag to 0 to disable echoing when the cursor moves.
let g:vista_echo_cursor = 1

" Time delay for showing detailed symbol info at current cursor.
let g:vista_cursor_delay = 400

" Close the vista window automatically close when you jump to a symbol.
let g:vista_close_on_jump = 0

" Move to the vista window when it is opened.
let g:vista_stay_on_open = 1

" Blinking cursor 2 times with 100ms interval after jumping to the tag.
let g:vista_blink = [2, 100]

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']

" Fall back to other executives if the specified one gives empty data.
" By default it's all the provided executives excluding the tried one.
" let g:vista_finder_alternative_executives = ['coc']

set statusline+=\ %f
set statusline+=%=
" let &statusline .= ' %{cfi#format("%s", "")}'
" set statusline+=%{NearestMethodOrFunction()}
let &statusline .= ' %{NearestMethodOrFunction()}'
"
"
"
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
	" Plug 'autozimu/LanguageClient-neovim', {
	" 	\ 'branch': 'next',
	" 	\ 'do': 'bash install.sh',
	" 	\ }
        "
	" let g:LanguageClient_serverCommands = {
	" 	\ 'rust': ['rustup', 'run', 'nightly', 'rls'],
	" 	\ 'javascript': ['javascript-typescript-stdio'],
	" 	\ 'javascript.jsx': ['javascript-typescript-stdio'],
	" 	\ 'html': ['html-languageserver', '--stdio'],
	" 	\ 'css': ['css-languageserver', '--stdio'],
	" 	\ 'python':['pyls'],
	" 	\ 'cpp': ['clangd'],
	" 	\ 'c': ['clangd'],
	" 	\ 'java': ['/usr/local/bin/jdtls']
	" 	\ }
    Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
    " if hidden not set, TextEdit might fail.
    set hidden

    " Better display for messages
    set cmdheight=2

    " Smaller updatetime for CursorHold & CursorHoldI
    set updatetime=300

    " always show signcolumns
    set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
	  \ pumvisible() ? "\<C-n>" :
	  \ <SID>check_back_space() ? "\<TAB>" :
	  \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-n> for trigger completion.
    inoremap <silent><expr> <c-n> coc#refresh()

    " Use <cr> for confirm completion.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    " Use `[c` and `]c` for navigate diagnostics
    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K for show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if &filetype == 'vim'
	execute 'h '.expand('<cword>')
      else
	call CocAction('doHover')
      endif
    endfunction

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)

    " Remap for format selected region
    vmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    vmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap for do codeAction of current line
    nmap <leader>ac  <Plug>(coc-codeaction)

    " Use `:Format` for format current buffer
    command! -nargs=0 Format :call CocAction('format')

    " Use `:Fold` for fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)


    " Add diagnostic info for https://github.com/itchyny/lightline.vim
    let g:lightline = {
	  \ 'colorscheme': 'wombat',
	  \ 'active': {
	  \   'left': [ [ 'mode', 'paste' ],
	  \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	  \ },
	  \ 'component_function': {
	  \   'cocstatus': 'coc#status'
	  \ },
	  \ }



" Shortcuts for denite interface
" Show symbols of current buffer
nnoremap <silent> <space>o  :<C-u>Denite coc-symbols<cr>
" Search symbols of current workspace
nnoremap <silent> <space>t  :<C-u>Denite coc-workspace<cr>
" Show diagnostics of current workspace
nnoremap <silent> <space>a  :<C-u>Denite coc-diagnostic<cr>
" Show available commands
nnoremap <silent> <space>c  :<C-u>Denite coc-command<cr>
" Show available services
nnoremap <silent> <space>s  :<C-u>Denite coc-service<cr>
" Show links of current buffer
nnoremap <silent> <space>l  :<C-u>Denite coc-link<cr>

endif

" Plug 'tyru/current-func-info.vim'
" set statusline+=\ %f
" set statusline+=%=
" let &statusline .= ' %{cfi#format("%s", "")}'

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
" autocmd FileType javascript,python,typescript,json,css,less,html,reason setlocal omnifunc=LanguageClient#complete


set shortmess+=c


Plug 'othree/javascript-libraries-syntax.vim'

autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 0
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 0
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

"""""start""



Plug 'junegunn/goyo.vim'

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
Plug 'rakr/vim-one'
" "Dracula
Plug 'blueshirts/darcula'
Plug 'phanviet/sidonia'
Plug 'AlessandroYorba/Sierra'
Plug 'hauleth/blame.vim'
Plug 'nightsense/seagrey'
Plug 'JarrodCTaylor/spartan'
Plug 'szorfein/fantasy.vim'

Plug 'chriskempson/base16-vim'
Plug 'sonph/onehalf'
Plug 'jnurmine/Zenburn'
Plug 'kristijanhusak/vim-hybrid-material'


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
" let g:jedi#show_call_signatures = "0"
"
" let g:jedi#goto_command = "<leader>d"
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_definitions_command = ""
" let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = "<leader>n"
" let g:jedi#completions_command = "<C-Space>"
" let g:jedi#rename_command = "<leader>r"





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




" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <F4> :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> <leader>b :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <leader>r :call LanguageClient_textDocument_rename()<CR>
" nnoremap <silent> <leader>v :call call LanguageClient#textDocument_definition({'gotoCmd': 'vsplit'}) <CR>
"

