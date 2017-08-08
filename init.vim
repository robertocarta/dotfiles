if empty(glob("~/.local/share/nvim/plugged"))
    execute 'ln  ~/.vim/plugged ~/.local/share/nvim/plugged'
endif

source ~/.vimrc



:command Ipython vs|te ipython --TerminalInteractiveShell.editing_mode=vi

tnoremap <C-[> <C-\><C-N>

