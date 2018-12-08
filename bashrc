
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/opt/local/bin:$PATH
export PATH=/opt/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH

DEBEMAIL=freshtonic@gmail.com
DEBFULLNAME="James Sadler"
export DEBEMAIL DEBFULLNAME

export EDITOR=$(which nvim || which vim)
alias vi=$(which nvim || which vim)
alias vim=$(which nvim || which vim)

if [ `uname` == "Darwin" ]; then
    export PATH=$PATH:/Applications/GitX.app/Contents/Resources
    # The following fixes iTerm issues.
    # unix2003 is the default in Terminal.app but not in iTerm it seems.
    export COMMAND_MODE=unix2003
    export PATH=$PATH:/Applications/p4merge.app/Contents/MacOS

    NAME="Solarized Dark";
    echo -ne "\033]50;SetProfile=$NAME\a"
fi

set -o vi

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

export GIT_PS1_SHOWSTASHSTATE=yes
export GIT_PS1_SHOWUNTRACKEDFILES=yes
export GIT_PS1_SHOWUPSTREAM=verbose
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi


function _update_ps1()
{
   export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)")\nλ '
}

export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"; _update_ps1'

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

if [ -e ~/.keychain/$HOSTNAME-sh ]; then source ~/.keychain/$HOSTNAME-sh; fi

alias be='bundle exec'
alias bi='bundle install'
alias tmux='TERM=screen-256color-bce tmux'

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# Elixir/Phoenix Aliases
alias mh="mix help"
alias mps="mix phx.server"
alias mt="mix test"
alias mdg="mix deps.get"
alias mdu="mix deps.update"
alias mc="mix compile"
alias megm="mix ecto.gen.migration"
alias med="mix ecto.drop"
alias mec="mix ecto.create"
alias mes="mix ecto.setup"
alias mem="mix ecto.migrate"
alias mer="mix ecto.rollback"
alias mpr="mix phx.routes"
alias im="iex -S mix"

source $HOME/.cargo/env

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export ERL_AFLAGS="-kernel shell_history enabled"

# Enable the fuxxy finder keybindings
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FZF_DEFAULT_OPTS="-m --reverse --inline-info"
export FZF_DEFAULT_COMMAND='fd --type f'

# Installed via Homebrew
export GROOVY_HOME=/usr/local/opt/groovy/libexec

export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools
export PATH="$(yarn global bin):$PATH"

# Tail postgres logs (Mac only)
alias plog="tail -F /usr/local/var/log/postgres.log"

export GNUPGHOME="${ASDF_DIR:-$HOME/.asdf}/keyrings/nodejs" && mkdir -p "$GNUPGHOME" && chmod 0700 "$GNUPGHOME"

