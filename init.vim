if empty(glob("~/.local/share/nvim/plugged"))
    execute 'ln  ~/.vim/plugged ~/.local/share/nvim/plugged'
endif

source ~/.vimrc



:command Jupyter vs|te jupyter console --ZMQTerminalInteractiveShell.editing_mode=vi

:tnoremap <C-\> <C-\><C-n>


let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = '/usr/local/bin/ipython3'

set undofile

