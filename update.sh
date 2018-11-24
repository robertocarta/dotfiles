cp ~/dotfiles/vimrc ~/.vimrc

cp ~/dotfiles/inputrc ~/.inputrc
cp ~/dotfiles/bash_profile ~/.bash_profile
cp ~/dotfiles/pylintrc ~/.pylintrc

cp ~/dotfiles/init.vim ~/.config/nvim/init.vim

pip3 install -r requirements.txt
# pip2 install -r requirements.txt

cp ./InconsolataLGC/* ~/Library/Fonts

nvim -c "PlugClean"
nvim -c "PlugInstall"
nvim -c "CocInstall coc-pyls"
nvim -c "CocInstall coc-tsserver"
echo "Done."

