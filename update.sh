cp ~/dotfiles/vimrc ~/vimrc
cp ~/dotfiles/init.vim ~/.config/nvim/init.vim
vim -c "PlugClean"
vim -c "PlugInstall"
echo "Done."

