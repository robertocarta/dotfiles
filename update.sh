cp ~/dotfiles/vimrc ~/.vimrc

cp ~/dotfiles/inputrc ~/.inputrc
cp ~/dotfiles/bash_profile ~/.bash_profile
cp ~/dotfiles/pylintrc ~/.pylintrc

cp ~/dotfiles/init.vim ~/.config/nvim/init.vim

pip3 install -r requirements.txt
pip install -r requirements.txt


nvim -c "PlugClean"
nvim -c "PlugInstall"
echo "Done."

