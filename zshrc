HISTFILE=~/.histfile
HISTSIZE=2048
SAVEHIST=2048

zle_highlight=(none)

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
PROMPT='%m:%/${vcs_info_msg_0_} '

# This stuff is from my old bashrc

export PATH=$PATH:/var/lib/gems/1.8/bin
export PATH=$PATH:$HOME/.gem/ruby/1.8/bin
export PATH=$PATH:/usr/sbin
export PATH=/opt/local/bin:$PATH
export PATH=/opt/bin:$PATH
export PATH=$PATH:$HOME/bin:/usr/local/bin

export LEXER_DIR=~/lexer
export ERL_LIBS=~/lexer/riak/apps/riak/ebin

DEBEMAIL=freshtonic@gmail.com
DEBFULLNAME="James Sadler"
export DEBEMAIL DEBFULLNAME

export EDITOR=$(which vim)
alias vi=$(which vim)

if [ `uname` == "Darwin" ]; then
    export PATH=$PATH:/Applications/GitX.app/Contents/Resources/
    # The following fixes iTerm issues.
    # unix2003 is the default in Terminal.app but not in iTerm it seems.
    export COMMAND_MODE=unix2003
fi

# MySQL stuff
export PATH=/opt/local/lib/mysql5/bin:$PATH

set -o vi
export RUBYOPT=rubygems


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"


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

