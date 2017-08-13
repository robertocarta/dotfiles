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
Plug 'kien/ctrlp.vim'
" Autocomplete for python
"Plug 'davidhalter/jedi-vim'
" (Optional) Completion integration with deoplete.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

Plug 'neomake/neomake'

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


Plug 'tpope/vim-surround'
"Comment easily with gcc"
Plug 'tomtom/tcomment_vim' 


"Neovim plugins




" (Optional) Multi-entry selection UI.
Plug 'Shougo/denite.nvim'

" (Optional) Showing function signature and inline doc.
Plug 'Shougo/echodoc.vim'
Plug 'HiPhish/repl.nvim'
let g:repl={}
let g:repl['python'] = {
    \'binary': 'jupyter console',
    \ 'args': [],
    \ 'syntax': '',
    \ 'title': 'Jupyter'
    \ }

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
autocmd! BufWritePost * Neomake
let g:neomake_python_pylint_maker = {
    \ 'args': ['--errors-only'],
    \ }
let g:neomake_python_enable_makers = ['pylint']
let g:neomake_ft_maker_remove_invalid_entries = 1


"""""""airline
"let g:airline#extensions#tabline#enabled = 0
let g:AirlineTheme = 'gruvbox'



