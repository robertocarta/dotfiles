to make things work:

pip install neovim (in both py2 and py3)
pip install pylint
pip install flake8
<<<<<<< HEAD
pip install jedi
pip(2,3) install jupyter
=======
pip3 install --user neovim jedi mistune psutil setproctitle
pip2 install --user neovim jedi mistune psutil setproctitle
>>>>>>> 1363fbf6053cd76b1e893f408d4ee6c84c5f8924

symlinks from vim to nvim



deoplete requires neovim with py3, check
:echo has("python3")
