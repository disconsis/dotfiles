# exports {{{
export TERM=screen-256color
export TERMINAL=st
export ZSH=$HOME/.oh-my-zsh
export PYTHONSTARTUP=$HOME/.pythonrc
export ARCHFLAGS="-arch x86_64"
export EDITOR='nvim'
export XDG_CONFIG_HOME=$HOME/.config
export PROJECT_HOME=$HOME/.git
export WORKON_HOME=$HOME/.virtualenvs
export ANDROID_HOME=$HOME/Android/Sdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
export PATH=$PATH:$HOME/.cabal/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/tools/bin
export MAIL=/var/spool/mail/ketan
# }}}

# pure-prompt {{{
fpath+=('/usr/local/lib/node_modules/pure-prompt/functions')
autoload -U promptinit
promptinit
prompt pure
# }}}

# vim binds {{{
bindkey -v
export KEYTIMEOUT=1
setxkbmap -option ctrl:swapcaps
# }}}

# misc aliases {{{
alias kbfix="setxkbmap -option ctrl:swapcaps"
alias c="clear"
alias lh="ls -lh"
alias objdump="objdump -M intel --no-show-raw-insn"
alias rot13='tr a-mA-Mn-zN-Z n-zN-Za-mA-M'
alias public_ip='curl http://icanhazip.com'
alias nautilus='nautilus --no-desktop'
alias dict='sdcv --color'
alias -g nope='&> /dev/null &!'
alias eog='pqiv -i'
alias l="ls -lAh"
alias open='xdg-open'
alias speed='speedometer'
alias mux='tmuxinator'
alias tree='tree -I .git -I __pycache__'
alias clock='tty-clock -ctB'
alias skype='skypeforlinux'
alias ls='ls --color=always'
alias grep='grep --color=always --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias ack='ack --color'
alias v='vim'
function za {
    /usr/bin/zathura $@ &>/dev/null &!
}
alias q='qutebrowser &>/dev/null &!'
function okular {
    export $(dbus-launch)
    /usr/bin/okular $@ &>/dev/null &!
}
function e {
    /usr/bin/emacs -nw $@
}
alias vim='nvim'
alias feh='/usr/bin/feh -B black -.'
alias todo='$EDITOR ~/tmp/todo.wiki'
alias sbcl='sbcl --noinform'
alias doc='zeal nope'
# }}}

# help {{{
autoload -Uz run-help
alias help=run-help
# }}}


# dasht {{{
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin:$HOME/.git/dasht/bin"
export MANPATH="$HOME/.git/dasht/man:$MANPATH"
# }}}

# virtualenvwrapper {{{
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_SCRIPT=$(which virtualenvwrapper.sh)
source virtualenvwrapper.sh
# }}}

# # FIXME: project venv {{{
# function set_project_venv {
#     chdir "$@"
#     if [[ `pwd | cut -d / -f 1-5` == '/home/ketan/.git/superlists' ]]
#     then
#         workon superlists
#     else
#         deactivate >& /dev/null
#         true
#     fi
# }
# alias cd=set_project_venv
# # }}}

# beep {{{
function beep {
    if [[ $# > 1 ]]
    then
        duration=$1
    else
        duration=0.5
    fi
    speaker-test -t sine -f 1000 &>/dev/null &!
    sleep $duration
    pkill -9 speaker-test
}
# }}}

# fasd {{{
eval "$(fasd --init auto)"
# }}}

# ncmpcpp {{{
function mus {
    ! pidof /usr/bin/mpd > /dev/null && mpd
    /usr/bin/ncmpcpp "$@"
}
# }}}

# print-todo {{{
if [ -e "$HOME/tmp/todo.wiki" ]; then
    cat "$HOME/tmp/todo.wiki" | sort | lolcat
fi
# }}}

# vim: fdm=marker
