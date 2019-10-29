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
    Plug '~/expandstar'
    Plug 'szymonmaszke/vimpyter' "vim-plug
    Plug 'ivanov/vim-ipython'
    Plug 'sainnhe/gruvbox-material'


    Plug 'reedes/vim-pencil'
    "
    " Advanced syntax highlighting for python
    Plug 'numirias/semshi'
    let g:semshi#excluded_hl_groups = [ 'local','attribute', 'builtin', 'parameter',  'imported', 'global' ]
    let g:semshi#mark_selected_nodes = 0
    function! MyCustomHighlights()
        hi semshiSelected        cterm=bold gui=bold
    endfunction
    autocmd FileType python call MyCustomHighlights()
    set completeopt-=preview

" Plug 'liuchengxu/vista.vim'
" function! NearestMethodOrFunction() abort
"   return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
"
"
" nnoremap <F10> :Vista!!<cr>
"
"
" " Position to open the vista sidebar. On the right by default.
" " Change to 'vertical topleft' to open on the left.
" let g:vista_sidebar_position = 'vertical botright'
"
" " Width of vista sidebar.
" let g:vista_sidebar_width = 30
"
" " Set this flag to 0 to disable echoing when the cursor moves.
" let g:vista_echo_cursor = 1
"
" " Time delay for showing detailed symbol info at current cursor.
" let g:vista_cursor_delay = 400
"
" " Close the vista window automatically close when you jump to a symbol.
" let g:vista_close_on_jump = 0
"
" " Move to the vista window when it is opened.
" let g:vista_stay_on_open = 1
"
" " Blinking cursor 2 times with 100ms interval after jumping to the tag.
" let g:vista_blink = [2, 100]
"
" " How each level is indented and what to prepend.
" " This could make the display more compact or more spacious.
" " e.g., more compact: ["▸ ", ""]
" let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
"
" " Executive used when opening vista sidebar without specifying it.
" " See all the avaliable executives via `:echo g:vista#executives`.
" let g:vista_default_executive = 'coc'
"
" " Declare the command including the executable and options used to generate ctags output
" " for some certain filetypes.The file path will be appened to your custom command.
" " For example:
" let g:vista_ctags_cmd = {
"       \ 'haskell': 'hasktags -o - -c',
"       \ }
"
" " To enable fzf's preview window set g:vista_fzf_preview.
" " The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" " For example:
" let g:vista_fzf_preview = ['right:50%']
"
" " Fall back to other executives if the specified one gives empty data.
" " By default it's all the provided executives excluding the tried one.
" " let g:vista_finder_alternative_executives = ['coc']
"

"
    Plug 'AndrewRadev/splitjoin.vim'
"
    if has('nvim')
            "
        Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
        " if hidden not set, TextEdit might fail.
        set hidden

        " Better display for messages
        set cmdheight=1

        " Smaller updatetime for CursorHold & CursorHoldI
        set updatetime=300

        " always show signcolumns
        set signcolumn=yes
        "
        " Use <c-n> for trigger completion.
        inoremap <silent><expr> <c-n> coc#refresh()

        " Use <cr> for confirm completion.
        " Coc only does snippet and additional edit on confirm.
        inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

        " Use `[c` and `]c` for navigate diagnostics
        nmap <silent> [e <Plug>(coc-diagnostic-prev)
        nmap <silent> ]e <Plug>(coc-diagnostic-next)

        " Remap keys for gotos
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)
        nmap <silent> gh <Plug>(coc-hover)

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
        " autocmd CursorHold * silent call CocActionAsync('highlight')

        " Remap for rename current word
        nmap grn <Plug>(coc-rename)

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

    Plug 'mxw/vim-jsx'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    let $FZF_DEFAULT_COMMAND = 'ag -g ""'
    nnoremap <C-p> :FZF <CR>
    nnoremap <C-f> :Lines <CR>
    nnoremap <C-g> :Ag <CR>
    nnoremap <C-b> :Buffers <CR>

    " Plug 'mkitt/browser-refresh.vim'
    " let g:RefreshRunningBrowserDefault = 'chrome'

    Plug 'othree/javascript-libraries-syntax.vim'
    autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 0
    autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 0
    autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
    autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
    autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

    Plug 'scrooloose/nerdtree'
    nnoremap <c-n> :NERDTreeToggle<CR>
    Plug 'jiangmiao/auto-pairs'
    " "Color
    Plug 'sonph/onehalf', {'rtp': 'vim/'}
    Plug 'joshdick/onedark.vim'
    Plug 'rakr/vim-one'
    let g:one_allow_italics = 1 " I love italic for comments

    "Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

    Plug 'tpope/vim-surround'
    Plug 'tomtom/tcomment_vim' 
    Plug 'alvan/vim-closetag'
    Plug 'othree/html5.vim'
    Plug 'tpope/vim-fugitive'



    filetype plugin indent on                   " required!
call plug#end()
