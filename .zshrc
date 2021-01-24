# aliases
alias be='bundle exec'
alias l='ls -la'
alias g='git'
alias gco='git checkout'

# Prompt customization
datetime="%F{green}%D{%Y-%m-%d} %*"
dir="%F{yellow}%d"
sep="%F{red}\$ %F{clear}"

autoload -Uz vcs_info
precmd () { vcs_info }
setopt prompt_subst
git_branch="%F{blue}\$vcs_info_msg_0_"

export PS1="$datetime $dir $git_branch $sep"

# fzf search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='ag -g ""'

eval "$(rbenv init -)"
