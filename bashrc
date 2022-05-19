# If not running interactively, don't do anything
# [ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
# Store up to 5000 entries in history
export HISTSIZE=5000

# fucking macos catalina
export BASH_SILENCE_DEPRECATION_WARNING=1

export PATH=/opt/homebrew/bin:$PATH

export HOMEBREW_NO_AUTO_UPDATE=1 

export EDITOR=$(which nvim || which vim)
alias vi=$(which nvim || which vim)
alias vim=$(which nvim || which vim)

if [ `uname` == "Darwin" ]; then
    # The following fixes iTerm issues.
    # unix2003 is the default in Terminal.app but not in iTerm it seems.
    export COMMAND_MODE=unix2003
fi

set -o vi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# shopt -s checkwinsize

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

function _update_ps1() {
    export PS1="$(powerline-go -newline -error $? -jobs $(jobs -p | wc -l))"

    # Uncomment the following line to automatically clear errors after showing
    # them once. This not only clears the error for powerline-go, but also for
    # everything else you run in that shell. Don't enable this if you're not
    # sure this is what you want.

    #set "?"
}

export PROMPT_COMMAND='_update_ps1'

if [ "$TERM" != "linux" ] && [ -f "powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# Make sure additional SSH keys will be tried when making SSH connections
for key in $(cd ~/.ssh && ls | grep id_ | grep -v \\.pub$ ); do
    keychain --quiet $key
done

if [ -e ~/.keychain/$HOSTNAME-sh ]; then source ~/.keychain/$HOSTNAME-sh; fi

alias be='bundle exec'
alias bi='bundle install'
alias tmux='TERM=screen-256color-bce tmux'

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

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export ERL_AFLAGS="-kernel shell_history enabled"
# Now when you install Erlang, you'll have helpful docs in
# iex on erlang functions like you do Elixir functions. 
export KERL_BUILD_DOCS="yes"


# Enable the fuxxy finder keybindings
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FZF_DEFAULT_OPTS="-m --reverse --inline-info"
export FZF_DEFAULT_COMMAND='fd --type f'


eval "$(asdf exec direnv hook bash)"

