if [[ $(ps -o cmd= `ps -p $$ -o ppid=`) =~ "emacs" ]]; then
    in_emacs="true"
fi

export TERM=xterm-256color
export PAGER=less

# limit {{{
ulimit -m 8192000
# ulimit -v 8192000
# }}}

DISABLE_AUTO_TITLE="true" # Prevent printing of command

plugins=(zsh-autosuggestions zsh-syntax-highlighting) # zsh-syntax-highlighting must be the last in the list

# # powerlevel9k {{{
# POWERLEVEL9K_MODE='nerdfont-complete'
# ZSH_THEME="powerlevel9k/powerlevel9k"

# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(newline status dir vcs background_jobs newline custom_prompt_symbol)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="\n"


# BACKGROUND='clear'

# # note: get_icon_names -> print p9k icons

# # separators {{{
# POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
# POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
# POWERLEVEL9K_LEFT_SEGMENT_END_SEPARATOR=''
# POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
# POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''
# POWERLEVEL9K_RIGHT_SEGMENT_END_SEPARATOR=''
# # }}}

# # status_ok {{{
# POWERLEVEL9K_STATUS_CROSS=false
# POWERLEVEL9K_STATUS_OK=false
# POWERLEVEL9K_STATUS_SHOW_PIPESTATUS=false
# POWERLEVEL9K_HIDE_SIGNAME=true

# POWERLEVEL9K_STATUS_ERROR_FOREGROUND='001'

# POWERLEVEL9K_STATUS_ERROR_BACKGROUND=$BACKGROUND
# POWERLEVEL9K_STATUS_OK_BACKGROUND=$BACKGROUND
# # }}}

# # virtualenv {{{
# POWERLEVEL9K_PYTHON_ICON=''
# POWERLEVEL9K_VIRTUALENV_FOREGROUND='166'
# POWERLEVEL9K_VIRTUALENV_BACKGROUND='256'
# # }}}

# # dir {{{
# POWERLEVEL9K_HOME_ICON=''
# POWERLEVEL9K_HOME_SUB_ICON=''
# POWERLEVEL9K_FOLDER_ICON=''
# POWERLEVEL9K_DIR_PATH_SEPARATOR="/"
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=5
# POWERLEVEL9K_SHORTEN_STRATEGY="None"

# POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='009'
# POWERLEVEL9K_DIR_HOME_FOREGROUND=$POWERLEVEL9K_DIR_DEFAULT_FOREGROUND
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=$POWERLEVEL9K_DIR_DEFAULT_FOREGROUND

# POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=$BACKGROUND
# POWERLEVEL9K_DIR_HOME_BACKGROUND=$BACKGROUND
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=$BACKGROUND
# POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND=$BACKGROUND
# # }}}

# # background jobs {{{
# POWERLEVEL9K_BACKGROUND_JOBS_ICON="\b&"
# POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
# POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='003'
# POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=$BACKGROUND
# # }}}

# # vcs {{{
# POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind git-stash git-remotebranch git-tagname)

# POWERLEVEL9K_VCS_GIT_GITHUB_ICON=''
# POWERLEVEL9K_VCS_GIT_BITBUCKET_ICON=''
# POWERLEVEL9K_VCS_GIT_ICON=''
# POWERLEVEL9K_VCS_BRANCH_ICON="\b"
# POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='↓ '
# POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='↑ '
# POWERLEVEL9K_VCS_STAGED_ICON="\b+"
# POWERLEVEL9K_VCS_UNTRACKED_ICON="\b?"
# POWERLEVEL9K_VCS_UNSTAGED_ICON="\b!"
# POWERLEVEL9K_VCS_STASH_ICON="[]"
# POWERLEVEL9K_VCS_TAG_ICON="#"


# POWERLEVEL9K_HIDE_BRANCH_ICON=false

# POWERLEVEL9K_VCS_CLEAN_FOREGROUND='002'
# POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='064'
# POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='004'

# POWERLEVEL9K_VCS_CLEAN_BACKGROUND=$BACKGROUND
# POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=$BACKGROUND
# POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=$BACKGROUND
# # }}}

# # # vi-mode {{{
# # if [[ "$(whoami)" != "root" ]]; then
# #     POWERLEVEL9K_VI_INSERT_MODE_STRING="->"
# #     POWERLEVEL9K_VI_COMMAND_MODE_STRING="=>"
# # else
# #     POWERLEVEL9K_VI_INSERT_MODE_STRING="#"
# #     POWERLEVEL9K_VI_COMMAND_MODE_STRING="|#"
# # fi

# # POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='005'
# # POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='005'

# # POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND=$BACKGROUND
# # POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND=$BACKGROUND

# # # }}}

