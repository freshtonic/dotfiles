# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
# Store up to 5000 entries in history
export HISTSIZE=5000

# fucking macos catalina
export BASH_SILENCE_DEPRECATION_WARNING=1

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/opt/local/bin:$PATH
export PATH=/opt/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export GOROOT=/usr/local/go
export PATH=$GOROOT/bin:$PATH

export HOMEBREW_NO_AUTO_UPDATE=1 

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

export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export GIT_PS1_SHOWSTASHSTATE=yes
export GIT_PS1_SHOWUNTRACKEDFILES=yes
export GIT_PS1_SHOWUPSTREAM=verbose



function _update_ps1() {
    export PS1="$(powerline-go -newline -error $? -jobs $(jobs -p | wc -l))"

    # Uncomment the following line to automatically clear errors after showing
    # them once. This not only clears the error for powerline-go, but also for
    # everything else you run in that shell. Don't enable this if you're not
    # sure this is what you want.

    #set "?"
}

# export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"; _update_ps1'
export PROMPT_COMMAND='_update_ps1'

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

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

# Tail postgres logs (Mac only)
# alias plog="tail -F /usr/local/var/log/postgres.log"

# export GNUPGHOME="${ASDF_DIR:-$HOME/.asdf}/keyrings/nodejs" && mkdir -p "$GNUPGHOME" && chmod 0700 "$GNUPGHOME"

# Now when you install Erlang, you'll have helpful docs in
# iex on erlang functions like you do Elixir functions. 
export KERL_BUILD_DOCS="yes"

eval "$(asdf exec direnv hook bash)"

