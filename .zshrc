# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias reload-zsh="source ~/.zshrc"
alias edit-zsh="nano ~/.zshrc"

# history config

HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=1000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# zsh plugins

source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# thefuck

eval $(thefuck --alias)
eval $(thefuck --alias fk)

# eza (better ls)

alias ls="eza --icons=always"

# zoxide (better cd)

alias cd="z"
eval "$(zoxide init zsh)"

# Aliases

git_current_branch () {
	local ref
	ref=$(__git_prompt_git symbolic-ref --quiet HEAD 2> /dev/null)
	local ret=$?
	if [[ $ret != 0 ]]
	then
		[[ $ret == 128 ]] && return
		ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null)  || return
	fi
	echo ${ref#refs/heads/}
}

alias gf="git fetch"
alias gfa="git fetch --all"
alias gluc="git pull upstream $(git_current_branch)"
alias gp="git push"
alias gpsup="git push --set-upstream origin $(git_current_branch)"
