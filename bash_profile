# Extend memory of history
shopt -s histappend
HISTSIZE=999999999
HISTFILESIZE=999999999

# Setting locale
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export CLICOLOR=1

# Git
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[31m\]\$(parse_git_branch)\[\033[00m\] $ "

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
    __git_complete gco _git_checkout
    __git_complete grb _git_rebase
fi

# Load RVM into a shell session
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
