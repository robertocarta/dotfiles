cp ~/dotfiles/vimrc ~/.vimrc
cp ~/dotfiles/init.vim ~/.config/nvim/init.vim
nvim -c "PlugClean"
nvim -c "PlugInstall"
echo "Done."

