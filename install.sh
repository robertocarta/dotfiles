ln ~/dotfiles/vimrc ~/.vimrc
mkdir -p ~/.config/nvim
ln ~/dotfiles/init.vim ~/.config/nvim/init.vim
nvim -c PlugInstall
