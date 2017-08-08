"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" background has to be set on terminal as 43-48-59
" """""" Plugin management stuff """""""
"
set nocompatible
filetype plugin indent on

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



let mapleader = ","
let g:mapleader = ","

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Custom plugins...
" Ctrl-P - Fuzzy file search
Plugin 'kien/ctrlp.vim'
" Autocomplete for python
Plugin 'davidhalter/jedi-vim'
"better python syntax highlighting
"Plugin 'hdima/python-syntax'

Plugin 'scrooloose/nerdtree'


Plugin 'Shougo/vimproc'
Plugin 'Shougo/vimshell.vim'

"auto pairs
Plugin 'jiangmiao/auto-pairs'

" status bar mods
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" tab completion
""plugin 'ervandew/supertab'

"nordisk color scheme
Plugin 'kamwitsta/nordisk'
"Nord vim color scheme
Plugin 'arcticicestudio/nord-vim'
"Greygull and seagull colorschemes
Plugin 'nightsense/seabird'


"Color
Plugin 'morhetz/gruvbox'
Plugin 'notpratheek/Pychimp-vim'
Plugin 'AlessandroYorba/Sidonia'
Plugin 'chriskempson/base16-vim'
Plugin 'davidklsn/vim-sialoquent'

Plugin 'neomake/neomake'
autocmd! BufWritePost * Neomake
let g:neomake_python_enable_makers = ['pylint']

Plugin 'tpope/vim-surround'
"Comment easily with gcc"
Plugin 'tomtom/tcomment_vim' 
" after all plugins...
call vundle#end()
filetype plugin indent on

""""""" jedi-vim """""""
" don't mess up undo history
let g:jedi#show_call_signatures = "0"


""""""" supertab configuration """""""
"let g:supertabdefaultcompletiontype = "<c-x><c-u>"
""function! completefunc(findstart, base)
""    return "\<c-x>\<c-p>"
""endfunction

"call supertabchain(completefunc, '<c-n>')

"let g:supertabcompletioncontexts = ['g:contexttext2']


""""""" general coding stuff """""""
" always show status bar
set t_Co=256
set laststatus=2
" let plugins show effects after 500ms, not 4s
""set updatetime=500
set mouse=a
" don't let autocomplete affect usual typing habits
" let vim-gitgutter do its thing on large files
let g:gitgutter_max_signs=10000

" if your terminal's background is white (light theme), uncomment the following
" to make easymotion's cues much easier to read.
" hi link easymotiontarget string
" hi link easymotionshade comment
" hi link easymotiontarget2first string
" hi link easymotiontarget2second statement

""""""" python stuff """""""
syntax enable
set number showmatch
let python_highlight_all = 1
hi Normal ctermbg=NONE

""""""""""""""plugin config 
"""""""airline
""set alternate color for modified active/inactive tabs
let g:airline#extensions#tabline#enabled = 0
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#right_sep = ' '
"let g:airline#extensions#tabline#right_alt_sep = '|'
"let g:airline_left_sep = ' '
"let g:airline_left_alt_sep = '|'
"let g:airline_right_sep = ' '
"let g:airline_right_alt_sep = '|'
"let g:airline_theme= 'molokai'
"let g:airline_right_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_left_alt_sep= ''
"let g:airline_left_sep = ''
"let g:airline_powerline_fonts = 1
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {8T8T8T8T8T8T8T8T8T8T}
"endif
"let g:airline_symbols.space = "\ua0"
let g:AirlineTheme = 'Molokai'
highlight LineNr ctermfg=darkgrey
colorscheme nord
hi Normal ctermbg=none

set background=dark

if has("autocmd")
    au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
    au InsertEnter,InsertChange *
            \ if v:insertmode == 'i' | 
            \   silent execute '!echo -ne "\e[5 q"' | redraw! |
            \ elseif v:insertmode == 'r' |
            \   silent execute '!echo -ne "\e[3 q"' | redraw! |
            \ endif
          au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
  endif


  " bind save to f2
  map <F2> :w! <CR>

  " "
  " "" jedi vim bindings:
  let g:jedi#goto_command = "<leader>d"
  let g:jedi#goto_assignments_command = "<leader>g"
  let g:jedi#goto_definitions_command = ""
  let g:jedi#documentation_command = "K"
  let g:jedi#usages_command = "<leader>n"
  let g:jedi#completions_command = "<C-Space>"
  let g:jedi#rename_command = "<leader>r"

""HTML Editing
set matchpairs+=<:>




" ================ Scrolling ========================

 set scrolloff=8         "Start scrolling when we're 8 lines away from
 set sidescrolloff=15
 set sidescroll=1
 


 " Always use vertical diffs
 set diffopt+=vertical


 "Map Ctrl + S to save in any mode
 noremap <silent> <C-S>          :update<CR>
 vnoremap <silent> <C-S>         <C-C>:update<CR>
 inoremap <silent> <C-S>         <C-O>:update<CR>


set smartindent
set noexpandtab
"set tabstop=4
"set shiftwidth=4

hi Normal ctermbg=NONE

set splitright
set splitbelow
