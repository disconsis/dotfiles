export TERM=screen-256color
export TERMINAL=urxvt
# export ZSH=/home/ketan/.oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
export PYTHONSTARTUP=$HOME/.pythonrc

POWERLEVEL9K_MODE='nerdfont-complete'

ZSH_THEME="powerlevel9k/powerlevel9k"
# COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd/mm/yyyy"
plugins=(zsh-autosuggestions colored-man-pages)
source $ZSH/oh-my-zsh.sh
[ -e ~/.dircolors ] && eval $(dircolors -b ~/.dircolors) || eval $(dircolors -b)

export EDITOR='vim'
if [[ -n $SSH_CONNECTION ]]; then
    export PATH=/home/ketan/bin
fi

export ARCHFLAGS="-arch x86_64"

setopt interactivecomments
setopt CORRECT

# autoload -Uz compinit
# compinit POWERLEVEL9K_MODE='default'

zsh_file_count(){
    local signal=$(ls -A1 | wc -l)
    local color='%F{052}'                                                        # $colour1$
    [[ $signal -eq 0 ]] && color='%F{001}'                                       # $colour2$
    echo -n "%{$color%}$signal%{%f%}"
}

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir custom_file_count dir_writable vcs newline vi_mode)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(custom_alarming background_jobs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=false
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="\n"
POWERLEVEL9K_CUSTOM_FILE_COUNT="zsh_file_count"
POWERLEVEL9K_DIR_PATH_SEPARATOR=" "$'\uE0B1'" "
POWERLEVEL9K_SHORTEN_DIR_LENGTH=5
POWERLEVEL9K_SHORTEN_STRATEGY="None"
POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=true

POWERLEVEL9K_STATUS_ERROR_BACKGROUND='124'                                       # $colour3$
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='255'                                       # $colour4$
POWERLEVEL9K_STATUS_OK_BACKGROUND='220'                                          # $colour3$
POWERLEVEL9K_STATUS_OK_FOREGROUND='052'                                          # $colour4$

POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='214'                                        # $colour5$
POWERLEVEL9K_DIR_HOME_BACKGROUND='214'                                           # $colour5$
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='214'                                 # $colour5$
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='052'                                        # $colour6$
POWERLEVEL9K_DIR_HOME_FOREGROUND='052'                                           # $colour6$
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='052'                                 # $colour6$

POWERLEVEL9K_VCS_CLEAN_BACKGROUND='118'                                          # $colour7$
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='093'                                      # $colour8$
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='039'                                       # $colour9$
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='016'                                          # $colour10$
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='016'                                      # $colour10$
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='016'                                       # $colour10$

POWERLEVEL9K_CUSTOM_FILE_COUNT_BACKGROUND='208'                                  # $colour11$

POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND='202'                             # $colour12$
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND='016'                             # $colour13$

POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='027'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='255'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='082'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='232'
POWERLEVEL9K_VI_INSERT_MODE_STRING='' #'»'
POWERLEVEL9K_VI_COMMAND_MODE_STRING='' #'«'

POWERLEVEL9K_CUSTOM_TASKWARRIOR="python3 $HOME/p9k_scripts/pltask.py  124 255"
POWERLEVEL9K_CUSTOM_TASKWARRIOR_BACKGROUND='234'

POWERLEVEL9K_CUSTOM_ALARMING="$HOME/p9k_scripts/alarming.sh 124 255"
POWERLEVEL9K_CUSTOM_ALARMING_BACKGROUND='234'

POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='234'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=238'

local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
  user_symbol = "#"
fi

if [[ -r /usr/share/powerline/bindings/zsh/powerline.zsh ]]; then
  source /usr/share/powerline/bindings/zsh/powerline.zsh
fi

bindkey -v
export KEYTIMEOUT=1
setxkbmap -option ctrl:swapcaps
# Prevent printing of command
DISABLE_AUTO_TITLE="true"

# export PATH=$PATH:$HOME/Android/Sdk/tools:$HOME/Android/Sdk/platform-tools:$HOME/Android/Sdk/tools/bin
alias kbfix="setxkbmap -option ctrl:swapcaps"
alias c="clear"
alias lh="ls -lh"
alias objdump="objdump -M intel --no-show-raw-insn"
alias rot13='tr a-mA-Mn-zN-Z n-zN-Za-mA-M'
alias public_ip='curl http://icanhazip.com'
alias nautilus='nautilus --no-desktop'
alias dict='sdcv'
alias -g nope='&> /dev/null &!'
alias eog='pqiv -i'
alias l="ls -lAh"
alias open='xdg-open'
alias speed='speedometer'
alias mux='tmuxinator'

# help
autoload -Uz run-help
alias help=run-help

#### fix vi_mode
function zle-line-init {
  powerlevel9k_prepare_prompts
  if (( ${+terminfo[smkx]} )); then
    printf '%s' ${terminfo[smkx]}
  fi
  zle reset-prompt
  zle -R
}

function zle-line-finish {
  powerlevel9k_prepare_prompts
  if (( ${+terminfo[rmkx]} )); then
    printf '%s' ${terminfo[rmkx]}
  fi
  zle reset-prompt
  zle -R
}

function zle-keymap-select {
  powerlevel9k_prepare_prompts
  zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
#### end: fix vi_mode

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# (wal -R -t 1>/dev/null 2>&1)
export XDG_CONFIG_HOME=$HOME/.config
