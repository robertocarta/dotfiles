to make things work:

pip install neovim (in both py2 and py3)
pip install pylint
pip install flake8
pip3 install --user neovim jedi mistune psutil setproctitle
pip2 install --user neovim jedi mistune psutil setproctitle

symlinks from vim to nvim



deoplete requires neovim with py3, check
:echo has("python3")