# # custom_end {{{
# POWERLEVEL9K_CUSTOM_PROMPT_SYMBOL='if [[ "$(id -u)" != "0" ]]; then echo "->"; else echo "#"; fi'
# # POWERLEVEL9K_CUSTOM_PROMPT_SYMBOL='echo "->"'
# POWERLEVEL9K_CUSTOM_PROMPT_SYMBOL_FOREGROUND='005'
# POWERLEVEL9K_CUSTOM_PROMPT_SYMBOL_BACKGROUND=$BACKGROUND
# # }}}

# # # }}}


# theme {{{
if [ -z "$in_emacs" ]; then
    ZSH_THEME="bubblified" # 'bubble' characters don't look good in vterm
else
    ZSH_THEME="avit"
fi
# }}}

# # misc {{{
# HIST_STAMPS="dd/mm/yyyy"
DISABLE_AUTO_UPDATE=false
DISABLE_UPDATE_PROMPT=false

if [[ -n $SSH_CONNECTION ]]; then
    export PATH=$PATH:/home/$(whoami)/bin:/bin:/usr/bin
fi

setopt interactivecomments
setopt CORRECT
setopt hist_ignore_space
# # }}}

# # zsh autosuggestions {{{
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=237"
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=50
bindkey '^ ' autosuggest-accept # ctrl-space = complete current suggestion
# # }}}


source $ZSH/oh-my-zsh.sh

# misc aliases {{{
alias kbfix="setxkbmap -option ctrl:swapcaps; xset r rate 200 30"
alias c="clear"
alias lh="ls -lh"
alias objdump="objdump -M intel --no-show-raw-insn"
alias rot13='tr a-mA-Mn-zN-Z n-zN-Za-mA-M'
alias public_ip='curl http://icanhazip.com'
alias nautilus='nautilus --no-desktop'
alias dict='sdcv --color'
alias -g nope='&> /dev/null &!'
alias l="ls -lAh"
alias tree='tree -I .git -I __pycache__'
alias clock='peaclock'
alias ls='ls --color=always'
alias grep='grep --color=always --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias v='vim'
alias xclip='xclip -selection clipboard'
alias mic-test='arecord -vvv -f dat /dev/null'
alias idea="_JAVA_AWT_WM_NONREPARENTING=1 /usr/bin/idea"
alias '[k'="fc -e -"
alias r=ranger
alias sudovim="sudo -H nvim -u ~$(whoami)/.config/nvim/init.vim"
# function ec {
#     emacsclient -c $@ &>/dev/null &!
# }
# function ect {
#     if [[ $# -lt 1 ]]; then
#         emacsclient .
#     else
#         emacsclient $@
#     fi
# }
function ppid () {
    # get ppid of current process if called without arguments,
    # of argument pid if called with
    ps -p ${1:-$$} -o ppid=;
}
function open() {
    xdg-open $* &> /dev/null &!
}
function ord() {
    LC_TYPE=C printf '%x' "'$1'"
}
function za {
    /usr/bin/zathura --fork $@
}
function ev {
    /usr/bin/evince $@ &>/dev/null &!
}
function mu {
    /usr/bin/mupdf $@ &>/dev/null &!
}
function e {
    /usr/bin/emacs $@
}
function enw {
    /usr/bin/emacs -nw $@
}
function et {
    /usr/bin/emacs -nw $@
}
alias vim='nvim'
alias todo='$EDITOR ~/tmp/todo.org'
alias sbcl='sbcl --noinform'
alias doc='zeal nope'
function mkcd {
    /bin/mkdir -p $@ 2>/dev/null
    cd $@
}
alias ghci="ghci -v0"
alias sml='smlnj'
function bright {
    sudo /usr/bin/brightnessctl set $@
}
alias vimdiff="nvim -d"
# }}}

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
function yay! {
    yay "$@" --noconfirm
}

function gnatrun {
    gnatmake "$1" -D /tmp && ./"$1"
}

# }}}

# vim binds {{{
bindkey -v
export KEYTIMEOUT=1
# }}}

# fzf {{{
# export FZF_DEFAULT_COMMAND='cd'
# export FZF_COMPLETION_TRIGGER='.'
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }}}

function zle-keymap-select zle-line-init zle-line-finish {
    if [ $KEYMAP = vicmd ]; then
        # the command mode for vi
        echo -ne "\e[2 q"
    else
        # the insert mode for vi
        echo -ne "\e[5 q"
    fi
}

# opam configuration
test -r /home/disconsis/.opam/opam-init/init.zsh && . /home/disconsis/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# colors cripts
export PATH=$PATH:~/bin/color-scripts

if [ -n "$in_emacs" ]; then
    # emacs vterm config
    set -o emacs
    ZSH_THEME="agnoster"
fi

# vim: fdm=marker
