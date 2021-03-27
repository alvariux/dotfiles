#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

if [ -f /usr/bin/neofetch ]
then
        neofetch
fi

export PATH="$PATH:$HOME/.config/composer/vendor/bin"

#Virtualenvs
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

export RANGER_LOAD_DEFAULT_RC=FALSE

#alias
#alias vim="nvim"

#powerline
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/share/powerline/bindings/bash/powerline.sh
