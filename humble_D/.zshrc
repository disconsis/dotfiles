# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/humble/.oh-my-zsh

# ----------------------------------------------------plugin based custom code--------------------------------------------------

# Set name of the theme to load
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='awesome-fontconfig'

# powerlevel9k settings
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv background_jobs context)

# powerlevel context settings
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT="true"
POWERLEVEL9K_CONTEXT_TEMPLATE=" %n@%m"

# powerlevel dir settings
# icons
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_DIR_PATH_SEPARATOR='/'

# path shortening
POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER="false"
# color
POWERLEVEL9K_DIR_HOME_BACKGROUND='082'
POWERLEVEL9K_DIR_HOME_FOREGROUND='235'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='039'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='235'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='214'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='235'

# vcs icon settings
# icons
VCS_GIT_GITHUB_ICON=""
VCS_GIT_BITBUCKET_ICON=""

# context settings
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='011'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='016'

# powerlevel newline settings
POWERLEVEL9K_PROMPT_ON_NEWLINE="true"
POWERLEVEL9K_RPROMPT_ON_NEWLINE='true'
POWERLEVEL9K_PROMPT_ADD_NEWLINE='false'

# multiline prefixes and suffixes
#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "

#-------------------------------------------------------------------------------------------------------------------------------

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=15

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time shown in history
HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(history last-working-dir npm pip python command-not-found dirhistory encode64 gitfast yarn wd)

# source plugin
source $ZSH/oh-my-zsh.sh

# ----------------------------------------------------plugin based custom code--------------------------------------------------
#export ZSH_TMUX_AUTOSTART=true
#export ZSH_TMUX_AUTOCONNECT=true
#export ZSH_TMUX_AUTOQUIT=true
#-------------------------------------------------------------------------------------------------------------------------------

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# loading nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# added by Anaconda2 installer
# export PATH="/home/humble/anaconda2/bin:$PATH"

# mozilla configuration file
# export MOZCONFIG=~/Projects/collaboration/Firefox_src/mozilla-unified/mozconfig
