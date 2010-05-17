# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export PATH=$PATH:/var/lib/gems/1.8/bin
export PATH=$PATH:$HOME/.gem/ruby/1.8/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/opt/local/bin
export PATH=$PATH:/opt/bin
export PATH=$PATH:$HOME/bin:/usr/local/bin

export LEXER_DIR=~/lexer

DEBEMAIL=freshtonic@gmail.com
DEBFULLNAME="James Sadler"
export DEBEMAIL DEBFULLNAME

if [ `uname` == "Darwin" ]; then
    export PATH=$PATH:/Applications/GitX.app/Contents/Resources/
    # The following fixes iTerm issues.
    # unix2003 is the default in Terminal.app but not in iTerm it seems.
    export COMMAND_MODE=unix2003

    alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"
    alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
    alias mvim="/Applications/MacVim.app/Contents/MacOS/MacVim"
    export EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim"
fi

# MySQL stuff
export PATH=/opt/local/lib/mysql5/bin:$PATH

set -o vi
export RUBYOPT=rubygems

. ~/.git-completion.bash

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    ;;
esac

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f ~/.git-completion.sh ]; then
    . ~/.git-completion.sh
fi

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)")\$ '

function urlencode {
   echo $1 | perl -MURI::Escape -lne 'print uri_escape($_)'
}

function urldecode {
   echo $1 | perl -MURI::Escape -lne 'print uri_unescape($_)'
}

cgr() {
    cd $(dirname $(__gitdir))
}

gr() {
    dirname $(__gitdir)
}

# Make sure additional SSH keys will be tried when making SSH connections
for key in $(cd ~/.ssh && ls | grep id_ | grep -v \\.pub$ ); do
    keychain --quiet $key
done

source ~/.keychain/$HOSTNAME-sh

if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi

