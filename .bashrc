
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export VISUAL=nvim
export EDITOR="$VISUAL"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="$HOME/.local/bin:$PATH"
if [ -f "$HOME/.alias/main" ]; then
  source "$HOME/.alias/main"
fi
  alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
export PATH="$PATH:$HOME/.local/bin"
export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:/opt/nvim/nvim-linux64/bin"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="$PATH:/opt/nvim-linux64/bin"
