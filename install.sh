ln ~/dotfiles/vimrc ~/.vimrc
mkdir -p ~/.config/nvim
ln ~/dotfiles/init.vim ~/.config/nvim/init.vim
brew install ripgrep
brew install jq

nvim -c PlugInstall
nvim -c UpdateRemotePlugins

