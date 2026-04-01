# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth
export HISTSIZE=5000

export BASH_SILENCE_DEPRECATION_WARNING=1

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

export HOMEBREW_NO_AUTO_UPDATE=1 

if type brew &> /dev/null
then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f ~/.config/tree-pool/completion.sh ]; then
    . ~/.config/tree-pool/completion.sh
fi

export EDITOR="$(which nvim || which vim)"
alias vi="$(which nvim || which vim)"
alias vim="$(which nvim || which vim)"

if [ `uname` == "Darwin" ]; then
    # The following fixes iTerm issues.
    # unix2003 is the default in Terminal.app but not in iTerm it seems.
    export COMMAND_MODE=unix2003
fi

set -o vi

# Make sure additional SSH keys will be tried when making SSH connections
for key in $(cd ~/.ssh && ls | grep id_ | grep -v \\.pub$ ); do
    keychain --quiet $key
done

if [ -e ~/.keychain/$HOSTNAME-sh ]; then source ~/.keychain/$HOSTNAME-sh; fi

alias tmux='TERM=screen-256color-bce tmux'

eval "$(~/.local/bin/mise activate bash)"

export FZF_DEFAULT_OPTS="-m --reverse --inline-info"
export FZF_DEFAULT_COMMAND='fd --type f -H -E ".git"'

# pnpm
export PNPM_HOME="/Users/jamessadler/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Needed for atuin & PS1 updating
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh

precmd() {
    export PS1="$(powerline-go -newline -error $? -git-mode fancy)"
}

. "$HOME/.atuin/bin/env"
eval "$(atuin init bash)"

