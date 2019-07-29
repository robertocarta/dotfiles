set -o vi
alias vi=nvim

export PYTHONPATH="/Users/robertocarta/spark/latest/python"
export PYSPARK_PYTHON=/usr/local/bin/python2
# alias python=/usr/local/bin/python2


alias ipython='ipython --TerminalInteractiveShell.editing_mode=vi'
alias ipython2='ipython2 --TerminalInteractiveShell.editing_mode=vi'
alias ipython3='ipython3 --TerminalInteractiveShell.editing_mode=vi'

export PAGER=less


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PSQL_EDITOR="nvim"


alias venv=activate_env

export EDITOR="nvim"

source ~/.fzf.bash

activate_env() {
	source $1/bin/activate
}
alias venv=activate_env

alias gs="git status"
alias gss="git status -s"
alias gsuno="git status -uno"
alias gssuno="git status -suno"
alias gpl="git pull"
alias gps="git push"
alias reloadrc="source ~/.bash_profile"
alias td="nvim ~/.todos.md"
alias scratch="nvim ~/.scratch.md"

if [ -f ~/.bash_tvsquaredrc ]; then
    source ~/.bash_tvsquaredrc
fi

source ~/dotfiles/bash_better_defaults
source ~/dotfiles/git-completion.bash


export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

brew_install() {
    HOMEBREW_NO_AUTO_UPDATE=1 brew install $@
}


