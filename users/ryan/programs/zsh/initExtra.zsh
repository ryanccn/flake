# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

# zsh options
setopt interactivecomments
unsetopt menu_complete
unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end

export HISTFILE="$XDG_STATE_HOME"/zsh/history
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

# configure completion styles
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name \'\'

function take() {
  mkdir "$1"
  cd "$1" || return 1
}

# nix-your-shell
eval "$(nix-your-shell zsh)"

# Ghostty
[[ "$TERM_PROGRAM" == "ghostty" ]] && source "/Applications/Ghostty.app/Contents/Resources/ghostty/shell-integration/zsh/ghostty-integration"
