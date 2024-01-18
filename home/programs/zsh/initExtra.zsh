# zsh options
setopt interactivecomments
unsetopt menu_complete
unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end

# configure completion styles
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

zstyle ':completion:*' group-name \'\'

function take() {
  mkdir "$1"
  cd "$1" || return 1
}

function clean_vscode_workspace_storage() {
  for i in "$HOME/Library/Application Support/Code/User/workspaceStorage/"*; do
    if [ -f $i/workspace.json ]; then
      older="$(python3 -c "import sys, json; print(json.load(open(sys.argv[1], 'r'))['folder'])" $i/workspace.json 2>/dev/null | sed 's#^file://##;s/+/ /g;s/%\(..\)/\\x\1/g;')";
      if [ -n "$folder" ] && [ ! -d "$folder" ]; then
        echo "Removing workspace $(basename $i) for deleted folder $folder of size $(du -sh $i|cut -f1)"; rm -rfv "$i";
      fi
    fi
  done
}

# nix-your-shell
eval "$(nix-your-shell zsh)"

# iTerm
[ -e "$HOME/.iterm2_shell_integration.zsh" ] && source "$HOME/.iterm2_shell_integration.zsh"
