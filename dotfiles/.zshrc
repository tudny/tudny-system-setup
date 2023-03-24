
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode reminder

plugins=(
	git
    zsh-autosuggestions
	zsh-syntax-highlighting
	bazel
)

source $ZSH/oh-my-zsh.sh

source ~/.zsh_scripts


[ -f "/home/tudny/.ghcup/env" ] && source "/home/tudny/.ghcup/env" # ghcup-env

