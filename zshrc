# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
#export ZSH_THEME="robbyrussell"
export ZSH_THEME="josh"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(ruby rails git)

source $ZSH/oh-my-zsh.sh

#
#zle_highlight=(none)
#
setopt nocheckjobs
setopt nohup

setopt nobeep
setopt extended_glob
setopt multios

KEYTIMEOUT=1

bindkey -rpM viins '\e'
bindkey -v

autoload -U compinit
compinit

setopt prompt_subst
autoload -Uz vcs_info

zstyle ':vcs_info:*' formats ' [%b]'
zstyle ':vcs_info:*' actionformats ' [%b|%F{1}%a%f]'
zstyle ':vcs_info:*' enable git

precmd () { vcs_info }

DEBEMAIL=freshtonic@gmail.com
DEBFULLNAME="James Sadler"
export DEBEMAIL DEBFULLNAME
export EDITOR=$(which vim)
alias vi=vim

if [ `uname` = Darwin ]; then
    export PATH=$PATH:/Applications/GitX.app/Contents/Resources/
    # The following fixes iTerm issues.
    # unix2003 is the default in Terminal.app but not in iTerm it seems.
    export COMMAND_MODE=unix2003
fi

# Make sure additional SSH keys will be tried when making SSH connections
for key in $(cd ~/.ssh && ls | grep id_ | grep -v \\.pub$ )
do
    keychain --quiet $key
done

source ~/.keychain/$HOST-sh

if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi
