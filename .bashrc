## PATH
export PATH="$HOME/.config/scripts/:$PATH"
export PATH="$PATH:/home/smierx/.local/bin"
export PATH="$PATH:/usr/local/bin"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

if [ -f ~/phoenix_proxy ]; then
  source ~/phoenix_proxy
fi
## TMUX
PATH="$PATH":"$HOME/.local/scripts/"
bind '"\C-f":"tmux-sessionizer\n"'

## DOTFILES
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'


## GIT
alias gs="git status --short"
alias gd="git diff --ignore-blank-lines --output-indicator-new=' ' --output-indicator-old=' '"
alias ga="git add"
alias gap="git add --patch"
alias gc="git commit"
alias gp="git push"
alias gu="git pull"
alias gl="git log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an %ar%C(auto) %D%n%s%n'"
alias gb="git branch"
alias gi="git init"
alias gcl="git clone"
