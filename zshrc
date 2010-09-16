# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(ruby rails git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#

#HISTFILE=~/.histfile
#HISTSIZE=2048
#SAVEHIST=2048
#
#zle_highlight=(none)
#
#setopt nocheckjobs
#setopt nohup
#
#setopt nobeep
#setopt extended_glob
#setopt multios
#
#KEYTIMEOUT=1
#
#bindkey -rpM viins '\e'
#bindkey -v
#
#autoload -U compinit
#compinit
#
#setopt prompt_subst
#autoload -Uz vcs_info
#
#zstyle ':vcs_info:*' formats ' [%b]'
#zstyle ':vcs_info:*' actionformats ' [%b|%F{1}%a%f]'
#zstyle ':vcs_info:*' enable git
#
#precmd () { vcs_info }
#PROMPT='%m:%/${vcs_info_msg_0_} '
#
#DEBEMAIL=freshtonic@gmail.com
#DEBFULLNAME="James Sadler"
#export DEBEMAIL DEBFULLNAME
#export EDITOR=$(which vim)
#
##if [ `uname` == "Darwin" ]; then
##    export PATH=$PATH:/Applications/GitX.app/Contents/Resources/
##    # The following fixes iTerm issues.
##    # unix2003 is the default in Terminal.app but not in iTerm it seems.
##    export COMMAND_MODE=unix2003
##fi
#
## Make sure additional SSH keys will be tried when making SSH connections
##for key in $(cd ~/.ssh && ls | grep id_ | grep -v \\.pub$ ); do
##    keychain --quiet $key
##done
##
##source ~/.keychain/$HOSTNAME-sh
##
##if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi
#
