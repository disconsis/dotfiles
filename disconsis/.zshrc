# exports {{{
export TERM=xterm-256color-italic-tc
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
export PATH=$PATH:$HOME/ctftools
export PATH=$PATH:$HOME/.cabal/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/tools/bin
export MAIL=/var/spool/mail/ketan
export FZF_DEFAULT_COMMAND='rg --files'
# }}}

# limit {{{
ulimit -m 8192000
ulimit -v 8192000
# }}}

# powerlevel9k {{{
POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel9k/powerlevel9k"
DISABLE_AUTO_TITLE="true" # Prevent printing of command

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(newline status dir vcs virtualenv background_jobs newline vi_mode)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="\n"

# plugins {{{
plugins=(zsh-autosuggestions colored-man-pages zsh-syntax-highlighting) # zsh-syntax-highlighting must be the last in the list
# }}}

BACKGROUND='clear'

# note: get_icon_names -> print p9k icons


# separators {{{
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SEGMENT_END_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_END_SEPARATOR=''
# }}}

# status_ok {{{
POWERLEVEL9K_STATUS_CROSS=false
POWERLEVEL9K_STATUS_OK=false
POWERLEVEL9K_STATUS_SHOW_PIPESTATUS=false
POWERLEVEL9K_HIDE_SIGNAME=true

POWERLEVEL9K_STATUS_ERROR_FOREGROUND='010'

POWERLEVEL9K_STATUS_ERROR_BACKGROUND=$BACKGROUND
POWERLEVEL9K_STATUS_OK_BACKGROUND=$BACKGROUND
# }}}

# virtualenv {{{
POWERLEVEL9K_PYTHON_ICON=''
POWERLEVEL9K_VIRTUALENV_FOREGROUND='166'
POWERLEVEL9K_VIRTUALENV_BACKGROUND='256'
# }}}

# dir {{{
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_DIR_PATH_SEPARATOR="/"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=5
POWERLEVEL9K_SHORTEN_STRATEGY="None"

POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='009'
POWERLEVEL9K_DIR_HOME_FOREGROUND=$POWERLEVEL9K_DIR_DEFAULT_FOREGROUND
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=$POWERLEVEL9K_DIR_DEFAULT_FOREGROUND

POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=$BACKGROUND
POWERLEVEL9K_DIR_HOME_BACKGROUND=$BACKGROUND
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=$BACKGROUND
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND=$BACKGROUND
# }}}

# background jobs {{{
POWERLEVEL9K_BACKGROUND_JOBS_ICON="\b&"
POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='003'
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=$BACKGROUND
# }}}

# vcs {{{
POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind git-stash git-remotebranch git-tagname)

POWERLEVEL9K_VCS_GIT_GITHUB_ICON=''
POWERLEVEL9K_VCS_GIT_BITBUCKET_ICON=''
POWERLEVEL9K_VCS_GIT_ICON=''
POWERLEVEL9K_VCS_BRANCH_ICON="\b"
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='∇ '
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='∆ '
POWERLEVEL9K_VCS_STAGED_ICON="\b+"
POWERLEVEL9K_VCS_UNTRACKED_ICON="\b?"
POWERLEVEL9K_VCS_UNSTAGED_ICON="\b!"
POWERLEVEL9K_VCS_STASH_ICON="[]"
POWERLEVEL9K_VCS_TAG_ICON="#"


POWERLEVEL9K_HIDE_BRANCH_ICON=false

POWERLEVEL9K_VCS_CLEAN_FOREGROUND='003'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='003'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='003'

POWERLEVEL9K_VCS_CLEAN_BACKGROUND=$BACKGROUND
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=$BACKGROUND
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=$BACKGROUND
# }}}

# vi-mode {{{
if [[ "$(whoami)" != "root" ]]; then
    POWERLEVEL9K_VI_INSERT_MODE_STRING=">"
    POWERLEVEL9K_VI_COMMAND_MODE_STRING="»"
else
    POWERLEVEL9K_VI_INSERT_MODE_STRING="#"
    POWERLEVEL9K_VI_COMMAND_MODE_STRING="#!"
fi

POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='005'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='005'

POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND=$BACKGROUND
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND=$BACKGROUND

# fix vi_mode {{{
function zle-line-init {
  powerlevel9k_prepare_prompts
  if (( ${+terminfo[smkx]} )); then
    printf '%s' ${terminfo[smkx]}
  fi
  zle reset-prompt
  zle -R
}

function zle-line-finish {
  vim_mode="INS"
  powerlevel9k_prepare_prompts
  if (( ${+terminfo[rmkx]} )); then
    printf '%s' ${terminfo[rmkx]}
  fi
  zle reset-prompt
  zle -R
}

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/CMD}/(main|viins)/INS}"
  powerlevel9k_prepare_prompts
  zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
# }}}

# }}}

# }}}

# misc {{{
HIST_STAMPS="dd/mm/yyyy"
DISABLE_AUTO_UPDATE=false
DISABLE_UPDATE_PROMPT=false
[ -e ~/.dircolors ] && eval $(dircolors -b ~/.dircolors) || eval $(dircolors -b)

# if [[ -r /usr/share/powerline/bindings/zsh/powerline.zsh ]]; then
#   source /usr/share/powerline/bindings/zsh/powerline.zsh
# fi

source $ZSH/oh-my-zsh.sh
if [[ -n $SSH_CONNECTION ]]; then
    export PATH=$PATH:/home/ketan/bin:/bin:/usr/bin
fi

setopt interactivecomments
setopt CORRECT
# }}}

# # pure prompt {{{
# autoload -Uz promptinit; promptinit
# if [[ "$(whoami)" != "root" ]]; then
#     # PURE_PROMPT_SYMBOL="  "
#     # PURE_PROMPT_SYMBOL=""
#     # PURE_PROMPT_SYMBOL="  "
#     # PURE_PROMPT_SYMBOL="  "
#     # PURE_PROMPT_SYMBOL=" >"
#     PURE_PROMPT_SYMBOL=" »"
# else
#     PURE_PROMPT_SYMBOL=" #"
#     # PURE_PROMPT_SYMBOL="  "
# fi
# prompt pure
# # }}}

# vim binds {{{
bindkey -v
export KEYTIMEOUT=1
# setxkbmap -option ctrl:swapcaps
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
function e {
    /usr/bin/emacs -nw $@
}
alias vim='nvim'
alias feh='/usr/bin/feh -B black -.'
alias todo='$EDITOR ~/tmp/todo.wiki'
alias sbcl='sbcl --noinform'
alias doc='zeal nope'
function mkcd {
    /bin/mkdir $@ 2>/dev/null
    cd $@
}
# }}}

# help {{{
# autoload -Uz run-help
# alias help=run-help
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
# eval "$(fasd --init auto)"
# }}}

# ncmpcpp {{{
function mus {
    ! pidof /usr/bin/mpd > /dev/null && mpd
    /usr/bin/ncmpcpp "$@"
}
# }}}

# print-todo {{{
# if [ -e "$HOME/tmp/todo.wiki" ]; then
#     cat "$HOME/tmp/todo.wiki" | rg '^- \[ \]'
# fi
# # }}}

# fzf {{{
# export FZF_DEFAULT_COMMAND='cd'
export FZF_COMPLETION_TRIGGER='.'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }}}

# vim: fdm=marker
